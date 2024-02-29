import 'package:codeli/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;
  final VoidCallback onTap;

  const ButtonWidget(
      {super.key,
      required this.label,
      required this.backgroundColor,
      required this.fontColor,
      required this.borderColor,
      required this.onTap});

  const ButtonWidget.primary(
      {required String label, required VoidCallback onTap, super.key})
      : backgroundColor = AppColors.primary,
        fontColor = AppColors.white,
        borderColor = AppColors.primary,
        this.onTap = onTap,
        this.label = label;

  const ButtonWidget.transparent(
      {required String label, required VoidCallback onTap, super.key})
      : backgroundColor = Colors.transparent,
        fontColor = AppColors.white,
        borderColor = Colors.transparent,
        this.onTap = onTap,
        this.label = label;

  const ButtonWidget.transparentPrimary(
      {required String label, required VoidCallback onTap, super.key})
      : backgroundColor = Colors.transparent,
        fontColor = AppColors.primary,
        borderColor = Colors.transparent,
        this.onTap = onTap,
        this.label = label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(backgroundColor),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
        ),
        onPressed: onTap,
        child: Text(
          label,
          style: GoogleFonts.notoSans(
              fontWeight: FontWeight.w600, fontSize: 16, color: fontColor),
        ),
      ),
    );
  }
}
