import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_colors.dart';

class Greetings extends StatelessWidget {
  const Greetings({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Good Morning",
              style: GoogleFonts.poppins(
                letterSpacing: 0.5,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.white,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Astronaut 👋🏻",
              style: GoogleFonts.poppins(
                letterSpacing: 0.5,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
                height: 1.2, // Adjusted for proper line height
              ),
            ),
          ),
        ],
      )
    );
  }
}
