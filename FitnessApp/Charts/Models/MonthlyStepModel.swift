//
//  MonthlyStepModel.swift
//  FitnessApp
//
//  Created by Doğan Ensar Papuçcuoğlu on 6.01.2025.
//

import Foundation

struct MonthlyStepModel: Identifiable{
    let id = UUID()
    let date: Date
    let count: Int
}
