//
//  TodoApp.swift
//  Todo
//
//  Created by Percy Pham on 2025-04-28.
//

import SwiftUI

@main
struct NextUpApp: App {    
    var body: some Scene {
        WindowGroup {
            let dateUseCase = DateUseCase(dateRepository: DateRepository(dateDataProvider: DateDataProvider()))
            let taskUseCase = TaskUseCase(taskRepository: TaskRepository(taskDataProvider: TaskDataProvider()))
            let viewModel = TasksHomePageViewModel(dateUseCase: dateUseCase, taskUseCase: taskUseCase)
            TasksHomePage(viewModel: viewModel)
        }
    }
}
