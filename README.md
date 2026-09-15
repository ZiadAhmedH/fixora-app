<div align="center">

<img src="assets/images/fixora.png" alt="Fixora Logo" width="100" height="100" style="border-radius: 20px;" />

# Fixora — Field Service App

**Fast Service .. Fair Prices**

*A full-stack Flutter application connecting clients with skilled technicians*

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Firebase](https://img.shields.io/badge/Firebase-Enabled-FFCA28?logo=firebase&logoColor=black)](https://firebase.google.com)
[![License](https://img.shields.io/badge/License-MIT-00BFA6)](LICENSE)

</div>

---

## ✨ Overview

**Fixora** is a modern field service mobile application built with Flutter. It bridges the gap between clients who need home or business services and certified technicians who provide them — all in one clean, bilingual (Arabic / English) interface.

---

## 📱 Features

| Feature | Description |
|---|---|
| 🔐 **Email Auth** | Secure sign-up & sign-in with Firebase Authentication |
| 🔵 **Google Sign-In** | One-tap sign-in with Google |
| 👤 **Role-based Access** | Separate flows for **Clients** and **Technicians** |
| 🌐 **Bilingual (AR / EN)** | Full RTL support with live language switching |
| 🎨 **Dark / Light Mode** | System-aware theming with manual override |
| 🔒 **Secure Storage** | Encrypted token persistence |
| 📦 **Clean Architecture** | Domain → Data → Presentation layers |

---

## 🏗️ Architecture

```
lib/
├── config/
│   ├── di/                  # Dependency injection (GetIt)
│   └── routes/              # GoRouter navigation
├── core/
│   ├── constants/           # AppColors, AppAssets, AppConstants
│   ├── errors/              # Failures & Exceptions
│   ├── localization/        # L10n setup
│   ├── theme/               # AppTheme, AppColors
│   └── utils/
├── features/
│   └── auth/
│       ├── data/            # Remote & local data sources, models
│       ├── domain/          # Entities, repositories (abstract), use-cases
│       └── presentation/    # BLoC, pages, sections, widgets
├── l10n/                    # ARB translation files (EN / AR)
├── shared/
│   └── blocs/               # ThemeBloc, LocaleBloc
└── main.dart
```

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| **UI** | Flutter 3 · Material 3 |
| **State** | flutter_bloc · freezed |
| **Navigation** | go_router |
| **Backend** | Firebase Auth · Cloud Firestore · Firebase Storage |
| **DI** | get_it |
| **Localization** | flutter_localizations · intl (ARB) |
| **Persistence** | shared_preferences · flutter_secure_storage |
| **FP** | dartz (Either) |
| **Font** | Cairo (Google Fonts) |

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK `^3.10.4`
- Dart SDK `^3.10.4`
- A Firebase project with **Authentication** and **Cloud Firestore** enabled

### 1 — Clone the repo

```bash
git clone https://github.com/ZiadAhmedH/feild-app.git
cd feild-app
```

### 2 — Install dependencies

```bash
flutter pub get
```

### 3 — Firebase setup

1. Create a Firebase project at [console.firebase.google.com](https://console.firebase.google.com)
2. Enable **Authentication** → Google & Email/Password providers
3. Enable **Cloud Firestore** in test mode
4. Add your Android app:
   - Package name: `com.ziadahmed.feild_service_app`
   - **Add your debug SHA-1 fingerprint** (required for Google Sign-In):
     ```bash
     keytool -list -v -keystore ~/.android/debug.keystore \
       -alias androiddebugkey -storepass android -keypass android
     ```
5. Download `google-services.json` → place it in `android/app/`

### 4 — Run

```bash
flutter run
```

---

## 🌍 Localization

The app supports **English** and **Arabic** with live switching from the auth screens.

Translation files live in `lib/l10n/`:

```
app_en.arb   ← English (template)
app_ar.arb   ← Arabic
```

To add a new language:
1. Create `app_<lang>.arb`
2. Add the `Locale` to `appSupportedLocales` in `core/localization/`
3. Run `flutter gen-l10n`

---

## 🎨 Design System

| Token | Value |
|---|---|
| `primary` | `#00BFA6` (Teal) |
| `primaryLight` | `#A7F3D0` (Mint) |
| `primaryDark` | `#00897B` (Dark Teal) |
| **Font** | Cairo (Regular · Medium · SemiBold · Bold) |
| **Border radius** | 8 · 12 · 16 · 24 · 100 px |

All colors are defined in [`AppColors`](lib/core/theme/app_colors.dart) — never use raw hex values elsewhere.  
All asset paths are defined in [`AppAssets`](lib/core/constants/app_assets.dart).

---

## 📂 Key Files

| File | Purpose |
|---|---|
| [`main.dart`](lib/main.dart) | App entry point, BLoC providers |
| [`injection_container.dart`](lib/config/di/injection_container.dart) | GetIt DI wiring |
| [`app_colors.dart`](lib/core/theme/app_colors.dart) | Central color palette |
| [`app_assets.dart`](lib/core/constants/app_assets.dart) | Typed asset paths |
| [`auth_remote_data_source.dart`](lib/features/auth/data/datasources/auth_remote_data_source.dart) | Firebase + Google Sign-In logic |
| [`auth_bloc.dart`](lib/features/auth/presentation/bloc/auth_bloc.dart) | Auth state machine |

---

## 🤝 Contributing

1. Fork the project
2. Create your feature branch: `git checkout -b feature/my-feature`
3. Commit your changes: `git commit -m 'feat: add my feature'`
4. Push to the branch: `git push origin feature/my-feature`
5. Open a Pull Request

---

## 📄 License

Distributed under the MIT License. See [`LICENSE`](LICENSE) for more information.

---

<div align="center">

Built with ❤️ using Flutter & Firebase

**Fixora** — *Fast Service .. Fair Prices*

</div>
