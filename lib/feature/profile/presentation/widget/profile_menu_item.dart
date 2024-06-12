import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    super.key,
    required this.title,
    required this.icon,
    required this.isActive,
  });

  final String title;
  final IconData icon;

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      color: isActive ? AppColor.primary : Colors.transparent,
      child: Row(
        children: [
          Icon(
            icon,
            color: isActive ? Colors.white : AppColor.textPrimary,
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: FotoInHeadingTypography.xxSmall(
              color: isActive ? Colors.white : AppColor.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
