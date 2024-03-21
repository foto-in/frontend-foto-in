import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class BtnPrimary extends StatelessWidget {
  const BtnPrimary({super.key, required this.tvButton});
  final String tvButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primary,
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          tvButton,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: FotoInColor.blue.shade50,
          ),
        ),
      ),
    );
  }
}

class BtnPrimaryWhite extends StatelessWidget {
  const BtnPrimaryWhite({
    super.key,
    required this.tvButton,
    required this.onPressed,
  });

  final String tvButton;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: AppColor.primary),
          ),
        ),
        child: Text(
          "Daftar",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColor.primary,
          ),
        ),
      ),
    );
  }
}
