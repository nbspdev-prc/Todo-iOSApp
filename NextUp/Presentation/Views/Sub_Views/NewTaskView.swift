//
//  NewTaskView.swift
//  Todo
//
//  Created by Percy Pham on 2025-04-29.
//

import SwiftUI

struct NewTaskView: View {
    var selectedDate: Date
    var saveTask: (Task) -> ()

    @State private var taskTitle: String = ""
    @State private var taskDate: Date
    @State private var showAlert = false
    @Environment(\.dismiss) var dismiss
    
    @Environment(\.colorScheme) var colorScheme
    
    var textColorBW: Color {
        colorScheme == .dark ? .white : .black
    }
    
    var textColorWB: Color {
        colorScheme == .light ? .white : .black
    }


    init(selectedDate: Date, saveTask: @escaping (Task) -> ()) {
        self.selectedDate = selectedDate
        self.saveTask = saveTask
        _taskDate = State(initialValue: selectedDate)
    }
    
    var body: some View {
        VStack {
            Text("Add new task")
                .fontDesign(.rounded)
                .font(.title3)
                .padding(30)
                .frame(maxWidth: .infinity)
                .background {
                    Rectangle()
                        .fill(Color(hex: "A1C8B5").opacity(0.6))
                        .clipShape(.rect())
                }
                .foregroundStyle(Color(hex: "2C3E36"))
            
            VStack {
                TextField("Input your task title", text: $taskTitle)
                    .padding(.top)
                HStack() {
                    Text("Date")
                        .font(.title3)
                    DatePicker("", selection: $taskDate, displayedComponents: .date)
                        .datePickerStyle(.compact)
                        .foregroundStyle(Color(hex: "2C3E36"))
                }

                HStack() {
                    Text("Time")
                        .font(.title3)
                    DatePicker("", selection: $taskDate, displayedComponents: .hourAndMinute)
                }
            }
            .padding(.horizontal, 25)
            
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
                                Color(hex: "527d6f")]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ))
                    .clipShape(.rect(cornerRadius: 20))
                    .padding(.horizontal, 30)
            }
        }
        .onAppear {
            taskDate = selectedDate
        }
        .alert("Missing Title", isPresented: $showAlert) {
            Button("OK", role:.cancel) {}
        } message: {
            Text("Please enter a task title before creating the task.")
        }
    }
}

#Preview {
    NewTaskView(selectedDate: Date()) {task in
    }
}
