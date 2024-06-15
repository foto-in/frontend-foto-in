import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/galeri/galeri_details/presentation/view/galeri_details_view.dart';

class GaleriItem extends StatelessWidget {
  const GaleriItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, GaleriDetailsView.routeName);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 155,
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: AppColor.backgroundSecondary,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Image(
              image: NetworkImage(
                "https://images.unsplash.com/photo-1718049720096-7f1af82d69af",
              ),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            "Cahaya Abafi Fotografi",
            style: FotoInSubHeadingTypography.small(),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              const Icon(Icons.photo, size: 16, color: AppColor.textSecondary),
              const SizedBox(
                width: 4,
              ),
              Text(
                "20",
                style: FotoInSubHeadingTypography.xSmall(
                  color: AppColor.textSecondary,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              const Icon(
                Icons.access_time_filled,
                size: 16,
                color: AppColor.textSecondary,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                "90 Hari",
                style: FotoInSubHeadingTypography.xSmall(
                  color: AppColor.textSecondary,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
