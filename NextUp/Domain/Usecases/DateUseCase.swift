//
//  DateUseCase.swift
//  Todo
//
//  Created by Percy Pham on 2025-05-01.
//

import Foundation

protocol DateUseCaseProtocal {
    func calculatePastAndFutureWeeks(with date: Date) -> [WeekModel]
}

class DateUseCase {
    private let dateRepository: DateRepositoryProtocal
    
    init(dateRepository: DateRepositoryProtocal = DateRepository()) {
        self.dateRepository = dateRepository
    }
}

extension DateUseCase: DateUseCaseProtocal {
    func calculatePastAndFutureWeeks(with date: Date) -> [WeekModel] {
        return dateRepository.calculatePastAndFutureWeeks(with: date)
    }
}
