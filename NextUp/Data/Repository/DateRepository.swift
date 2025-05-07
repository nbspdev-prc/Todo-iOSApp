//
//  DateRepository.swift
//  Todo
//
//  Created by Percy Pham on 2025-05-01.
//

import Foundation

protocol DateRepositoryProtocal {
    func calculatePastAndFutureWeeks(with date: Date) -> [WeekModel]
}

class DateRepository {
    private let dateDataProvider: DateDataProviderProtocal
    
    init(dateDataProvider: DateDataProviderProtocal = DateDataProvider()) {
        self.dateDataProvider = dateDataProvider
    }
}

extension DateRepository: DateRepositoryProtocal {
    func calculatePastAndFutureWeeks(with date: Date) -> [WeekModel] {
        return dateDataProvider.calculatePastAndFutureWeeks(with: date)
    }
}
