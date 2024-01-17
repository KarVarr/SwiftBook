//
//  ViewB.swift
//  Executive Timer
//
//  Created by Karen Vardanian on 17.01.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TimerView()
                .padding()
                .tabItem {
                Label("Timer", systemImage: "timer" )
                
            }
            .tag("Timer")
            
            TimerSettingsView()
                .padding()
                .tabItem {
                
                Label("Settings", systemImage: "gear")
            }
            .tag("Settings")
        }
    }
}

#Preview {
    ContentView()
}
