//
//  ChartsViewModel.swift
//  FitnessApp
//
//  Created by Doğan Ensar Papuçcuoğlu on 6.01.2025.
//

import SwiftUI

class ChartsViewModel: ObservableObject {
    let mockChartDataOneWeek = (0..<7).map {
        DailyStepModel(
            date: Calendar.current.date(byAdding: .day, value: -$0, to: Date()) ?? Date(),
            count: Double(Int.random(in: 1000...20000)) // Randomized step counts for variety
        )
    }
    
    let mockChartDataYTD = (0..<12).map {
        MonthlyStepModel(
            date: Calendar.current.date(byAdding: .month, value: -$0, to: Date()) ?? Date(),
            count: Int.random(in: 1000...20000) // Randomized step counts for variety
        )
    }
    
    
    let mockChartDataOneMonth = (0..<30).map {
        DailyStepModel(
            date: Calendar.current.date(byAdding: .day, value: -$0, to: Date()) ?? Date(),
            count: Double(Int.random(in: 1000...20000)) // Randomized step counts for variety
        )
    }

    // Mock data for three months (90 days)
    let mockChartDataThreeMonths = (0..<90).map {
        DailyStepModel(
            date: Calendar.current.date(byAdding: .day, value: -$0, to: Date()) ?? Date(),
            count: Double(Int.random(in: 1000...20000)) // Randomized step counts for variety
        )
    }
    
    @Published var oneWeekAverage = 1243
    @Published var oneWeekTotal = 87852
    
    @Published var oneMonthAverage = 15813
    @Published var oneMonthTotal = 126751
    
    @Published var threeMonthsAverage = 15871
    @Published var threeMonthsTotal = 623451
    
    @Published var yearToDateAverage = 11100
    @Published var yearToDateTotal = 1231561
    
    @Published var oneYearAverage = 12678
    @Published var oneYearTotal = 2347897
}
