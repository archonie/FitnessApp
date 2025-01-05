//
//  HomeViewModel.swift
//  FitnessApp
//
//  Created by Doğan Ensar Papuçcuoğlu on 3.01.2025.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    let healthManager = HealthManager.shared
    
    @Published var calories: Int = 123
    @Published var active: Int = 52
    @Published var stand: Int = 8
    @Published var activities: [Activity] = []
    @Published var recentWorkouts: [Workout] = []
    
    @Published var mockActivities: [Activity] = [
        Activity(title: "Today Steps", subtitle: "Goal 10,000", image: "figure.walk", tintColor: .green, amount: "6121"),
        Activity(title: "Today Steps", subtitle: "Goal 10,000", image: "figure.walk", tintColor: .red, amount: "6121"),
        Activity(title: "Today Steps", subtitle: "Goal 10,000", image: "figure.walk", tintColor: .blue, amount: "6121"),
        Activity(title: "Today Steps", subtitle: "Goal 10,000", image: "figure.walk", tintColor: .purple, amount: "6121")
    ]
    
    @Published var mockWorkouts: [Workout] = [
        Workout(title: "Running", image: "figure.run", duration: "23 mins", calories: "341 kcal", date: "Aug 3", tintColor: .green),
        Workout(title: "Running", image: "figure.run", duration: "23 mins", calories: "341 kcal", date: "Aug 3", tintColor: .red),
        Workout(title: "Running", image: "figure.run", duration: "23 mins", calories: "341 kcal", date: "Aug 3", tintColor: .blue),
        Workout(title: "Running", image: "figure.run", duration: "23 mins", calories: "341 kcal", date: "Aug 3", tintColor: .cyan)
    ]
    
    init() {
        Task {
            do {
                try await healthManager.requestHealthKitAccess()
                fetchTodayCalories()
                fetchTodayExerciseTime()
                fetchTodayStandHours()
                fetchTodaySteps()
                fetchCurrentWeekActivities()
                fetchRecentWorkouts()
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
    
    func fetchTodayCalories() {
        healthManager.fetchTodayCaloriesBurned { result in
            switch result {
            case .success(let caloriesBurned):
                DispatchQueue.main.async {
                    self.calories = Int(caloriesBurned)
                    let activity = Activity(title: "Calories Burned", subtitle: "Today", image: "flame", tintColor: .red, amount: caloriesBurned.formattedNumberString())
                    self.activities.append(activity)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchTodayExerciseTime() {
        healthManager.fetchTodayExerciseTime { result in
            switch result {
            case .success(let exerciseTime):
                DispatchQueue.main.async {
                    self.active = Int(exerciseTime)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchTodayStandHours() {
        healthManager.fetchTodayStandHours { result in
            switch result {
            case .success(let standHours):
                DispatchQueue.main.async {
                    self.stand = standHours
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    //MARK: Fitness Activity
    func fetchTodaySteps() {
        healthManager.fetchTodaySteps { result in
            switch result {
            case .success(let steps):
                DispatchQueue.main.async {
                    self.activities.append(steps)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func fetchCurrentWeekActivities() {
        healthManager.fetchCurrentWeekWorkoutStats { results in
            switch results {
            case .success(let activities):
                DispatchQueue.main.async {
                    self.activities.append(contentsOf: activities)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
 
    //MARK: Recent Workouts
    func fetchRecentWorkouts() {
        healthManager.fetchWorkoutsForMonth(month: Date()) { results in
            switch results {
            case .success(let workouts):
                DispatchQueue.main.async {
                    self.recentWorkouts.append(contentsOf: workouts)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
}
