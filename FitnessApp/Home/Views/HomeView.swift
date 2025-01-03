//
//  HomeView.swift
//  FitnessApp
//
//  Created by Doğan Ensar Papuçcuoğlu on 3.01.2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
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
                                Text("\(viewModel.calories) kcal")
                                    .bold()
                            }
                            .padding(.bottom)
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Active")
                                    .font(.callout)
                                    .bold()
                                    .foregroundStyle(.green)
                                Text("\(viewModel.active) mins")
                                    .bold()
                            }
                            .padding(.bottom)
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Stand")
                                    .font(.callout)
                                    .bold()
                                    .foregroundStyle(.blue)
                                Text("\(viewModel.stand) hours")
                                    .bold()
                            }
                        }
                        Spacer()
                        ZStack {
                            ProgressCircleView(progress: $viewModel.calories, goal: 600, tint: .red)
                            ProgressCircleView(progress: $viewModel.active, goal: 60, tint: .green)
                                .padding(20)
                            ProgressCircleView(progress: $viewModel.stand, goal: 12, tint: .blue)
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
                        ForEach(viewModel.mockActivities, id: \.id) { activity in
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
                        ForEach(viewModel.mockWorkouts, id: \.id) { workout in
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
