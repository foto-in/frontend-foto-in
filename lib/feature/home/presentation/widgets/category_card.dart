import 'package:flutter/cupertino.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';

class CardCategory extends StatelessWidget {
  const CardCategory({
    super.key,
    required this.category,
    required this.image,
  });

  final String category;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,
      height: 290,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColor.backgroundSecondary,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32, top: 32),
            child: Text(
              category,
              style: FotoInSubHeadingTypography.xxLarge(
                color: AppColor.textPrimary,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(image),
            ],
          )
        ],
      ),
    );
  }
}

class CardCategoryMobile extends StatelessWidget {
  const CardCategoryMobile(
      {super.key, required this.category, required this.image});

  final String category;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145,
      height: 145,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColor.backgroundSecondary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: Text(
              category,
              style: FotoInSubHeadingTypography.xSmall(
                color: AppColor.textPrimary,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(image, width: 107, height: 107),
            ],
          )
        ],
      ),
    );
  }
}
