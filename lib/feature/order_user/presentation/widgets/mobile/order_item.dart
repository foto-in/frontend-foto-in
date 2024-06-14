import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/order_user/presentation/widgets/mobile/order_info.dart';

class OrderItem extends StatelessWidget {
  final void Function() onTap;

  const OrderItem({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.pushNamed(context, OrderUserDetailView.routeName);
      // },
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 20,
        ),
        decoration: BoxDecoration(
          color: AppColor.backgroundPrimary,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Color(0xFFF5F5F5),
          ),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Cahaya Abafi Fotografi",
              style: FotoInSubHeadingTypography.large(),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: OrderInfo(
                    title: "Tanggal booking",
                    value: "24/03/2024",
                  ),
                ),
                Expanded(
                  child: OrderInfo(
                    title: "Sesi foto",
                    value: "31/03/2024",
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: OrderInfo(
                    title: "Status",
                    value: "Menunggu Konfirmasi",
                  ),
                ),
                Icon(Icons.chevron_right_rounded),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
