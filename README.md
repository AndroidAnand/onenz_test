# Todo App Monorepo

A simple To-Do application built with Flutter that demonstrates the use of MVVM architecture, Riverpod for state management, and go_router for navigation. The project is organized as a monorepo using Melos, with a shared UI components package (`ui_elements`) and the main app package (`todo_app`).

## Requirements

- Flutter SDK (>=2.17.0, <3.0.0)
- Dart SDK
- [Melos](https://pub.dev/packages/melos) for monorepo management (optional)
- Packages:
    - [flutter_riverpod](https://pub.dev/packages/flutter_riverpod) for state management
    - [go_router](https://pub.dev/packages/go_router) for navigation

## Project Structure

```plaintext
my_monorepo/
├── melos.yaml            # Melos configuration for the monorepo
└── packages/
    ├── ui_elements/       # Shared UI components
    │   ├── pubspec.yaml
    │   └── lib/
    │       ├── custom_button.dart
    │       ├── custom_bottom_button.dart
    │       ├── custom_text_field.dart
    │       └── CustomTitleText.dart
    └── todo_app/          # Main application
        ├── pubspec.yaml
        └── lib/
            ├── main.dart
            ├── models/
            │     └── todo.dart
            ├── view_models/
            │     └── todo_view_model.dart
            └── views/
                  ├── home_screen.dart
                  └── add_todo_screen.dart.
```
## Features

- **MVVM Architecture:**  
  Separates the business logic (ViewModel) from UI (View) for improved maintainability.

- **State Management:**  
  Utilizes Riverpod for a robust and testable state management solution.

- **Navigation:**  
  Implements go_router for declarative and easy-to-maintain routing between screens.

- **Monorepo Setup:**  
  Uses Melos to manage a monorepo with two packages:
    - `ui_elements` for reusable UI components (custom buttons, text fields, title text, etc.)
    - `todo_app` for the main application.

- **Testing:**  
  Unit and widget tests are included for critical components such as the TodoViewModel, HomeScreen, AddTodoScreen, CustomTextField, and CustomBottomButton.

## Implementation Details

- **`main.dart`:**  
  Sets up the `GoRouter` with two routes (`/` for HomeScreen and `/add` for AddTodoScreen) and wraps the app with `ProviderScope` to enable Riverpod.

- **State Management:**  
  The `TodoViewModel` manages the list of todos using Riverpod's `StateNotifierProvider`. Methods include adding a new todo and toggling the status.

- **UI Components:**  
  The `ui_elements` package contains custom widgets such as:
    - **CustomBottomButton:** A full-width, rounded button.
    - **CustomTextField:** A text field that supports both single-line (for titles) and multi-line (for descriptions) input.
    - **CustomTitleText:** A reusable title widget for headers and app bars.
    - **CustomTodoCard:** A reusable card view.

- **Routing:**  
  The app uses go_router for navigation. The AddTodoScreen calls `context.pop()` (using go_router) to return to HomeScreen upon saving a new todo.

## Getting Started

### Clone the Repository

```bash
git clone <repository_url>
cd my_monorepo

