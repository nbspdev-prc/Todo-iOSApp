//
//  DateView.swift
//  Todo
//
//  Created by Percy Pham on 2025-04-28.
//

import SwiftUI

struct DateView: View {
    @ObservedObject var viewModel: TasksHomePageViewModel
    var week: WeekModel
    
    var body: some View {
        HStack {
            ForEach(0..<7) { i in
                VStack {
                    Text(week.dates[i].toString(format: "EEE").uppercased())
                        .font(.system(size: 10))
                        .fontWeight(week.dates[i] == week.referenceDate ? .semibold : .light)
                        .foregroundColor(week.dates[i] == week.referenceDate ? .white: .red)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                        .frame(height: 4)
                    
                    Text(week.dates[i].toString(format: "d"))
                        .font(.system(size: 16))
                        .fontWeight(week.dates[i] == week.referenceDate ? .bold : .light)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(week.dates[i] == week.referenceDate ? .white: .black)
                }
                .frame(maxWidth: .infinity)
                .padding(5)
                .background {
                    if week.dates[i] == week.referenceDate {
                        Color(hex: "7B74EC")
                    } else {
                        Color.clear
                    }
                }
                .clipShape(.rect(cornerRadius: 10))
                .onTapGesture {
                    withAnimation(.linear(duration: 0.1)) {
                        viewModel.selectedDate = week.dates[i]
                    }
                }

            }
        }
    }
}

#Preview {
    TasksHomePage(viewModel: TasksHomePageViewModel(dateUseCase: DateUseCase(dateRepository: DateRepository(dateDataProvider: DateDataProvider())), taskUseCase: TaskUseCase(taskRepository: TaskRepository(taskDataProvider: TaskDataProvider()))))
}
