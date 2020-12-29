import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movo/src/application/search/search_bloc.dart';
import 'package:movo/src/di/injection.dart';
import 'package:movo/src/presentation/screens/search/widgets/movie_list.dart';
import 'package:movo/src/presentation/screens/search/widgets/search_bar.dart';
import 'package:movo/src/presentation/values/colors.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (_) => getIt<SearchBloc>(),
      child: SearchPageContent(),
    );
  }
}

class SearchPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Container(
            color: Colors.transparent,
            child: _buildBody(context),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 4),
        SearchBar(
          onBackPressed: () => Navigator.pop(context),
          onChanged: (String value) {
            context.read<SearchBloc>().add(SearchEvent.queryChanged(value));
          },
          decoration: const InputDecoration(
            hintText: 'Search movies...',
            counterText: '',
            fillColor: Colors.white,
            hintStyle: TextStyle(color: colorTextSecondary),
            border: InputBorder.none,
          ),
        ),
        const SizedBox(height: 8),
        MovieList(),
      ],
    );
  }
}
