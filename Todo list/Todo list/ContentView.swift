//
//  ContentView.swift
//  Todo list
//
//  Created by Karen Vardanian on 14.01.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var currentTodo = ""
    @State private var todos: [Item] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("New todo...", text: $currentTodo)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button {
                        guard !self.currentTodo.isEmpty else { return }
                        self.todos.append(Item(todo: self.currentTodo))
                        self.currentTodo = ""
                    } label: {
                        Image(systemName: "text.badge.plus")
                    }
                    .padding(.leading, 5)

                }
                .padding()
                
                List {
                    Text("This is something in my list!")
                    Text("This is also in my list!")
                    Text("And another thing!")
                }
            }
            .navigationTitle("Todo List")
        }
    }
}

#Preview {
    ContentView()
}
