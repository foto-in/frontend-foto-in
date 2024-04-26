import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/navigation/presentation/view/navigation.dart';

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const NavigationCustom(),
            const SizedBox(
              height: 64,
            ),
            Row(
              children: [
                const Icon(
                  IconsaxOutline.arrow_left,
                  size: 24,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Pesanan/Detail/Pembayaran',
                  style: FotoInSubHeadingTypography.medium(
                    color: AppColor.textSecondary,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Pilih Metode Pembayaran",
                      style: FotoInSubHeadingTypography.medium(
                          color: AppColor.textSecondary),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xffF5F5F5),
                        ),
                        color: Color(0xffffffff),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Dana",
                            style: FotoInSubHeadingTypography.xLarge(
                                color: AppColor.textPrimary),
                          ),
                          Image.asset("assets/images/ic-dana.png"),
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
