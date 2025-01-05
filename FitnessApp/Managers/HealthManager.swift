//
//  HealthManager.swift
//  FitnessApp
//
//  Created by Doğan Ensar Papuçcuoğlu on 3.01.2025.
//

import Foundation
import HealthKit

extension Date {
    static var startOfDay: Date {
        let calendar = Calendar.current
        return calendar.startOfDay(for: Date())
    }
    
    static var startOfWeek: Date {
        let calendar = Calendar.current
        var components =  calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date())
        components.weekday = 2
        return calendar.date(from: components) ?? Date()
    }
    
    func fetchMonthStartAndEndDate()-> (Date, Date){
        let calendar = Calendar.current
        let startDateComponent = calendar.dateComponents([.year, .month], from: calendar.startOfDay(for: self))
        let startDate = calendar.date(from: startDateComponent) ?? self
        let endDate = calendar.date(byAdding: DateComponents(month: 1, day: -1), to: startDate) ?? self
        return (startDate, endDate)
    }
    
    func formatWorkoutDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        return formatter.string(from: self)
    }
    
}

extension Double {
    func formattedNumberString() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
    
        return formatter.string(from: NSNumber(value: self)) ?? "0"
    }
}

class HealthManager {
    
    static let shared = HealthManager()
    let healthStore = HKHealthStore()
    
