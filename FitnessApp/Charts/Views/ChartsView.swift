//
//  ChartsView.swift
//  FitnessApp
//
//  Created by Doğan Ensar Papuçcuoğlu on 5.01.2025.
//

import SwiftUI
import Charts

struct DailyStepModel: Identifiable{
    let id = UUID()
    let date: Date
    let count: Double
}

enum ChartOptions: String, CaseIterable {
    case oneWeek = "1W"
    case oneMonth = "1M"
    case threeMonths = "3M"
    case yearToDate = "YTD"
    case oneYear = "1Y"
}

class ChartsViewModel: ObservableObject {
    let mockChartDataOneWeek = (0..<7).map {
        DailyStepModel(
            date: Calendar.current.date(byAdding: .day, value: -$0, to: Date()) ?? Date(),
            count: Double(Int.random(in: 1000...20000)) // Randomized step counts for variety
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
  
}

struct ChartsView: View {
    @StateObject var viewModel = ChartsViewModel()
    @State var selectedChart = ChartOptions.oneWeek
    
    var body: some View {
        VStack {
            Text("Charts")
                .font(.largeTitle)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            ZStack {
                switch selectedChart {
                case .oneWeek:
                    Chart {
                        ForEach(viewModel.mockChartDataOneWeek) { data in
                            BarMark(x: .value(data.date.formatted(), data.date, unit: .day), y: .value("Steps", data.count) )
                        }
                    }
                case .oneMonth:
                    Chart {
                        ForEach(viewModel.mockChartDataOneMonth) { data in
                            BarMark(x: .value(data.date.formatted(), data.date, unit: .day), y: .value("Steps", data.count) )
                        }
                    }
                case .threeMonths:
                    Chart {
                        ForEach(viewModel.mockChartDataThreeMonths) { data in
                            BarMark(x: .value(data.date.formatted(), data.date, unit: .day), y: .value("Steps", data.count) )
                        }
                    }
                case .yearToDate:
                    EmptyView()
                case .oneYear:
                    EmptyView()
                }
            }
            .foregroundStyle(.green)
            .frame(maxHeight: 350)
            .padding(.horizontal)
            HStack {
                ForEach(ChartOptions.allCases, id: \.rawValue) { option in
                    Button(option.rawValue) {
                        withAnimation {
                            selectedChart = option
                        }
                    }
                    .padding()
                    .foregroundColor(selectedChart == option ? .white : .green)
                    .background(selectedChart == option ? .green : .clear)
                    .cornerRadius(10)
                }
            }
            .padding(.top)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        
    }
}

#Preview {
    ChartsView()
}
