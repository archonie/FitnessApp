//
//  HomeViewModel.swift
//  FitnessApp
//
//  Created by Doğan Ensar Papuçcuoğlu on 3.01.2025.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @State var calories: Int = 123
    @State var active: Int = 52
    @State var stand: Int = 8
    
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
}
