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
    
    @Published var mockActivities: [Activity] = [
        Activity(id: 0, title: "Today Steps", subtitle: "Goal 10,000", image: "figure.walk", tintColor: .green, amount: "6121"),
        Activity(id: 1, title: "Today Steps", subtitle: "Goal 10,000", image: "figure.walk", tintColor: .red, amount: "6121"),
        Activity(id: 2, title: "Today Steps", subtitle: "Goal 10,000", image: "figure.walk", tintColor: .blue, amount: "6121"),
        Activity(id: 3, title: "Today Steps", subtitle: "Goal 10,000", image: "figure.walk", tintColor: .purple, amount: "6121")
    ]
    
    @Published var mockWorkouts: [Workout] = [
        Workout(id: 0, title: "Running", image: "figure.run", duration: "23 mins", calories: "341 kcal", date: "Aug 3", tintColor: .green),
        Workout(id: 1, title: "Running", image: "figure.run", duration: "23 mins", calories: "341 kcal", date: "Aug 3", tintColor: .red),
        Workout(id: 2, title: "Running", image: "figure.run", duration: "23 mins", calories: "341 kcal", date: "Aug 3", tintColor: .blue),
        Workout(id: 3, title: "Running", image: "figure.run", duration: "23 mins", calories: "341 kcal", date: "Aug 3", tintColor: .cyan)
    ]
    
    init() {
        Task {
            do {
                try await healthManager.requestHealthKitAccess()
                fetchTodayCalories()
                fetchTodayExerciseTime()
                fetchTodayStandHours()
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
}
