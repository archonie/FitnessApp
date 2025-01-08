//
//  ChartsView.swift
//  FitnessApp
//
//  Created by Doğan Ensar Papuçcuoğlu on 5.01.2025.
//

import SwiftUI
import Charts

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
                    VStack {
                        ChartDataView(average: viewModel.oneWeekAverage, total: viewModel.oneWeekTotal)
                        Chart {
                            ForEach(viewModel.mockChartDataOneWeek) { data in
                                BarMark(x: .value(data.date.formatted(), data.date, unit: .day), y: .value("Steps", data.count) )
                            }
                        }
                    }
                case .oneMonth:
                    VStack {
                        ChartDataView(average: viewModel.oneMonthAverage, total: viewModel.oneMonthTotal)
                        Chart {
                            ForEach(viewModel.mockChartDataOneMonth) { data in
                                BarMark(x: .value(data.date.formatted(), data.date, unit: .day), y: .value("Steps", data.count) )
                            }
                        }
                    }
                case .threeMonths:
                    VStack {
                        ChartDataView(average: viewModel.threeMonthsAverage, total: viewModel.threeMonthsTotal)
                        Chart {
                            ForEach(viewModel.mockChartDataThreeMonths) { data in
                                BarMark(x: .value(data.date.formatted(), data.date, unit: .day), y: .value("Steps", data.count) )
                            }
                        }
                    }
                case .yearToDate:
                    VStack {
                        ChartDataView(average: viewModel.yearToDateAverage, total: viewModel.yearToDateTotal)
                        Chart {
                            ForEach(viewModel.ytdChartData) { data in
                                BarMark(x: .value(data.date.formatted(), data.date, unit: .month), y: .value("Steps", data.count) )
                            }
                        }
                    }
                case .oneYear:
                    VStack {
                        ChartDataView(average: viewModel.oneYearAverage, total: viewModel.oneYearTotal)
                        Chart {
                            ForEach(viewModel.oneYearChartData) { data in
                                BarMark(x: .value(data.date.formatted(), data.date, unit: .month), y: .value("Steps", data.count) )
                            }
                        }
                    }
                }
            }
            .foregroundStyle(.green)
            .frame(maxHeight: 450)
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