    private init() {
  
        Task {
            do {
                try await requestHealthKitAccess()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func requestHealthKitAccess() async throws {
        let calories = HKQuantityType(.activeEnergyBurned)
        let exercise = HKQuantityType(.appleExerciseTime)
        let stand = HKCategoryType(.appleStandHour)
        let steps = HKQuantityType(.stepCount)
        let healthTypes: Set = [calories, exercise, stand, steps]
        
        try await healthStore.requestAuthorization(toShare: [], read: healthTypes)
    }
    
    func fetchTodayCaloriesBurned(completion: @escaping(Result<Double, Error>) -> Void) {
        let calories = HKQuantityType(.activeEnergyBurned)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKStatisticsQuery(quantityType: calories, quantitySamplePredicate: predicate) { _, result, error in
            guard let quantity = result?.sumQuantity(), error == nil else {
                completion(.failure(URLError(.badURL)))
                return
            }
            let caloriesCount = quantity.doubleValue(for: .kilocalorie())
            completion(.success(caloriesCount))
        }
        
        healthStore.execute(query)
        
        
        return completion(.success(123.0))
    }
    
    func fetchTodayExerciseTime(completion: @escaping(Result<Double, Error>) -> Void) {
        let exercise = HKQuantityType(.appleExerciseTime)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKStatisticsQuery(quantityType: exercise, quantitySamplePredicate: predicate) { _, result, error in
            guard let quantity = result?.sumQuantity(), error == nil else {
                completion(.failure(URLError(.badURL)))
                return
            }
            let exerciseTime = quantity.doubleValue(for: .minute())
            completion(.success(exerciseTime))
            
        }
        healthStore.execute(query)
        
        
        return completion(.success(52.0))
    }
    
    func fetchTodayStandHours(completion: @escaping(Result<Int, Error>) -> Void) {
        let stand = HKCategoryType(.appleStandHour)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKSampleQuery(sampleType: stand, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { _, result, error in
            guard let samples = result as? [HKCategorySample], error == nil else {
                completion(.failure(URLError(.badURL)))
                return
            }
            let standCount = samples.filter({$0.value == 0}).count
            completion(.success(standCount))
        }
        healthStore.execute(query)
    }
    
    //MARK: Fitness Activity
    func fetchTodaySteps(completion: @escaping(Result<Activity, Error>)-> Void) {
        let steps = HKQuantityType(.stepCount)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKStatisticsQuery(quantityType: steps, quantitySamplePredicate: predicate) { _, result, error in
            guard let quantity = result?.sumQuantity(), error == nil else {
                completion(.failure(URLError(.badURL)))
                return
            }
            let steps = quantity.doubleValue(for: .count())
            print(steps)
            let activity = Activity(title: "Today Steps", subtitle: "Goal 10,000", image: "figure.walk", tintColor: .green, amount: steps.formattedNumberString())
            completion(.success(activity))
            
        }
        healthStore.execute(query)
    }
    
    func fetchCurrentWeekWorkoutStats(completion: @escaping(Result<[Activity], Error>) -> Void) {
        let workouts = HKSampleType.workoutType()
        let predicate = HKQuery.predicateForSamples(withStart: .startOfWeek, end: Date())
        let query = HKSampleQuery(sampleType: workouts, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) {[weak self] _, results, error in
            guard let self = self else {return}
            guard let samples = results as? [HKWorkout], error == nil else {
                completion(.failure(URLError(.badURL)))
                return
            }
            var runningCount: Int = 0
            var strengthCount: Int = 0
            var soccerCount: Int = 0
            var basketballCount: Int = 0
            var stairsCount: Int = 0
            var kickboxingCount: Int = 0
            
            for sample in samples {
                let duration = Int(sample.duration)/60
                if sample.workoutActivityType == .running {
                    runningCount += duration
                } else if sample.workoutActivityType == .traditionalStrengthTraining {
                    strengthCount += duration
                } else if sample.workoutActivityType == .soccer {
                    soccerCount += duration
                } else if sample.workoutActivityType == .basketball {
                    basketballCount += duration
                } else if sample.workoutActivityType == .stairs {
                    stairsCount += duration
                } else if sample.workoutActivityType == .kickboxing {
                    kickboxingCount += duration
                }
                
            }
            
            completion(.success(self.generateActivitiesFromDurations(running: runningCount, strength: strengthCount, soccer: soccerCount, basketball: basketballCount, stairs: stairsCount, kickboxing: kickboxingCount)))
        }
        healthStore.execute(query)
    }
    
    func generateActivitiesFromDurations(running: Int, strength: Int, soccer: Int, basketball: Int, stairs: Int, kickboxing: Int) -> [Activity] {
        return [
            Activity(title: "Running", subtitle: "This Week", image: "figure.run", tintColor: .green, amount: "\(running) mins"),
            Activity(title: "Strength Training", subtitle: "This Week", image: "dumbbell", tintColor: .blue, amount: "\(strength) mins"),
            Activity(title: "Soccer", subtitle: "This Week", image: "figure.soccer", tintColor: .indigo, amount: "\(soccer) mins"),
            Activity(title: "Basketball", subtitle: "This Week", image: "figure.basketball", tintColor: .purple, amount: "\(basketball) mins"),
            Activity(title: "Stairs", subtitle: "This Week", image: "figure.stairs", tintColor: .pink, amount: "\(stairs) mins"),
            Activity(title: "Kickboxing", subtitle: "This Week", image: "figure.kickboxing", tintColor: .red, amount: "\(kickboxing) mins"),
        ]
    }
    
    //MARK: Recent Workouts
    func fetchWorkoutsForMonth(month: Date, completion: @escaping(Result<[Workout], Error>)-> Void) {
        let workouts = HKSampleType.workoutType()
        let (startDate, endDate) = month.fetchMonthStartAndEndDate()
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate)
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        let query = HKSampleQuery(sampleType: workouts, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: [sortDescriptor]) { _, samples, error in
            guard let samples = samples as? [HKWorkout], error == nil else {
                completion(.failure(URLError(.badURL)))
                return
            }
            let workoutsArray = samples.map({Workout(title: $0.workoutActivityType.name, image: $0.workoutActivityType.imageName, duration: "\(Int($0.duration)/60)", calories: $0.totalEnergyBurned?.doubleValue(for: .kilocalorie()).formattedNumberString() ?? "-", date: $0.startDate.formatWorkoutDate(), tintColor: $0.workoutActivityType.color)})
            completion(.success(workoutsArray))
        }
        healthStore.execute(query)
    }
    
   
}

