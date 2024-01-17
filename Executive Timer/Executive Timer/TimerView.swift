//
//  ContentView.swift
//  Executive Timer
//
//  Created by Karen Vardanian on 15.01.2024.
//

import SwiftUI


struct TimerView: View {
    let defaultTime: CGFloat = 25
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let `struct` = "struct"

    @State private var timerRunning = false
    @State private var countdownTime: CGFloat = 25
    @State private var currentDate: String = ""

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
            VStack(alignment: .leading) {
                
                HStack {
                    Text("struct")
                        .foregroundStyle(.purple)
                    Text("AppName {")
                        .foregroundStyle(.cyan)
                }
                HStack {
                    Text("      var")
                        .foregroundStyle(.orange)
                    Text("currentDate: ")
                        .foregroundStyle(.blue)
                    Text("\(currentDate)")
                        .foregroundStyle(.yellow)
                    
                }
                
                Text("""
            struct AppName {
                var currentDate: \(currentDate)
            }
            var time: PM = 22:01
            var battery: Normal = 56%
            
            """
                )
                .foregroundStyle(.pink)
                .onAppear(perform: {
                    getCurrentDate()
                })
            }
            ZStack {
                RoundedRectangle(cornerSize: CGSize(width: 70, height: 70), style: .continuous)
                    .stroke(Color.gray.opacity(0.2), style: strokeStyle)
                
                RoundedRectangle(cornerSize: CGSize(width: 30, height: 30), style: .continuous)
                    .trim(from: 0, to: 1 - ((defaultTime - countdownTime) / defaultTime))
                    .stroke(countdownColor, style: strokeStyle)
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut)
                
                HStack(spacing: 25) {
                    Label("", systemImage: buttonIcon)
                        .foregroundStyle(.black).font(.title)
                        .onTapGesture(perform: {
                            timerRunning.toggle()
                        })
                    Text("\(Int(countdownTime))")
                        .font(.largeTitle)
                    Label("", systemImage: "gobackward")
                        .foregroundStyle(.red)
                        .onTapGesture(perform: {
                            timerRunning = false
                            countdownTime = defaultTime
                        })
                }
            }
            .frame(width: 300, height: 300)
            .onReceive(timer, perform: { _ in
                guard timerRunning else { return }
                if countdownTime > 0 {
                    countdownTime -= 1
                } else {
                    timerRunning = false
                    countdownTime = defaultTime
                }
            })
        }
        
    
        
    }
    
    func getCurrentDate() {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            
            let currentDate = Date()
            self.currentDate = dateFormatter.string(from: currentDate)
        }
    
}
    
    


#Preview {
    TimerView()
}
