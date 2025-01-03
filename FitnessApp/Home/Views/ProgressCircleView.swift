//
//  ProgressCircleView.swift
//  FitnessApp
//
//  Created by Doğan Ensar Papuçcuoğlu on 3.01.2025.
//

import SwiftUI

struct ProgressCircleView: View {
    @Binding var progress: Int
    var goal: Int
    var tint: Color
    private let width: CGFloat = 20
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(tint.opacity(0.3), lineWidth: width)
            Circle()
                .trim(from: 0, to: CGFloat(progress) / CGFloat(goal))
                .stroke(tint, style: StrokeStyle(lineWidth: width,  lineCap: .round))
                .rotationEffect(.degrees(-90))
                .shadow(radius: 5)
        }
        .padding()
    }
}

#Preview {
    ProgressCircleView(progress: .constant(100), goal: 200, tint: .red)
}
