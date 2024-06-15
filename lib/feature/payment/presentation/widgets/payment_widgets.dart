import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/booking_detail/presentation/widgets/booking_detail_widgets.dart';
import 'package:foto_in/utils/button.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PaymentWidget extends StatefulWidget {
  const PaymentWidget({super.key});

  @override
  State<PaymentWidget> createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  PaymentItemModel activeMenu = menus.first;

  void dialogButtonAction(SizingInformation sizingInformation) {
    if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
      Navigator.pushNamedAndRemoveUntil(context, "/pesanan", (route) => false);
    } else {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResizeWidgets(
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
                SizedBox(
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
          SizedBox(
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
              SizedBox(
                height: 12,
              ),
              Container(
                width: 381,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColor.primary,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    SizedBox(
                      height: 8,
                    ),
                    Divider(
                      color: AppColor.textSecondary,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              SizedBox(
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
                              backgroundColor: Colors.transparent,
                              surfaceTintColor: Colors.transparent,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: const Color(0xffffffff),
                                ),
                                padding: const EdgeInsets.all(40),
                                constraints: const BoxConstraints(
                                    maxWidth: 345, maxHeight: 380),
                                child: ResponsiveBuilder(
                                  builder: (context, sizingInformation) {
                                    return DialogItem(onPressed: () {
                                      dialogButtonAction(sizingInformation);
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                        );
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
                      color: Color(0xffffffff),
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
              SizedBox(
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
          SizedBox(
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
              SizedBox(
                height: 12,
              ),
              ResponsiveBuilder(builder: (context, sizingInformation) {
                return Container(
                  width: sizingInformation.deviceScreenType ==
                          DeviceScreenType.desktop
                      ? 381
                      : double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColor.primary,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      SizedBox(
                        height: 8,
                      ),
                      Divider(
                        color: AppColor.textSecondary,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                );
              }),
              SizedBox(
                height: 20,
              ),
              ResponsiveBuilder(builder: (context, sizingInformation) {
                return SizedBox(
                  width: sizingInformation.deviceScreenType ==
                          DeviceScreenType.desktop
                      ? 381
                      : double.infinity,
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
                                backgroundColor: Colors.transparent,
                                surfaceTintColor: Colors.transparent,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: const Color(0xffffffff),
                                  ),
                                  padding: EdgeInsets.all(
                                      sizingInformation.deviceScreenType ==
                                              DeviceScreenType.desktop
                                          ? 40
                                          : 16),
                                  constraints: const BoxConstraints(
                                    maxWidth: 345,
                                    maxHeight: 380,
                                  ),
                                  width: double.infinity,
                                  child: DialogItem(
                                    // path: "/pesanan",
                                    onPressed: () {
                                      dialogButtonAction(sizingInformation);
                                    },
                                  ),
                                ),
                              );
                            },
                          );
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
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                );
              })
            ],
          ),
        ],
      ),
    );
  }
}

class DialogItem extends StatelessWidget {
  const DialogItem({
    super.key,
    // required this.path,
    required this.onPressed,
  });

  // final String path;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
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
        SizedBox(
          height: 20,
        ),
        BtnPrimary(
          tvButton: "Cek Pesanan",
          // onPressed: () {
          //   Navigator.pushNamedAndRemoveUntil(
          //       context, path, (route) => false);
          // },
          onPressed: onPressed,
          radius: 8,
        ),
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
