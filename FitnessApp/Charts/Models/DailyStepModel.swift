//
//  DailyStepModel.swift
//  FitnessApp
//
//  Created by Doğan Ensar Papuçcuoğlu on 6.01.2025.
//
import Foundation

struct DailyStepModel: Identifiable{
    let id = UUID()
    let date: Date
    let count: Double
}
