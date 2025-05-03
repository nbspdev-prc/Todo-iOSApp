//
//  TaskRepository.swift
//  Todo
//
//  Created by Percy Pham on 2025-05-01.
//

import Foundation

protocol TaskRepositoryProtocal {
    func getTaskList() -> [Task]
    func updateTaskList(task: Task) -> [Task]
    func toggleTaskCompletion(task: Task) -> [Task]
    func deleteTask(task: Task) -> [Task]
    func getCurrentSelectedDateTasks(of date: Date) -> [Task]
}

class TaskRepository {
    private let taskDataProvider: TaskDataProviderProtocal
    
    init(taskDataProvider: TaskDataProviderProtocal = TaskDataProvider()) {
        self.taskDataProvider = taskDataProvider
    }
}

extension TaskRepository: TaskRepositoryProtocal {
    func getTaskList() -> [Task] {
        return taskDataProvider.getTaskList()
    }
    
    func updateTaskList(task: Task) -> [Task] {
        return taskDataProvider.updateTaskList(task: task)
    }
    
    func toggleTaskCompletion(task: Task) -> [Task] {
        return taskDataProvider.toggleTaskCompletion(task: task)
    }
    
    func getCurrentSelectedDateTasks(of date: Date) -> [Task] {
        return taskDataProvider.getCurrentSelectedDateTasks(of: date)
    }
    
    func deleteTask(task: Task) -> [Task] {
        return taskDataProvider.deleteTask(task: task)
    }
}
