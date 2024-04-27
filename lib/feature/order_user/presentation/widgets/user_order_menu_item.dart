import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/utils/button.dart';
import 'package:foto_in/utils/enums/action_button_variant_enum.dart';
import 'package:foto_in/utils/enums/order_status_enum.dart';
import 'package:foto_in/utils/extensions/extensions.dart';

class UserOrderMenuItem extends StatelessWidget {
  const UserOrderMenuItem(
      {super.key,
      required this.name,
      required this.bookingDate,
      required this.photoSessionDate,
      required this.status});

  final String name;
  final String bookingDate;
  final String photoSessionDate;
  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    String statusText = status.parseBookingStatusToString();
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 26,
        vertical: 26,
      ),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColor.backgroundSecondary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              name,
              style: FotoInSubHeadingTypography.medium(
                  color: AppColor.textPrimary),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              bookingDate,
              style: FotoInSubHeadingTypography.medium(
                  color: AppColor.textPrimary),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              photoSessionDate,
              style: FotoInSubHeadingTypography.medium(
                  color: AppColor.textPrimary),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              statusText,
              style: FotoInSubHeadingTypography.medium(
                  color: AppColor.textPrimary),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ActionButton(
                  variant: ActionButtonVariant.detail,
                  text: 'Detail',
                  onPressed: () {
                    Navigator.pushNamed(context, '/detail_pesanan_user');
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
