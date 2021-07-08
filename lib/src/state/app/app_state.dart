part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    required Locale locale,
    required SupportedLocale selectedLocale,
  }) = _AppState;

  factory AppState.initial() => const AppState(
        locale: Locale('en'),
        selectedLocale: SupportedLocale.en,
      );
}
