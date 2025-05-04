//
//  DataHeaderView.swift
//  Todo
//
//  Created by Percy Pham on 2025-04-28.
//

import SwiftUI

struct DateHeaderView: View {
    @ObservedObject var viewModel: TasksHomePageViewModel
    @State private var displayName: String = "there"
    @State private var showHowToAlert = false
    
    var dateText: String {
        if viewModel.selectedDate == Calendar.current.startOfDay(for: Date()) {
            return "What's up for today?"
        } else if viewModel.selectedDate < Calendar.current.startOfDay(for: Date()) {
            return "Checking unfinished tasks."
        } else {
            return "Planning for a different time?"
        }
    }
                                                                  
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
                Text("Ready to plan?")
                    .font(.title)
                    .foregroundColor(Color(hex: "#2C3E36"))
                    .fontWeight(.semibold)
                    .padding(4)

                Text(dateText)
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundColor(.black)
                    .padding(4)
            }
            
            Spacer()
            VStack(alignment: .trailing) {
                Text(viewModel.selectedDate.monthYearToString())
                    .font(.system(size: 10))
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                
                Button {
                    withAnimation(.linear(duration: 0.1)) {
                        showHowToAlert = true
                    }
                } label: {
                    Text("How-To")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(4)
                        .background(Color(hex: "e65c66"))
                        .cornerRadius(4)
                }
                .alert("How to Use", isPresented: $showHowToAlert) {
                    Button("Got it", role: .cancel) { }
                } message: {
                    Text("""
                    Tap '+' to add a task
                    Tap a task to mark it as complete
                    Hold a task to delete it
                    You can also browse other weeks by swiping left or right and tapping the date you want.
                    """)
                }
            }
        }
        
    }
}

#Preview {
    TasksHomePage(viewModel: TasksHomePageViewModel(dateUseCase: DateUseCase(dateRepository: DateRepository(dateDataProvider: DateDataProvider())), taskUseCase: TaskUseCase(taskRepository: TaskRepository(taskDataProvider: TaskDataProvider()))))
}
