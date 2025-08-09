import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../bloc/planet_bloc.dart';
import '../../theme/app_images.dart';
import '../../widgets/sub_title.dart';

class StoriesSection extends StatelessWidget {
  const StoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<PlanetBloc, PlanetState>(
      builder: (context, state) {
        if (state is PlanetsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PlanetsErrorState) {
          return Center(child: Text(state.message));
        } else if (state is PlanetsLoadedState) {
          final stories = state.planets.expand((planet) => planet.stories).toList();

          if (stories.isEmpty) {
            return const Center(child: Text("No stories available"));
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SubTitle(
                  subTitle: "${state.selectedPlanet.name} Stories",
                  onTapMore: () {},
                  moreText: "Explore all ${state.selectedPlanet.name} stories",
                  moreIconOrImage: Image.asset(AppImages.moreStories),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: StaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    children: List.generate(stories.length, (index) {
                      final story = stories[index];
                      return StaggeredGridTile.count(
                        crossAxisCellCount: index == 0 ? 2 : 1,
                        mainAxisCellCount: index == 0 ? 1.5 : 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(story.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  story.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 4,
                                        color: Colors.black54,
                                        offset: Offset(1, 1),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  story.detail,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 3,
                                        color: Colors.black45,
                                        offset: Offset(1, 1),
                                      ),
                                    ],
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
