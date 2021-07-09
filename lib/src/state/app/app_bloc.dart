import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../core/enums/supported_locale.dart';
import '../../core/helpers/supported_locale_helper.dart';
import '../../data/local/preferences/settings_helper.dart';

part 'app_bloc.freezed.dart';
part 'app_event.dart';
part 'app_state.dart';

@injectable
class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(
    this._settingsHelper,
  ) : super(AppState.initial());

  final SettingsHelper _settingsHelper;

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    yield* event.map(
      init: _init,
      localeChanged: _localeChanged,
    );
  }

  Stream<AppState> _init(_Init event) async* {
    final SupportedLocale locale = await _settingsHelper.readLocale();
    yield state.copyWith(
      selectedLocale: locale,
      locale: SupportedLocaleHelper.getLocale(locale),
    );
  }

  Stream<AppState> _localeChanged(_LocaleChanged event) async* {
    yield state.copyWith(
      selectedLocale: event.locale,
      locale: SupportedLocaleHelper.getLocale(event.locale),
    );
    await _settingsHelper.saveLocale(event.locale);
  }
}
