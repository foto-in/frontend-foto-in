import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/core/utils/dotted_string_number.dart';
import 'package:foto_in/utils/button.dart';

class BookingBottomBar extends StatelessWidget {
  const BookingBottomBar({
    super.key,
    required this.price,
    required this.onPressed,
  });

  final int price;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColor.backgroundPrimary,
        // border top
        border: Border(
          top: BorderSide(
            color: Color(0xFFF5F5F5),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mulai Dari",
                style: FotoInSubHeadingTypography.small(
                    color: AppColor.textTeriary),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "IDR ${intToCurrency(price)}",
                style: FotoInSubHeadingTypography.large(
                    color: AppColor.textPrimary),
              )
            ],
          ),
          FotoInButton(
            text: "Booking",
            onPressed: onPressed,
            padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 16),
          ),
        ],
      ),
    );
  }
}
