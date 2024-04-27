import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';

class ProfileFormTitle extends StatelessWidget {
  const ProfileFormTitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: FotoInHeadingTypography.small(
            color: AppColor.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: FotoInParagraph.small(
            color: AppColor.textSecondary,
          ),
        ),
      ],
    );
  }
}
