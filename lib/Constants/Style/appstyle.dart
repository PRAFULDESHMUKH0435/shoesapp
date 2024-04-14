import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appstyle(double size, Color color, FontWeight fw) {
  return GoogleFonts.poppins(color: color, fontSize: size, fontWeight: fw);
}

TextStyle appstylewithht(double size, Color color, FontWeight fw, double ht) {
  return GoogleFonts.poppins(
      color: color, fontSize: size, fontWeight: fw, height: ht);
}
