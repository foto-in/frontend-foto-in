import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/profile/register_photographer/add_portofolio/presentation/provider/add_portofolio_provider.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class AddPhoto extends StatelessWidget {
  const AddPhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AddPortofolioProvider addPortofolioProvider =
        Provider.of<AddPortofolioProvider>(context);
    return GestureDetector(
      onTap: () {
        addPortofolioProvider.pickImage();
      },
      child: Container(
        height: 143,
        decoration: BoxDecoration(
          color: AppColor.backgroundSecondary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Iconsax.add,
              color: AppColor.textSecondary,
            ),
            const SizedBox(
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
      ),
    );
  }
}
