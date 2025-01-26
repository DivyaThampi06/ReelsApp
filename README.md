# reelsapp

Reels App

This Flutter application fetches and displays video reels from an API. It demonstrates best practices in Flutter development, including data fetching, JSON parsing, state management using the BLoC pattern, and clean architecture.

Features

Framework: Developed using the Flutter framework.
Data Retrieval: Fetches data from the API: API Endpoint using the http package.
Data Parsing: JSON data is parsed using Dart’s built-in JSON decoding library.
Pagination: Handles large datasets with pagination, allowing users to load more content as they scroll.
Lazy Loading: Improves performance by loading content only when needed.
Caching: Caches video data to minimize repeated API requests and enhance the user experience.
Error Handling: Handles errors gracefully during data retrieval or JSON parsing.
Reels Page Design: Mimics a reels page with smooth vertical scrolling and pagination.
State Management: Implements state management using the BLoC (Business Logic Component) pattern.
Dependency Injection: Manages dependencies effectively.
Clean Architecture: Separation of UI, business logic, and data layers for scalability and maintainability.
Getting Started

Prerequisites
Ensure you have Flutter installed on your machine. You can find installation instructions here.
Install the required dependencies by running:
flutter pub get
Installation
Clone the repository:
git clone https://github.com/YourUsername/YourRepositoryName.git
Navigate to the project directory:
cd YourRepositoryName
Running the App
Connect a physical device or start an emulator.
Run the app:
flutter run
Project Structure

lib/
├── main.dart
├── blocs/
│   └── reels_bloc.dart
├── models/
│   └── reel.dart
├── pages/
│   └── reels_page.dart
├── widgets/
│   └── reels_view.dart
Explanation
main.dart: Entry point of the application, initializes the BlocProvider.
blocs/reels_bloc.dart: Contains the BLoC implementation for fetching and managing reels.
models/reel.dart: Defines the Reel data model.
pages/reels_page.dart: The main page displaying the reels.
widgets/reels_view.dart: Handles the reels display using a PageView for smooth vertical scrolling.

