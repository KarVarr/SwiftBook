//
//  ContentView.swift
//  Executive Timer
//
//  Created by Karen Vardanian on 15.01.2024.
//

import SwiftUI


struct ContentView: View {
    let defaultTime: CGFloat = 20
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    @State private var timerRunning = false
    @State private var countdownTime: CGFloat = 20 // Initial value, you may want to adjust this

    var strokeStyle: StrokeStyle {
        StrokeStyle(lineWidth: 15, lineCap: .round)
    }

    var buttonIcon: String {
        timerRunning ? "pause.rectangle.fill" : "play.rectangle.fill"
    }

    var countdownColor: Color {
        switch countdownTime {
        case 6...: return Color.green
        case 3...: return Color.yellow
        default: return Color.red
        }
    }

    var body: some View {
        VStack {
            Circle()
                .stroke(Color.gray.opacity(0.2), style: strokeStyle)
                .frame(width: 300, height: 300)

            Circle()
                .trim(from: 0, to: 1 - ((defaultTime - countdownTime) / defaultTime))
                .stroke(countdownColor, style: strokeStyle)
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut) // You can use withAnimation here if needed
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
