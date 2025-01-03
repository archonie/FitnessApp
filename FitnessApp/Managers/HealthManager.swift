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
        
        let healthTypes: Set = [calories, exercise, stand]
        
        try await healthStore.requestAuthorization(toShare: [], read: healthTypes)
    }
    
    func fetchTodayCaloriesBurned(completion: @escaping(Result<Double, Error>) -> Void) {
//        if let calories = HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned) {
//            let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
//            let query = HKStatisticsQuery(quantityType: calories, quantitySamplePredicate: predicate) { _, result, error in
//                guard let quantity = result?.sumQuantity(), error == nil else {
//                    completion(.failure(NSError()))
//                    return
//                }
//                let caloriesCount = quantity.doubleValue(for: .kilocalorie())
//                completion(.success(caloriesCount))
//                                
//            }
//            healthStore.execute(query)
//        }
        
        return completion(.success(123.0))
    }
    
    func fetchTodayExerciseTime(completion: @escaping(Result<Double, Error>) -> Void) {
//        if let exercise = HKQuantityType.quantityType(forIdentifier: .appleExerciseTime) {
//            let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
//            let query = HKStatisticsQuery(quantityType: exercise, quantitySamplePredicate: predicate) { _, result, error in
//                guard let quantity = result?.sumQuantity(), error == nil else {
//                    completion(.failure(NSError(domain: "HealthKit", code: 2, userInfo: [NSLocalizedDescriptionKey: "No data found"])))
//                    return
//                }
//                let exerciseTime = quantity.doubleValue(for: .minute())
//                completion(.success(exerciseTime))
//                
//            }
//            healthStore.execute(query)
//        }
        
        return completion(.success(52.0))
    }
    
    func fetchTodayStandHours(completion: @escaping(Result<Int, Error>) -> Void) {
        let stand = HKCategoryType(.appleStandHour)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKSampleQuery(sampleType: stand, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { _, result, error in
            guard let samples = result as? [HKCategorySample], error == nil else {
                completion(.failure(NSError()))
                return
            }
            let standCount = samples.filter({$0.value == 0}).count
            completion(.success(standCount))
        }
        healthStore.execute(query)
    }
}
