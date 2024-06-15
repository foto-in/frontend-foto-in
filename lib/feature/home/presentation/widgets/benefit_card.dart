import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';

class BenefitCard extends StatelessWidget {
  const BenefitCard(
      {super.key,
      required this.image,
      required this.title,
      required this.description});

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 32),
      clipBehavior: Clip.antiAlias,
      width: 620,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColor.backgroundSecondary),
      child: Row(
        children: [
          Image.asset(image),
          const SizedBox(width: 32),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: FotoInSubHeadingTypography.xLarge(
                      color: AppColor.textPrimary),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 334,
                  child: Expanded(
                    child: Text(
                      description,
                      style:
                          FotoInParagraph.medium(color: AppColor.textPrimary),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
