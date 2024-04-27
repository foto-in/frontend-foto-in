import 'package:flutter/cupertino.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';

class StepCard extends StatelessWidget {
  const StepCard(
      {super.key,
      required this.step,
      required this.title,
      required this.description});

  final String step;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      width: 224,
      decoration: BoxDecoration(
        color: const Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            step,
            style: FotoInHeadingTypography.xxLarge(
              color: AppColor.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          Text(title,
              style:
                  FotoInHeadingTypography.xSmall(color: AppColor.textPrimary)),
          const SizedBox(height: 12),
          Text(description,
              style: FotoInParagraph.medium(color: AppColor.textPrimary)),
        ],
      ),
    );
  }
}
