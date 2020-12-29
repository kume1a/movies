import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movo/src/application/stream/stream_bloc.dart';
import 'package:movo/src/presentation/values/constants.dart';
import 'package:movo/src/presentation/values/text_styles.dart';

class SeasonList extends StatelessWidget {
  final List<int> seasonNumbers;

  const SeasonList({@required this.seasonNumbers});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: BlocBuilder<StreamBloc, StreamState>(
        buildWhen: (StreamState prev, StreamState curr) => prev.season != curr.season,
        builder: (BuildContext context, StreamState state) => _buildList(state.season),
      ),
    );
  }

  Widget _buildList(int season) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: seasonNumbers.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildItem(context, seasonNumbers[index], season == seasonNumbers[index]);
      },
    );
  }

  Widget _buildItem(BuildContext context, int seasonNumber, bool isActive) {
    return GestureDetector(
      onTap: () => context.read<StreamBloc>().add(StreamEvent.seasonChanged(seasonNumber)),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 12, right: 8),
        child: AnimatedDefaultTextStyle(
          style: isActive ? prSB18 : scSB18,
          duration: mediumAnimDuration,
          child: Text('Season $seasonNumber'),
        ),
      ),
    );
  }
}
