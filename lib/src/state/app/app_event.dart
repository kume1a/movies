part of 'app_bloc.dart';

@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent.init() = _Init;
  const factory AppEvent.localeChanged(SupportedLocale locale) = _LocaleChanged;
}
