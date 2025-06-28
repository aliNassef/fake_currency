# Fake Currency App

A modern Flutter application for currency conversion with a clean, user-friendly interface. Built using the latest Flutter technologies and following best practices for state management and architecture.

## Features

- Real-time currency conversion
- Clean and intuitive UI/UX
- Support for multiple currencies
- Historical exchange rates
- Offline functionality
- Responsive design for all screen sizes

## Tech Stack

- **Framework**: Flutter
- **State Management**: BLoC Pattern
- **Dependency Injection**: GetIt
- **Networking**: Dio
- **Local Storage**: Shared Preferences
- **UI Components**: Material Design & Custom Widgets

## Getting Started

### Prerequisites

- Flutter SDK (version 3.7.2 or higher)
- Dart SDK (version 2.19.0 or higher)
- Android Studio / VS Code with Flutter extensions

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/fake_currency.git
   cd fake_currency
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── core/                  # Core functionality
│   ├── di/               # Dependency injection
│   ├── network/          # Network related code
│   ├── utils/            # Utilities and helpers
│   └── widgets/          # Reusable widgets
├── features/             # Feature-based modules
│   └── main/             # Main feature
│       ├── data/         # Data layer
│       ├── domain/       # Business logic
│       └── presentation/ # UI layer
├── assets/               # Images, fonts, etc.
└── main.dart            # Application entry point
```

## Dependencies

- **bloc**: ^9.0.0 - State management
- **dio**: ^5.8.0+1 - HTTP client
- **flutter_bloc**: ^9.1.1 - Flutter BLoC implementation
- **get_it**: ^8.0.3 - Service locator
- **shared_preferences**: ^2.5.3 - Local storage
- **flutter_screenutil**: ^5.9.3 - Responsive UI
- **google_fonts**: ^6.2.1 - Custom fonts

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Screenshots

*Add screenshots of your app here*

## Support

For support, email support@example.com or open an issue on GitHub.

## Additional Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [BLoC Documentation](https://bloclibrary.dev/)
- [Dart Packages](https://pub.dev/)
