//
//  ChartDataView.swift
//  FitnessApp
//
//  Created by Doğan Ensar Papuçcuoğlu on 6.01.2025.
//

import SwiftUI

struct ChartDataView: View {
    @State var average: Int
    @State var total: Int
    var body: some View {
        HStack {
            Spacer()
            VStack(spacing: 16) {
                Text("Average")
                    .font(.title2)
                Text("\(average)")
                    .font(.title3)
            }
            .frame(width: 90)
            .foregroundColor(.green)
            .padding()
            .background(.gray.opacity(0.1))
            .cornerRadius(10)
            Spacer()
            VStack(spacing: 16) {
                Text("Total")
                    .font(.title2)
                Text("\(total)")
                    .font(.title3)
            }
            .frame(width: 90)
            .foregroundColor(.green)
            .padding()
            .background(.gray.opacity(0.1))
            .cornerRadius(10)
            Spacer()
        }
        .padding(.bottom)
    }
}

#Preview {
    ChartDataView(average: 1258, total: 12345)
}
