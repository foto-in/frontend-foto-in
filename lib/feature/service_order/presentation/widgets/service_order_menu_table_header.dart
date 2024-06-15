import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';

class ServiceOrderMenuTableHeader extends StatelessWidget {
  const ServiceOrderMenuTableHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 26,
        vertical: 16,
      ),
      margin: const EdgeInsets.only(top: 32, bottom: 20),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xffEEEEEE)),
          top: BorderSide(color: Color(0xffEEEEEE)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              "Nama Pelanggan",
              style: FotoInSubHeadingTypography.medium(
                  color: AppColor.textSecondary),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              "Tanggel Booking",
              style: FotoInSubHeadingTypography.medium(
                  color: AppColor.textSecondary),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              "Sesi Foto",
              style: FotoInSubHeadingTypography.medium(
                  color: AppColor.textSecondary),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              "Status",
              style: FotoInSubHeadingTypography.medium(
                  color: AppColor.textSecondary),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              "Actions",
              style: FotoInSubHeadingTypography.medium(
                  color: AppColor.textSecondary),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
