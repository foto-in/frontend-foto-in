import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';

class TabPill extends StatelessWidget {
  final bool isActive;
  final String title;
  final Function() onTap;

  const TabPill({
    super.key,
    this.isActive = false,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      // make it pill
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(99),
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: isActive ? AppColor.primary : AppColor.backgroundSecondary,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 11.5,
            ),
            child: Text(
              title,
              style: FotoInSubHeadingTypography.small(
                color: isActive
                    ? AppColor.backgroundPrimary
                    : AppColor.textSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
