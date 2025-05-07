# NextUp

This project is part of the **App Development Academy** series: **TODO List App - SwiftUI, Clean Architecture, and MVVM**. It demonstrates how to build a task management application using **SwiftUI**, following the principles of **Clean Architecture** and **MVVM** design patterns. The app has been enhanced with additional features and changes to improve functionality and user experience.

## Features

- **Task Management**: Create, update, delete, and toggle task completion.
- **Date Navigation**: Swipe through weeks and select specific dates to view tasks.
- **Custom UI**: A visually appealing interface with color themes and animations.
- **Persistence**: Tasks are saved locally using `UserDefaults`.
- **Clean Architecture**: Separation of concerns with clearly defined layers:
  - **Presentation**: SwiftUI views and view models.
  - **Domain**: Use cases and entities.
  - **Data**: Repositories and data providers.
- **MVVM Pattern**: ViewModels manage the state and logic for the views.
- **Dark Mode Support**: Adapts to the system's color scheme.
- **Alerts and Validations**: User-friendly alerts for missing task titles and confirmation dialogs for deletions.

## Additional Changes and Features

- **Custom Color Support**: Added a `Color+Extension` to support hex-based color initialization.
- **Improved Date Handling**: Enhanced date navigation with `Date+Extension` for better formatting and calculations and time management.
- **Interactive Animations**: Added animations for task interactions (e.g., scaling on tap).
- **How-To Guide**: A built-in guide accessible via the "How-To" button in the header.
- **Preview Support**: SwiftUI previews for all views to streamline development.

## Project Structure

The project is organized into the following directories:

- **Application**: Entry point of the app (`TodoApp.swift`).
- **Core**: Shared utilities and extensions (e.g., `Date+Extension`, `Color+Extension`).
- **Data**: Data layer with repositories and providers for tasks and dates.
- **Domain**: Business logic, including use cases and entities.
- **Presentation**: SwiftUI views and view models.
- **Tests**: Unit and UI tests for the app.

## How to Use

1. **Add a Task**: Tap the "+" button to create a new task. Enter the title and select a date.
2. **Mark as Complete**: Tap a task to toggle its completion status.
3. **Delete a Task**: Long-press a task to delete it after confirmation.
4. **Navigate Dates**: Swipe left or right to browse weeks, and tap a date to view tasks for that day.

## Requirements

- **Xcode 14.0+**
- **iOS 16.0+**
- **Swift 5.0+**

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/todo-list-app.git

2. Open the Project in Xcode:
  ```
  open Todo.xcodeproj
  ```

Acknowledgments
This project is inspired by the @App Development Academy series "TODO List App -SwiftUI, Clean Archiltecture and MVVM" but added change and features and has been extended with additional features and improvements to showcase advanced SwiftUI and Clean Architecture concepts.

<img src="path/to/IMG_5828.jpg" alt="Light mode - Add Task" width="300"/>
<img src="path/to/IMG_5829.jpg" alt="Dark mode - Add Task" width="300"/>
