import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/portofolio_detail/presentation/view/portofolio_view.dart';
import 'package:foto_in/feature/profile/presentation/widget/preview_image.dart';

class PortofolioCardSmall extends StatelessWidget {
  final double marginSide;

  const PortofolioCardSmall({
    super.key,
    this.marginSide = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16, left: marginSide, right: marginSide),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColor.backgroundTertiary,
          width: 1.5,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: AppColor.backgroundPrimary,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              PortofolioDetailMobileView.routeName,
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pernikahan Romantis di Pantai',
                      style: FotoInSubHeadingTypography.small(
                        color: AppColor.primary,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                PreviewImage(count: 4, size: 104),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
