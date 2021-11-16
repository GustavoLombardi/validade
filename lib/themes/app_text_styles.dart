import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:validade/themes/app_colors.dart';

class TextStyles {
  static final nomeLogin = GoogleFonts.ubuntu(
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.login,
  );
  static final titleEmpresa = GoogleFonts.ubuntu(
    fontSize: 25.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
  );
  static final cardHome = GoogleFonts.ubuntu(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.text,
  );
  static final empresas = GoogleFonts.ubuntu(
    fontSize: 19.sp,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );
}
