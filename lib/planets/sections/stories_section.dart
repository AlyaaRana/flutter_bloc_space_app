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
    return BlocBuilder<PlanetBloc, PlanetState>(
      builder: (context, state) {
        if (state is PlanetsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PlanetsErrorState) {
          return Center(child: Text(state.message));
        } else if (state is PlanetsLoadedState) {
          final stories =
              state.planets.expand((planet) => planet.stories).toList();

          if (stories.isEmpty) {
            return const Center(child: Text("No stories available")); //fix this
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubTitle(
                subTitle: "${state.planets.first.name} Stories",
                onTapMore: () {},
                moreText: "Explore all ${state.planets.first.name} stories",
                moreIconOrImage: Image.asset(AppImages.moreStories),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: MasonryGridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  itemCount: stories.length,
                  itemBuilder: (context, index) {
                    final story = stories[index];
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Stack(
                        children: [
                          Image.asset(story.image, fit: BoxFit.cover),
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.6),
                                    Colors.transparent,
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 12,
                            left: 12,
                            right: 12,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  story.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  story.detail,
                                  style: const TextStyle(
                                    color: Colors.white60,
                                    fontSize: 12,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
