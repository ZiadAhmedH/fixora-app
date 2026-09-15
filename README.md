# ✨ feat: Splash Screen & Auth Foundation

> Bootstraps the app's startup flow with a polished animated splash screen, full auth state detection, and bilingual (EN/AR) localization support.

---

## 📸 Preview

<div align="center">

| Splash | Login | Register |
|:---:|:---:|:---:|
| <img src="https://github.com/user-attachments/assets/0520b070-8c1b-476d-a8f6-2b649075396a" width="200"/> | <img src="https://github.com/user-attachments/assets/81890f5d-a74c-47c6-aea2-e562cbc9cbbf" width="200"/> | <img src="https://github.com/user-attachments/assets/e4ef6100-cd47-4939-93df-d23c4965920d" width="200"/> |

</div>

---

## 🗂️ What's in this PR

### 🚀 Splash Feature — Clean Architecture

A fully wired `splash` feature following the same Clean Architecture + BLoC pattern used across the codebase.

```
lib/features/splash/
├── domain/
│   └── usecases/
│       └── check_auth_status_use_case.dart   ← queries AuthRepository
└── presentation/
    ├── bloc/
    │   ├── splash_bloc.dart                   ← handles SplashEvent.started()
    │   ├── splash_event.dart                  ← @freezed
    │   └── splash_state.dart                  ← initial | authenticated | unauthenticated
    └── pages/
        └── splash_page.dart                   ← animated logo + BlocListener redirect
```

---

### 🎬 Startup Flow

```
App launch
    │
    ▼
/splash ──► fade + scale animation (1.2s)
    │
    ▼
SplashEvent.started() ──► CheckAuthStatusUseCase
    │
    ├── user != null ──► navigate to /  (Home)
    └── user == null ──► navigate to /login
```

---

### 🔌 Wiring

| Layer | Change |
|---|---|
| **DI** (`injection_container.dart`) | Registered `CheckAuthStatusUseCase` + `SplashBloc` via GetIt |
| **Router** (`app_router.dart`) | `initialLocation` → `/splash`; redirect guard skips splash route |
| **Localization** (`app_en.arb`, `app_ar.arb`) | Added `fieldServiceManagement` key (EN + AR) |

---

### 🌍 Localization

| Key | English | Arabic |
|---|---|---|
| `fieldServiceManagement` | Field Service Management | إدارة الخدمة الميدانية |

---

## 🧠 Design Decisions

**`BlocListener` over `BlocBuilder` for navigation**
Navigation (`context.go(...)`) is a one-time side-effect, not a UI rebuild. Using `BlocBuilder` would call `context.go()` inside the `build()` phase — illegal in Flutter. `BlocListener` fires outside the build cycle, exactly once per state emission.

**`CheckAuthStatusUseCase` in Splash, not reusing `AuthBloc`**
The splash feature owns its own startup check to stay decoupled from the auth feature's loading/error states. It collapses `Either<Failure, AppUser?>` into a simple `AppUser?` — all the splash screen needs to know.

---

## ✅ Checklist

- [x] Follows Clean Architecture (domain / presentation layers)
- [x] BLoC pattern with `@freezed` events & states
- [x] Registered in GetIt DI container
- [x] Wired into GoRouter with proper redirect guard
- [x] Bilingual support — English 🇬🇧 & Arabic 🇸🇦
- [x] `build_runner` generated outputs committed
- [x] No breaking changes to existing auth flow
