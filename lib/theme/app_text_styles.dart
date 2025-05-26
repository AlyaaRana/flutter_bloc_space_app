import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spacenea/widgets/sub_title.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle get _base =>
      GoogleFonts.poppins(color: Colors.white, letterSpacing: 0);

  static TextStyle get _header =>
      GoogleFonts.poppins(color: Colors.black, letterSpacing: 0);

  // Headings
  static TextStyle get h1 =>
      _header.copyWith(fontSize: 16, fontWeight: FontWeight.w500);

  static TextStyle get h2 =>
      _header.copyWith(fontSize: 12, fontWeight: FontWeight.w400);

  static TextStyle get headerButton =>
      _header.copyWith(fontSize: 14, fontWeight: FontWeight.w500);

  static TextStyle get h3 =>
      _base.copyWith(fontSize: 14, fontWeight: FontWeight.w600);
  static TextStyle get more =>
      _base.copyWith(fontSize: 12, fontWeight: FontWeight.w500, height: 1.4);
  //Planet
  static TextStyle get titlePlanetHeader => _base.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );
  static TextStyle get titlePlanetHeader2 => _base.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );
  static TextStyle get titlePlanet => _base.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
  );

  static TextStyle get subTitlePlanet => _base.copyWith(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
  );

  //Explore
  static TextStyle get titleExplore =>
      _base.copyWith(fontSize: 30, fontWeight: FontWeight.w600);

  static TextStyle get subTitleExplore =>
      _base.copyWith(fontSize: 15, fontWeight: FontWeight.w400);

  // Detail Planet
  static TextStyle get titleDetailPlanet => _base.copyWith(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: AppColors.white.withOpacity(0.5),
  );

  static TextStyle get headingPlanet =>
      _base.copyWith(fontSize: 14, fontWeight: FontWeight.w600);

  static TextStyle get subHeadingPlanet =>
      _base.copyWith(fontSize: 15, fontWeight: FontWeight.w600);

  static TextStyle get body => _base.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );

  static TextStyle get infoPlanet =>
      _base.copyWith(fontSize: 13, fontWeight: FontWeight.w400);

  static TextStyle get descPlanet => _base.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );
  static TextStyle get bodyPlanet =>
      _base.copyWith(fontSize: 13, fontWeight: FontWeight.w400);
  static TextStyle get planetNameStories =>
      _base.copyWith(fontSize: 14, fontWeight: FontWeight.w600);
  //3D
  static TextStyle get title3DPopUp =>
      _base.copyWith(fontSize: 20, fontWeight: FontWeight.w600);
  static TextStyle get desc3DPopUp => _base.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );
  static TextStyle get buttonPopUp =>
      _base.copyWith(fontSize: 16, fontWeight: FontWeight.w600);
  //News
  static TextStyle get titleNews => _base.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
  );
  static TextStyle get date =>
      _base.copyWith(fontSize: 14, fontWeight: FontWeight.w500);
}
