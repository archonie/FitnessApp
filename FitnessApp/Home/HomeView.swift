//
//  HomeView.swift
//  FitnessApp
//
//  Created by Doğan Ensar Papuçcuoğlu on 3.01.2025.
//

import SwiftUI

struct HomeView: View {
    @State var calories: Int = 123
    @State var active: Int = 52
    @State var stand: Int = 8
    
    var mockActivities: [Activity] = [
        Activity(id: 0, title: "Today Steps", subtitle: "Goal 10,000", image: "figure.walk", tintColor: .green, amount: "6121"),
        Activity(id: 1, title: "Today Steps", subtitle: "Goal 10,000", image: "figure.walk", tintColor: .red, amount: "6121"),
        Activity(id: 2, title: "Today Steps", subtitle: "Goal 10,000", image: "figure.walk", tintColor: .blue, amount: "6121"),
        Activity(id: 3, title: "Today Steps", subtitle: "Goal 10,000", image: "figure.walk", tintColor: .purple, amount: "6121")
    ]
    
    var mockWorkouts: [Workout] = [
        Workout(id: 0, title: "Running", image: "figure.run", duration: "23 mins", calories: "341 kcal", date: "Aug 3", tintColor: .green),
        Workout(id: 1, title: "Running", image: "figure.run", duration: "23 mins", calories: "341 kcal", date: "Aug 3", tintColor: .red),
        Workout(id: 2, title: "Running", image: "figure.run", duration: "23 mins", calories: "341 kcal", date: "Aug 3", tintColor: .blue),
        Workout(id: 3, title: "Running", image: "figure.run", duration: "23 mins", calories: "341 kcal", date: "Aug 3", tintColor: .cyan)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    Text("Welcome")
                        .font(.largeTitle)
                        .padding()
                    HStack {
                        Spacer()
                        VStack {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Calories")
                                    .font(.callout)
                                    .bold()
                                    .foregroundStyle(.red)
                                Text("123 kcal")
                                    .bold()
                            }
                            .padding(.bottom)
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Active")
                                    .font(.callout)
                                    .bold()
                                    .foregroundStyle(.green)
                                Text("52 mins")
                                    .bold()
                            }
                            .padding(.bottom)
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Stand")
                                    .font(.callout)
                                    .bold()
                                    .foregroundStyle(.blue)
                                Text("8 hours")
                                    .bold()
                            }
                        }
                        Spacer()
                        ZStack {
                            ProgressCircleView(progress: $calories, goal: 600, tint: .red)
                            ProgressCircleView(progress: $active, goal: 60, tint: .green)
                                .padding(20)
                            ProgressCircleView(progress: $stand, goal: 12, tint: .blue)
                                .padding(40)
                        }
                        .padding(.horizontal)
                        Spacer()
                    }
                    .padding()
                    HStack {
                        Text("Fitness Activity")
                            .font(.title2)
                        Spacer()
                        Button {
                            print("show more")
                        } label: {
                            Text("Show More")
                                .padding(.all, 10 )
                                .foregroundStyle(.white)
                                .background(.blue)
                                .cornerRadius(20)
                        }
                    }
                    .padding(.horizontal)
                    LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)) {
                        ForEach(mockActivities, id: \.id) { activity in
                            ActivityCard(activity: activity)
                        }
                    }
                    .padding(.horizontal)
                    HStack {
                        Text("Recent Workouts")
                            .font(.title2)
                        Spacer()
                        NavigationLink {
                            EmptyView()
                        } label: {
                            Text("Show More")
                                .padding(.all, 10 )
                                .foregroundStyle(.white)
                                .background(.blue)
                                .cornerRadius(20)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    LazyVStack {
                        ForEach(mockWorkouts, id: \.id) { workout in
                            WorkoutCard(workout: workout)
                        }
                    }
                    .padding(.bottom)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
