# Flutter BLoC App Template

A lean Flutter starter for building feature-first apps with BLoC, GetIt, routing, environment configuration, and clean architecture boundaries.

This repository is intentionally small. It keeps the reusable application shell and sample feature patterns while avoiding product-specific business logic.

## Stack

- Flutter and Dart
- `flutter_bloc` / `bloc` for state management
- `get_it` for dependency injection
- `flutter_dotenv` for environment configuration
- `http` for API access
- `shared_preferences` for lightweight local persistence
- `equatable` for value-based events, states, and entities

## Getting Started

```bash
flutter pub get
cp .env.example .env
flutter run
```

Demo credentials:

```text
demo@example.com
password
```

## Project Structure

```text
lib/
  core/
    bloc/          App-wide BLoC provider composition
    constants/     Shared app constants
    helpers/       Dependency injection bootstrap
    routes/        Route generation and observer
    themes/        Material theme setup
    widgets/       Shared fallback/error UI

  features/
    auth/          Sample login/splash feature
    home/          Sample dashboard feature

  services/        API and external service wrappers
  shared/          Generic models and utilities
```

Each feature follows the same convention:

```text
feature/
  data/
    datasources/
    repositories/
  domain/
    entities/
    repositories/
    usecases/
  presentation/
    bloc/
    view/
    feature_di.dart
```

## Adding A Feature

1. Create the feature folders under `lib/features/<feature_name>/`.
2. Define domain entities, repository contracts, and use cases first.
3. Implement data sources and repository implementations in `data/`.
4. Add events, states, and a BLoC in `presentation/bloc/`.
5. Register the feature dependencies in `<feature_name>_di.dart`.
6. Call the feature DI function from `core/helpers/injection_container.dart`.
7. Add routes in `core/routes/app_router.dart`.
8. Add focused tests for the BLoC, repository, and main widget flow.

## Useful Commands

```bash
flutter pub get
dart format --set-exit-if-changed .
flutter analyze
flutter test
flutter run -d chrome
```

## Environment

`.env` is ignored by git. Keep local secrets there and commit only safe placeholders in `.env.example`.
