import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';

class FotograferTag extends StatelessWidget {
  final String text;

  const FotograferTag({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.secondary,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      margin: EdgeInsets.only(right: 8),
      child: Text(
        text,
        style: FotoInSubHeadingTypography.xSmall(
          color: AppColor.backgroundPrimary,
        ),
      ),
    );
  }
}
