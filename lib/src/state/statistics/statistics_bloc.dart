import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../core/enums/time_period.dart';

part 'statistics_bloc.freezed.dart';
part 'statistics_event.dart';
part 'statistics_state.dart';

@injectable
class StatisticsBloc extends Bloc<StatisticsEvent, StatisticsState> {
  StatisticsBloc() : super(StatisticsState.initial());

  @override
  Stream<StatisticsState> mapEventToState(
    StatisticsEvent event,
  ) async* {
    yield* event.map(
      init: _init,
      timePeriodChanged: _timePeriodChanged,
      refreshData: _refreshData,
    );
  }

  Stream<StatisticsState> _init(_Init event) async* {}

  Stream<StatisticsState> _timePeriodChanged(_TimePeriodChanged event) async* {
    yield state.copyWith(timePeriod: event.timePeriod);
  }

  Stream<StatisticsState> _refreshData(_RefreshData event) async* {}
}
