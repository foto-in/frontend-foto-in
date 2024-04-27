import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/galeri/presentation/widgets/galeri_details_widgets.dart';
import 'package:iconsax/iconsax.dart';

class GaleriCard extends StatelessWidget {
  const GaleriCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          GaleriDetails.routeName,
        );
      },
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 350,
          minWidth: 250,
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "assets/images/image-carousel-web.png",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Cahaya Abadi Fotografi",
              style: FotoInHeadingTypography.xSmall(
                color: AppColor.textPrimary,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                const Icon(
                  Iconsax.gallery,
                  size: 20,
                  color: AppColor.textSecondary,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "20",
                  style: FotoInSubHeadingTypography.small(
                    color: AppColor.textSecondary,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                const Icon(
                  Iconsax.clock,
                  size: 20,
                  color: AppColor.textSecondary,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "90 Hari",
                  style: FotoInSubHeadingTypography.small(
                    color: AppColor.textSecondary,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
