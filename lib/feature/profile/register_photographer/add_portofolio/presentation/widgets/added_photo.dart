import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:iconsax/iconsax.dart';

class AddedPhoto extends StatelessWidget {
  const AddedPhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 143,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColor.backgroundSecondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          const Image(
            image: NetworkImage(
              "https://images.unsplash.com/photo-1718049720096-7f1af82d69af",
            ),
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(
              Iconsax.trash,
              color: AppColor.textPrimary,
              size: 12,
            ),
          ),
        ],
      ),
    );
  }
}
