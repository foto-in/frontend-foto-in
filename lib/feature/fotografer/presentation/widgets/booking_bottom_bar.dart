import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/utils/button.dart';

class BookingBottomBar extends StatelessWidget {
  const BookingBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
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
              SizedBox(
                height: 4,
              ),
              Text(
                "IDR 1.500.000",
                style: FotoInSubHeadingTypography.large(
                    color: AppColor.textPrimary),
              )
            ],
          ),
          FotoInButton(
            text: "Booking",
            onPressed: () {},
            padding: EdgeInsets.symmetric(horizontal: 56, vertical: 16),
          ),
        ],
      ),
    );
  }
}
