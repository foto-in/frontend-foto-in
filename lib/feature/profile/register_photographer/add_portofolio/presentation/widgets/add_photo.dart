import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:iconsax/iconsax.dart';

class AddPhoto extends StatelessWidget {
  const AddPhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 143,
      decoration: BoxDecoration(
        color: AppColor.backgroundSecondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Iconsax.add,
            color: AppColor.textSecondary,
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "Tambah\nGambar",
            style: FotoInLabelTypography.small(
              color: AppColor.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
