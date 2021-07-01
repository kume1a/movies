import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../state/movie_group/movie_group_bloc.dart';
import '../../../state/movie_group/movie_group_ui/movie_group_ui_bloc.dart';

class AddMovieButton extends StatelessWidget {
  const AddMovieButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieGroupUiBloc, MovieGroupUiState>(
      buildWhen: (MovieGroupUiState previous, MovieGroupUiState current) =>
          previous.isFabExpanded != current.isFabExpanded,
      builder: (BuildContext context, MovieGroupUiState state) {
        return FloatingActionButton.extended(
          onPressed: () => context.read<MovieGroupBloc>().add(const MovieGroupEvent.addMovieClicked()),
          label: AnimatedSwitcher(
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
            duration: const Duration(milliseconds: 150),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: SizeTransition(
                  sizeFactor: animation,
                  axis: Axis.horizontal,
                  child: child,
                ),
              );
            },
            child: state.isFabExpanded
                ? const Icon(Icons.add, color: Colors.white)
                : Row(
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 4.0),
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                      Text(
                        'Add Movie',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
          ),
        );
      },
    );
  }
}
