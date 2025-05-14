import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppStyles {
  static final bold24 = GoogleFonts.inter(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
  );
 static final bold96 = GoogleFonts.inter(
   fontSize: 96.sp,
   fontWeight: FontWeight.bold,
 ); 

 static final medium24 = GoogleFonts.inter(
   fontSize: 24.sp,
   fontWeight: FontWeight.w500,
 );

 static final medium20 = GoogleFonts.inter(
   fontSize: 20.sp,
   fontWeight: FontWeight.w500,
 );
 
 static final bold28 = GoogleFonts.inter(
   fontSize: 28.sp,
   fontWeight: FontWeight.bold,
 );
  static final semibold32 = GoogleFonts.inter(
   fontSize: 32.sp,
   fontWeight: FontWeight.w600,
 );
}