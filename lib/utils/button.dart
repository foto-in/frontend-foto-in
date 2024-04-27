import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:google_fonts/google_fonts.dart';

class BtnPrimary extends StatelessWidget {
  const BtnPrimary({
    super.key,
    required this.tvButton,
    required this.onPressed,
    required this.radius,
  });
  final String tvButton;
  final Function onPressed;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primary,
          padding: const EdgeInsets.all(16),
          elevation: 0,
          splashFactory: NoSplash.splashFactory,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: Text(
          tvButton,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColor.primary.shade50,
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
          splashFactory: NoSplash.splashFactory,
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: AppColor.primary),
          ),
        ),
        child: Text(
          tvButton,
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

class FotoInButton extends StatelessWidget {
  const FotoInButton({
    super.key,
    this.backgroundColor = AppColor.primary,
    this.textColor = Colors.white,
    required this.text,
    required this.onPressed,
    this.borderRadius = 8,
    this.padding = const EdgeInsets.all(16),
    this.textStyle,
    this.width,
  });

  final Color backgroundColor;
  final Color textColor;
  final String text;
  final Function() onPressed;
  final double borderRadius;
  final EdgeInsets padding;
  final TextStyle? textStyle;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: padding,
          elevation: 0,
          splashFactory: NoSplash.splashFactory,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(
          text,
          style: textStyle ?? FotoInHeadingTypography.xxSmall(color: textColor),
        ),
      ),
    );
  }
}

class FotoInTextButton extends StatelessWidget {
  const FotoInTextButton({
    super.key,
    required this.child,
    required this.onTap,
  });

  final Row child;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      splashColor: AppColor.textTeriary.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }
}
