import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacenea/explore_space/bloc/explore_space_bloc.dart';
import 'package:spacenea/explore_space/screens/explore_page.dart';

import '../bloc/explore_space_event.dart';

class ExploreSpaceScreen extends StatelessWidget {
  const ExploreSpaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExploreSpaceBloc(),
      child: Builder(
        builder: (context) {
          // Add the event after the widget tree is built
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<ExploreSpaceBloc>().add(LoadExploreSpaceEvent());
          });
          return ExploreSpacePage();
        },
      ),
    );
  }
}
