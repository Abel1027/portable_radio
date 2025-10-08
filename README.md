# 📻 Portable Radio

A beautiful and intuitive Flutter radio streaming application that lets you discover, play, and manage your favorite radio stations from Spain.

## ✨ Features

- 🎵 **Stream Radio Stations**: Play radio stations from a global database
- ⭐ **Favorites Management**: Save and organize your favorite radio stations locally
- 🎛️ **Interactive Controls**: Play, pause, and volume control with smooth animations
- 🎨 **Vintage UI**: Beautiful retro-inspired interface with custom knob controls
- 🌍 **Multi-language Support**: Available in English and Spanish
- 📱 **Cross-platform**: Runs on iOS, Android, macOS, Linux, and Web
- 🧪 **Well-tested**: Comprehensive unit tests, bloc tests, and golden tests

## 🏗️ Architecture

This project follows **Clean Architecture** principles with **BLoC pattern** for state management:

```
lib/
├── config/           # App configuration and themes
├── data/            # Data layer
│   ├── mapper/      # Data model mappers
│   ├── model/       # Data models
│   └── repository/  # Repository implementations
├── domain/          # Business logic layer
│   ├── model/       # Domain models
│   └── use_case/    # Business use cases
├── l10n/           # Internationalization
├── di/             # Dependency injection
└── presentation/   # UI layer
    ├── organism/   # Complex UI components
    └── view_model/ # BLoC/Cubit state management
```

## 🛠️ Tech Stack

- **Framework**: Flutter 3.8+
- **State Management**: flutter_bloc + Cubit
- **Audio Streaming**: just_audio
- **HTTP Client**: dio
- **Local Storage**: hive + hive_flutter
- **Dependency Injection**: get_it + injectable
- **Code Generation**: freezed + json_serializable
- **Internationalization**: Flutter Intl
- **Testing**: bloc_test + alchemist (golden tests) + mocktail

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.8.0 or higher
- Dart SDK 3.8.0 or higher
- Android Studio / VS Code with Flutter extensions
- For iOS: Xcode 14+ and iOS 12+
- For Android: Android SDK with API level 21+

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Abel1027/portable_radio.git
   cd portable_radio
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code** (for models, dependency injection, etc.)
   ```bash
   flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

4. **Generate localizations**
   ```bash
   flutter gen-l10n
   ```

### Running the App

#### Development Mode
```bash
# Run on connected device/emulator
flutter run
```

## 🧪 Testing

This project includes comprehensive testing:

### Unit Tests
```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage
```

### Golden Tests
```bash
# Update golden files
flutter test --update-goldens
```

### Using Derry Scripts
This project uses [derry](https://pub.dev/packages/derry) for task automation:

```bash
# Run tests
derry test

# Update golden tests
derry update_goldens

# Clean and get dependencies
derry clean
```

## 📱 Usage

1. **Launch the app** and tap the power button to turn on the radio
2. **Browse stations** using the tuner knob or select from favorites
3. **Play/Pause** using the control buttons
4. **Adjust volume** with the volume knob
5. **Add to favorites** by tapping the star icon on any station
6. **Manage favorites** from the favorites panel

## 🎨 UI/UX Features

- **Vintage Radio Design**: Inspired by classic portable radios
- **Custom Knob Controls**: Interactive tuner and volume knobs with realistic physics
- **Smooth Animations**: Fluid transitions and micro-interactions
- **Responsive Layout**: Adapts to different screen sizes and orientations
- **Dark Theme**: Elegant dark interface with custom colors

## 🌐 Radio Station Data

The app fetches radio stations from the [Radio Browser API](https://www.radio-browser.info/):
- **Live Data**: Always up-to-date station information
- **Global Coverage**: Stations from around the world
- **Rich Metadata**: Station names, icons, and streaming URLs

## 🔧 Configuration

### Environment Setup
The app uses different configurations for different environments. Key configuration files:
- `lib/config/constant.dart` - API endpoints and constants
- `lib/config/custom_theme_data.dart` - App theming
- `lib/config/custom_color.dart` - Color palette

### Localization
Add new languages by:
1. Adding locale to `l10n.yaml`
2. Creating new `.arb` files in `lib/l10n/`
3. Running `flutter gen-l10n`

### Code Style
- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Use `flutter analyze` to check for issues
- Ensure all tests pass before submitting PR
- Add tests for new features

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Abel Rodriguez** - [Abel1027](https://github.com/Abel1027)

## 🙏 Acknowledgments

- [Radio Browser API](https://www.radio-browser.info/) for providing radio station data
- Flutter team for the amazing framework
- All the open-source package authors used in this project

## 📞 Support

If you have any questions or issues, please:
1. Check the [Issues](https://github.com/Abel1027/portable_radio/issues) page
2. Create a new issue if needed
3. Provide detailed information about the problem

---

**Made with ❤️ and Flutter** 🐦
