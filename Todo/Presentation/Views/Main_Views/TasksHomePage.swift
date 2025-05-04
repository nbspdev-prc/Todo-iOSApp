//
//  ContentView.swift
//  Todo
//
//  Created by Percy Pham on 2025-04-28.
//

import SwiftUI

struct TasksHomePage: View {
    @State private var createNewTask: Bool = false
    @ObservedObject var viewModel: TasksHomePageViewModel
    
    var body: some View {
        ZStack {
            VStack {
                DateHeaderView(viewModel: viewModel)
                ScrollView(.vertical) {
                    VStack(alignment: .leading) {
                        TaskListView(viewModel: viewModel)
                    }
                }
                .scrollIndicators(.hidden)
            }
            .padding()
            .overlay(alignment: .bottomTrailing) {
                Button {
                    createNewTask.toggle()
                } label: {
                    Image(systemName: "plus")
                        .imageScale(.large)
                        .padding(26)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(hex: "A1C8B5"),
                                    Color(hex: "527d6f")]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ))
                        .clipShape(Circle())
                        .foregroundColor(Color(.systemBackground))
                        .padding(.horizontal)
                }
            }
        }
        .sheet(isPresented: $createNewTask) {
            NewTaskView(selectedDate: viewModel.selectedDate) { task in
                viewModel.updateTaskList(task: task)
            }
            .presentationDetents([.fraction(0.4)])
        }
    }
}

#Preview {
    TasksHomePage(viewModel: TasksHomePageViewModel(dateUseCase: DateUseCase(dateRepository: DateRepository(dateDataProvider: DateDataProvider())), taskUseCase: TaskUseCase(taskRepository: TaskRepository(taskDataProvider: TaskDataProvider()))))
}
