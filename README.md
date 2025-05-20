# To Do App Clean Architecture (MVVM + RxSwift)

A simple and modern To Do application built using Swift, applying Clean Architecture principles with MVVM and RxSwift. This project serves as an example of how to structure a scalable iOS application using best practices for separation of concerns, testability, and maintainability.

## Features

- Add, edit, delete, and manage to-do items
- Reactive UI updates with RxSwift
- Clean Architecture with clear separation between layers
- MVVM design pattern for modular and testable code
- Swift-based UI

## Architecture

This project uses the following architecture and frameworks:

- **Clean Architecture:** Separation of presentation, domain, and data layers for maintainability and testability.
- **MVVM (Model-View-ViewModel):** Decouples UI from business logic.
- **RxSwift:** Enables reactive programming for asynchronous UI updates and data binding.

## Project Structure

```
├── Domain
│   └── Entities, UseCases, Repositories (Protocols)
├── Data
│   └── Repositories (Implementations), DataSources, Models
├── Presentation
│   └── ViewModels, Views (ViewControllers)
├── Resources
│   └── Assets, Localizations
├── SupportingFiles
│   └── AppDelegate, Info.plist, etc.
```

## Getting Started

### Prerequisites

- Xcode 13 or newer
- CocoaPods or Swift Package Manager (for RxSwift)
- iOS 13.0+

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/trongtin1495/todo-app.git
   cd todo-app
   ```

2. **Install dependencies:**

   If using CocoaPods:

   ```bash
   pod install
   open todo-app.xcworkspace
   ```

   If using Swift Package Manager, open the project in Xcode and resolve Swift Packages.

3. **Build and run the app** on the simulator or a real device.

## Usage

- Launch the app.
- Add new tasks using the "+" button.
- Edit or delete tasks by tapping on them.
- Tasks are updated reactively in the UI.

## Dependencies

- [RxSwift](https://github.com/ReactiveX/RxSwift)
- [RxCocoa](https://github.com/ReactiveX/RxSwift) (if used for UI bindings)

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for improvements, bug fixes, or new features.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Author

- [trongtin1495](https://github.com/trongtin1495)

---

**Note:** This project is for learning and demonstration purposes, showcasing Clean Architecture and MVVM with RxSwift in a Swift-based To Do app.
