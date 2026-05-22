# Project Structure

This template uses a modular Flutter monolith. Shared app infrastructure lives in `core/`, cross-feature utilities live in `shared/`, external wrappers live in `services/`, and product workflows live in `features/`.

## Bootstrap

Startup begins in `lib/main.dart`.

The bootstrap sequence:

1. Initializes Flutter bindings.
2. Registers Flutter and platform error handlers.
3. Loads `.env`, falling back to `.env.example`.
4. Runs `init()` from `core/helpers/injection_container.dart`.
5. Starts `TemplateApp`.

`TemplateApp` wraps `MaterialApp` in `AppBlocProviders`, uses `AppTheme`, and delegates route creation to `AppRouter.generateRoute`.

## Dependency Injection

`GetIt` is exposed as:

```dart
final sl = GetIt.instance;
```

Register app-wide services first, then feature-specific dependencies:

```dart
Future<void> init() async {
  sl.registerLazySingleton<ApiService>(() => ApiService());
  await initAuth(sl);
  await initHome(sl);
}
```

## State Management

Feature state uses BLoC. Events describe user or lifecycle input, states describe renderable UI state, and BLoCs coordinate use cases.

App-wide providers are composed in `core/bloc/bloc_providers.dart`. Add long-lived BLoCs there only when they are needed across routes. Prefer route-local providers for workflow state that should reset when a page closes.

## Routing

Routes are centralized in `core/routes/app_router.dart`.

Current starter routes:

- `/` splash
- `/login`
- `/home`
- fallback not-found page

## Feature Pattern

Features should keep dependencies flowing inward:

```text
view -> bloc -> usecase -> repository contract -> repository implementation -> datasource
```

Domain code should not import Flutter UI packages. Data code should implement domain contracts. Presentation code should depend on use cases and render states.
