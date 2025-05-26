import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spacenea/theme/app_colors.dart';

import '../../widgets/sub_title.dart';
import '../bloc/explore_space_bloc.dart';
import '../bloc/explore_space_event.dart';
import '../bloc/explore_space_state.dart';
import '../widgets/object_space.dart';


class ExploreSpacePage extends StatelessWidget {
  const ExploreSpacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExploreSpaceBloc()..add(LoadExploreSpaceEvent()),
      child: Scaffold(        backgroundColor: AppColors.background,
        body: BlocBuilder<ExploreSpaceBloc, ExploreSpaceState>(
          builder: (context, state) {
            if (state is ExploreSpaceLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ExploreSpaceLoadedState) {
              return SafeArea(
                child: Column(
                  children: [
                    //search
                    //title
                    ObjectSpace(),
                    //image
                    SubTitle(subTitle: "The Gallery", onTapMore: () {},),
                  ],
                ),
              );
            } else if (state is ExploreSpaceErrorState) {
              return Center(child: Text(state.message));
            }
            return Center(child: Text("Welcome!"));
          },
        ),
      ),
    );
  }
}
