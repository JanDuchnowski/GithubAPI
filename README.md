# GitHub API Flutter App

A Flutter application that provides a clean, intuitive interface for exploring GitHub repositories. Search for repositories, view detailed information, and browse issues and pull requests.

## 🚀 Features

- **Repository Search**: Search for GitHub repositories by name or keyword
- **Repository Details**: View comprehensive information about repositories including:
  - Stars, forks, and watchers count
  - Programming language and license
  - Repository description and last update
- **Issues & Pull Requests**: Browse repository issues and pull requests
- **Clean Navigation**: Smooth navigation between screens with GoRouter
- **Responsive Design**: Works great on different screen sizes

## 🛠️ Tech Stack

- **Flutter** - UI framework
- **Riverpod** - State management and dependency injection
- **GoRouter** - Navigation and routing
- **Dio** - HTTP client for API calls
- **GitHub REST API** - Data source

## 📱 Screenshots

### Search Screen
Search for repositories by entering keywords in the search bar.

### Repository Details
View detailed information about any repository including stats, description, and owner information.

### Issues & Pull Requests
Browse through repository issues and pull requests with easy navigation.

## 🏗️ Architecture

The app follows **Clean Architecture** principles with clear separation of concerns:

```
lib/
├── core/
│   ├── network/          # Network configuration
│   └── routes/           # App routing configuration
└── features/
    ├── search/           # Repository search functionality
    │   ├── data/         # Data layer (repositories, API calls)
    │   ├── domain/       # Domain layer (entities, repositories)
    │   └── presentation/ # UI layer (screens, providers)
    └── repo_details/     # Repository details functionality
        ├── data/         # Data layer
        ├── domain/       # Domain layer
        └── presentation/ # UI layer
```

## 🧪 Testing

Comprehensive test coverage including:
- **Unit Tests** - Business logic and data layer
- **Widget Tests** - UI components and user interactions
- **Router Tests** - Navigation flow and parameter handling

Run tests with:
```bash
flutter test
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.8.1 or higher)
- Dart SDK
- IDE with Flutter support (VS Code, Android Studio, etc.)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/JanDuchnowski/GithubAPI.git
   cd githubapi
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code (if needed)**
   ```bash
   dart run build_runner build
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

## 📋 Usage

1. **Search Repositories**: Enter a search term in the search bar on the home screen
2. **View Details**: Tap on any repository from the search results to view detailed information
3. **Browse Issues/PRs**: In the repository details screen, navigate to the Issues or Pull Requests tabs
4. **Navigation**: Use the back button or navigation controls to move between screens

## 🔧 Configuration

The app uses the GitHub REST API v3. No authentication is required for basic repository search and viewing public repository information.

## 📖 API Reference

This app integrates with the following GitHub API endpoints:
- `/search/repositories` - Search for repositories
- `/repos/{owner}/{repo}` - Get repository details
- `/repos/{owner}/{repo}/issues` - Get repository issues
- `/repos/{owner}/{repo}/pulls` - Get repository pull requests



