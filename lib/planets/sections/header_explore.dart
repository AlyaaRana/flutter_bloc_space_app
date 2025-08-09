import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spacenea/planets/data/planet_model.dart';
import 'package:spacenea/theme/app_icons.dart';
import 'package:spacenea/planets/bloc/planet_bloc.dart';

import '../../theme/app_images.dart';
import '../../theme/app_text_styles.dart';
import '../../theme/app_colors.dart';

class HeaderExplore extends StatelessWidget {
  const HeaderExplore({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlanetBloc, PlanetState>(
      builder: (context, state) {
        if (state is PlanetsLoadedState) {
          return _buildHeader(context, state);
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildHeader(BuildContext context, PlanetsLoadedState state) {
    return Stack(
      children: [
        // Main content
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildExploreButton(context, state),
                  _buildSearchIcon(),
                ],
              ),
              const SizedBox(height: 20),
              _buildPlanetCard(context, state.selectedPlanet),
            ],
          ),
        ),

        if (state.isDropdownOpen)
          _buildDropdownOverlay(context, state),
      ],
    );
  }

  Widget _buildExploreButton(BuildContext context, PlanetsLoadedState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            context.read<PlanetBloc>().add(ToggleDropdown());
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Explore", style: AppTextStyles.titlePlanetHeader),
                const SizedBox(width: 8),
                AnimatedRotation(
                  turns: state.isDropdownOpen ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: SvgPicture.asset(
                    AppIcons.arrowUp,
                    width: 16,
                    height: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          children: [
            SvgPicture.asset(AppIcons.location),
            const SizedBox(width: 5),
            Text(state.selectedPlanet.name, style: AppTextStyles.titleExplore),
          ],
        ),
      ],
    );
  }

  Widget _buildDropdownOverlay(BuildContext context, PlanetsLoadedState state) {
    return Positioned(
      top: 65,
      left: 15,
      right: null,
      child: Material(
        elevation: 16,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: 300,
          constraints: const BoxConstraints(maxHeight: 350),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.white.withOpacity(0.1),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.explore,
                      color: Colors.white.withOpacity(0.8),
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Select Destination",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),

              // Planet list
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: state.planets.length,
                  itemBuilder: (context, index) {
                    final planet = state.planets[index];
                    final isSelected = planet.name == state.selectedPlanet.name;
                    return _buildDropdownItem(context, planet, isSelected);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownItem(BuildContext context, PlanetModel planet, bool isSelected) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          context.read<PlanetBloc>().add(SelectPlanet(planet));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected
                ? Colors.white.withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: isSelected
                ? Border.all(color: Colors.white.withOpacity(0.3), width: 1)
                : null,
          ),
          child: Row(
            children: [
              // Planet preview image
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  image: DecorationImage(
                    image: AssetImage(planet.image),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      planet.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: isSelected
                            ? Colors.white
                            : Colors.white.withOpacity(0.9),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      planet.initial,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
              if (isSelected)
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchIcon() {
    return safeSvg(AppIcons.searchIcon);
  }

  Widget _buildPlanetCard(BuildContext context, PlanetModel planet) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/planets-detail', arguments: planet);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 387,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(planet.image),
              fit: BoxFit.cover,
              onError: (exception, stackTrace) {
                print("Error loading image: $exception");
              },
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(planet.name, style: AppTextStyles.titlePlanet),
                    const SizedBox(height: 5),
                    Text(planet.initial, style: AppTextStyles.subTitlePlanet),
                  ],
                ),
                Image.asset(AppImages.nasaLogo),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget safeSvg(String assetName, {double? width, double? height}) {
    try {
      return SvgPicture.asset(
        assetName,
        width: width,
        height: height,
      );
    } catch (e) {
      print("Error loading SVG asset: $assetName\n$e");
      return const SizedBox();
    }
  }
}