import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/booking_detail/presentation/widgets/booking_detail_widgets.dart';
import 'package:foto_in/feature/navigation/presentation/view/navigation.dart';
import 'package:foto_in/utils/button.dart';

class PaymentWidget extends StatefulWidget {
  const PaymentWidget({super.key});

  @override
  State<PaymentWidget> createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  PaymentItemModel activeMenu = menus.first;
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
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: ResizeWidgets(
                  width: 920,
                  lChild: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pilih Metode Pembayaran",
                              style: FotoInSubHeadingTypography.medium(
                                  color: AppColor.textSecondary),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              child: Column(
                                children: menus
                                    .map(
                                      (e) => GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            activeMenu = e;
                                          });
                                        },
                                        child: PaymentMenuItem(
                                          title: e.title,
                                          icon: e.icon,
                                          isActive: e == activeMenu,
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ringkasan Pembayaran",
                            style: FotoInSubHeadingTypography.medium(
                                color: AppColor.textSecondary),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Container(
                            width: 381,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppColor.primary,
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "DP",
                                      style: FotoInLabelTypography.large(
                                          color: AppColor.textSecondary),
                                    ),
                                    Text(
                                      "500.000",
                                      style: FotoInLabelTypography.large(
                                          color: AppColor.textSecondary),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Divider(
                                  color: AppColor.textSecondary,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total Pembayaran",
                                      style: FotoInSubHeadingTypography.xLarge(
                                          color: AppColor.textPrimary),
                                    ),
                                    Text(
                                      "500.000",
                                      style: FotoInSubHeadingTypography.xLarge(
                                          color: AppColor.textPrimary),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 381,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(
                                  () {
                                    showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) {
                                          return Dialog(
                                              backgroundColor:
                                                  Colors.transparent,
                                              surfaceTintColor:
                                                  Colors.transparent,
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    color:
                                                        const Color(0xffffffff),
                                                  ),
                                                  padding:
                                                      const EdgeInsets.all(40),
                                                  constraints:
                                                      const BoxConstraints(
                                                          maxWidth: 345,
                                                          maxHeight: 380),
                                                  child: const DialogItem()));
                                        });
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                "Bayar",
                                style: FotoInSubHeadingTypography.medium(
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  sChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pilih Metode Pembayaran",
                            style: FotoInSubHeadingTypography.medium(
                                color: AppColor.textSecondary),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            child: Column(
                              children: menus
                                  .map(
                                    (e) => GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          activeMenu = e;
                                        });
                                      },
                                      child: PaymentMenuItem(
                                        title: e.title,
                                        icon: e.icon,
                                        isActive: e == activeMenu,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ringkasan Pembayaran",
                            style: FotoInSubHeadingTypography.medium(
                                color: AppColor.textSecondary),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Container(
                            width: 381,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppColor.primary,
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "DP",
                                      style: FotoInLabelTypography.large(
                                          color: AppColor.textSecondary),
                                    ),
                                    Text(
                                      "500.000",
                                      style: FotoInLabelTypography.large(
                                          color: AppColor.textSecondary),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Divider(
                                  color: AppColor.textSecondary,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Total Pembayaran",
                                      style: FotoInSubHeadingTypography.xLarge(
                                          color: AppColor.textPrimary),
                                    ),
                                    Text(
                                      "500.000",
                                      style: FotoInSubHeadingTypography.xLarge(
                                          color: AppColor.textPrimary),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 381,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(
                                  () {
                                    showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) {
                                          return Dialog(
                                              backgroundColor:
                                                  Colors.transparent,
                                              surfaceTintColor:
                                                  Colors.transparent,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  color:
                                                      const Color(0xffffffff),
                                                ),
                                                padding:
                                                    const EdgeInsets.all(40),
                                                constraints:
                                                    const BoxConstraints(
                                                        maxWidth: 345,
                                                        maxHeight: 380),
                                                child: const DialogItem(),
                                              ));
                                        });
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                "Bayar",
                                style: FotoInSubHeadingTypography.medium(
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class DialogItem extends StatelessWidget {
  const DialogItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/payment-success.png",
          width: 180,
          height: 180,
        ),
        Text(
          "Pembayaran Berhasil",
          style: FotoInSubHeadingTypography.large(color: AppColor.textPrimary),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "Pesanan kamu sudah dibayar, silahkan cek detail pesanan.",
          textAlign: TextAlign.center,
          style: FotoInParagraph.small(color: AppColor.textPrimary),
        ),
        BtnPrimary(
            tvButton: "Cek Pesanan",
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, "/pesanan", (route) => false);
            },
            radius: 8),
      ],
    );
  }
}

class PaymentMenuItem extends StatelessWidget {
  const PaymentMenuItem({
    super.key,
    required this.title,
    required this.icon,
    required this.isActive,
  });

  final String title;
  final String icon;

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isActive ? AppColor.primary : const Color(0xffF5F5F5),
        ),
        color: const Color(0xffffffff),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style:
                FotoInSubHeadingTypography.xLarge(color: AppColor.textPrimary),
          ),
          ResizeWidgets(
              width: 920,
              sChild: Image.asset(
                icon,
                width: MediaQuery.of(context).size.width * 0.2,
              ),
              lChild: Image.asset(icon)),
        ],
      ),
    );
  }
}

final List<PaymentItemModel> menus = [
  // Edit Profile
  PaymentItemModel(
    title: 'Dana',
    icon: 'assets/images/ic-dana.png',
  ),

  // Reset Password
  PaymentItemModel(
    title: 'Gopay',
    icon: 'assets/images/ic-gopay.png',
  ),

  PaymentItemModel(title: "DummyPay", icon: "assets/images/ic-gopay.png")
];

class PaymentItemModel {
  final String title;
  final String icon;

  PaymentItemModel({
    required this.title,
    required this.icon,
  });
}
