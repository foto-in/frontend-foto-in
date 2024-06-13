import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';

class PhotographerAchievement extends StatelessWidget {
  final Icon icon;
  final String text;

  const PhotographerAchievement({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.backgroundSecondary,
        borderRadius: BorderRadius.circular(99),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      margin: const EdgeInsets.only(right: 8),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 4),
          Text(
            text,
            style: FotoInSubHeadingTypography.xSmall(
                color: AppColor.textSecondary),
          )
        ],
      ),
    );
  }
}
