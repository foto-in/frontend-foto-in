import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/navigation/presentation/view/navigation.dart';
import 'package:foto_in/feature/payment/presentation/widgets/payment_widgets.dart';

class PaymentWidgetWeb extends StatelessWidget {
  const PaymentWidgetWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: Column(
          children: [
            const NavigationCustom(),
            const SizedBox(
              height: 64,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: InkWell(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
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
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 80),
              child: PaymentWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
