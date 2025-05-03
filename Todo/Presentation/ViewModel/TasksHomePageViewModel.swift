//
//  TasksHomePageViewModel.swift
//  Todo
//
//  Created by Percy Pham on 2025-05-01.
//

import Foundation

struct TasksHomePageConstants {
    
}

enum SliderTimeDirection {
    case future
    case past
    case unknown
}

protocol TasksHomePageViewModelInput {
    func selectTheDay(with date: Date)
    func onDateScrolled(to directions: SliderTimeDirection)
    
    func updateTaskList(task: Task)
    func toggleTaskCompletion(task: Task)
    func deleteTask(task: Task)
}

protocol TasksHomePageViewModelOutput {
    func getSelectDate() -> Date
    func getCurrentSelectedDateTasks() -> [Task]
}

protocol TaskHomePageViewModelProtocal: ObservableObject, TasksHomePageViewModelInput, TasksHomePageViewModelOutput {
    
}

class TasksHomePageViewModel: TaskHomePageViewModelProtocal {
    private let dateUseCase: DateUseCaseProtocal
    private let taskUseCase: TaskUseCaseProtocal
    
    @Published var items: [Task] = []
    @Published var weeks: [WeekModel] = []
    @Published var selectedDate: Date {
        didSet {
            calculatePastAndFutureWeek(with: selectedDate)
        }
    }
    
    init(dateUseCase: DateUseCaseProtocal, taskUseCase: TaskUseCaseProtocal, with date: Date = Date()) {
        self.dateUseCase = dateUseCase
        self.taskUseCase = taskUseCase
        self.selectedDate = Calendar.current.startOfDay(for: date)
        calculatePastAndFutureWeek(with: selectedDate)
        self.items = taskUseCase.getTaskList()
    }
    
    private func calculatePastAndFutureWeek(with date: Date) {
        weeks = dateUseCase.calculatePastAndFutureWeeks(with: date)
    }
}

// Input
extension TasksHomePageViewModel {
    func selectTheDay(with date: Date) {
        selectedDate = Calendar.current.startOfDay(for: date)
    }
        
    func onDateScrolled(to direction: SliderTimeDirection) {
        switch direction {
        case .future:
            selectedDate = Calendar.current.date(byAdding: .day, value: 7, to: selectedDate)!
            
        case .past:
            selectedDate = Calendar.current.date(byAdding: .day, value: -7, to: selectedDate)!
            
        case .unknown:
            selectedDate = selectedDate
        }
        calculatePastAndFutureWeek(with: selectedDate)
    }
    
    func updateTaskList(task: Task) {
        items = taskUseCase.updateTaskList(task: task)
    }
    
    func toggleTaskCompletion(task: Task) {
        items = taskUseCase.toggleTaskCompletion(task: task)
    }
    
    func deleteTask(task: Task) {
        items = taskUseCase.deleteTask(task: task)
    }
}

// Output
extension TasksHomePageViewModel {
    func getSelectDate() -> Date {
        selectedDate
    }

    func getCurrentSelectedDateTasks() -> [Task] {
        taskUseCase.getCurrentSelectedDateTasks(of: selectedDate)
    }
}
