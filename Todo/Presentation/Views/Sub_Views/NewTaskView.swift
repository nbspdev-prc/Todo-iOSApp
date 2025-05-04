//
//  NewTaskView.swift
//  Todo
//
//  Created by Percy Pham on 2025-04-29.
//

import SwiftUI

struct NewTaskView: View {
    var saveTask: (Task) -> ()
    @State private var taskTitle: String = ""
    @State private var taskDate: Date = .init()
    @State private var showAlert = false
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        VStack {
            Text("Add new task")
                .fontDesign(.rounded)
                .font(.title2)
                .padding(30)
                .frame(maxWidth: .infinity)
                .background {
                    Rectangle()
                        .fill(Color(hex: "A1C8B5").opacity(0.6))
                        .clipShape(.rect())
                }
                .foregroundStyle(Color(hex: "2C3E36"))

            VStack {
                TextField("Your task title", text: $taskTitle)
                    .padding(.top)

                HStack(alignment: .center, spacing: 20) {
                    Text("Timeline")
                        .font(.title3)
                    DatePicker("", selection: $taskDate, displayedComponents: .date)
                        .datePickerStyle(.compact)
                        .foregroundStyle(Color(hex: "2C3E36"))

                }
            }
            .padding(30)
            
            Button {
                if taskTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    showAlert = true
                } else {
                    saveTask(Task(title: taskTitle, date: taskDate))
                    dismiss()
                }

            } label: {
                Text("Create Task")
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .foregroundColor(.white)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(hex: "A1C8B5"),
                                Color(hex: "71ad9a")]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ))
                    .clipShape(.rect(cornerRadius: 20))
                    .padding(.horizontal, 30)
            }
        }
        .ignoresSafeArea(edges: .top)
        .alert("Missing Title", isPresented: $showAlert) {
            Button("OK", role:.cancel) {}
        } message: {
            Text("Please enter a task title before creating the task.")
        }
    }
}

#Preview {
    TasksHomePage(viewModel: TasksHomePageViewModel(dateUseCase: DateUseCase(dateRepository: DateRepository(dateDataProvider: DateDataProvider())), taskUseCase: TaskUseCase(taskRepository: TaskRepository(taskDataProvider: TaskDataProvider()))))
}
