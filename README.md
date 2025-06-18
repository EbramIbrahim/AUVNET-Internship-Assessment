# 🛒 NAWEL E-commerce App  
![Flutter](https://img.shields.io/badge/Flutter-3.19-blue)
![Firebase](https://img.shields.io/badge/Firebase-Emulator-orange)
![Bloc](https://img.shields.io/badge/State%20Management-Bloc-purple)
*Clean Architecture • Firebase • Hive • Bloc*

## Features ✨
- 🔐 Firebase Authentication (Email/Password) & Cloud FireStore and Storage
- 📰 Top Services & Favorit Restaurant
- 📱 Adaptive UI for All Screen Sizes
- 🌐 Real-time Products Updates via API
- 📑 Caching for offline data

## 🚀 Project Setup  
### Prerequisites  
- Flutter SDK
- Hive
- Bloc
- equatable
- get_it
- Firebase account ([setup guide](https://firebase.google.com))

### folder structur
lib/
├── core/              # Shared theme/utils
├── data/              # Firebase/Hive integrations
├── domain/            # Business logic
├── features/          # Feature modules (auth, cart, home)
│   ├── auth/
│   └── home/
├── main.dart          # Entry point
└── injection_container.dart # Dependency injection


### Installation  
```bash
git clone https://github.com/your-username/AUVNET-Flutter-Internship-Assessment.git
cd AUVNET-Flutter-Internship-Assessment
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs


