import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';

class OrderInfo extends StatelessWidget {
  final String title;
  final String value;

  const OrderInfo({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: FotoInSubHeadingTypography.xSmall(
            color: AppColor.textSecondary,
          ),
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: FotoInSubHeadingTypography.medium(),
        )
      ],
    );
  }
}
