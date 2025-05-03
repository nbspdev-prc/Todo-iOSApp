//
//  DataHeaderView.swift
//  Todo
//
//  Created by Percy Pham on 2025-04-28.
//

import SwiftUI

struct DateHeaderView: View {
    @ObservedObject var viewModel: TasksHomePageViewModel
    
    var body: some View {
        ZStack {
            VStack {
                nameHeaderTextView()
                DateSliderView(viewModel: viewModel) { week in
                    DateView(viewModel: viewModel, week: week)
                }
                .frame(height: 60, alignment: .top)
                Divider()
                HStack {
                    Spacer()
                    Text(viewModel.selectedDate.toString(format: "EEE, dd.MM.yyyy"))
                        .font(.system(size: 10, design:. rounded))
                        .foregroundColor(.gray)
                }
            }
        }
    }
    
    @ViewBuilder
    private func nameHeaderTextView() -> some View {
        HStack {
            VStack(alignment: .listRowSeparatorLeading, spacing: 0) {
                Text("Hi, Percy")
                    .font(.title)
                    .foregroundColor(Color(hex: "#002765"))
                    .fontWeight(.semibold)
                    .padding(4)
                
                Text(viewModel.selectedDate == Calendar.current.startOfDay(for: Date())
                     ? "What's up for today?" : "Planning for a different time?")
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundColor(.black)
                    .padding(4)
            }
            
            Spacer()
            VStack(alignment: .trailing) {
                Text(viewModel.selectedDate.monthToString())
                    .font(.system(size: 10))
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                
                Button {
                    withAnimation(.linear(duration: 0.1)) {
                        
                    }
                } label: {
                    Text("Today")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(4)
                        .background(Color(hex: "2d2791"))
                        .cornerRadius(4)
                }
            }
        }
    }
}

#Preview {
    TasksHomePage(viewModel: TasksHomePageViewModel(dateUseCase: DateUseCase(dateRepository: DateRepository(dateDataProvider: DateDataProvider())), taskUseCase: TaskUseCase(taskRepository: TaskRepository(taskDataProvider: TaskDataProvider()))))
}
