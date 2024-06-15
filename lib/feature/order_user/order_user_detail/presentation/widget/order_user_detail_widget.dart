import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/order_user/order_user_detail/presentation/widget/detail_bayar_item.dart';
import 'package:foto_in/feature/order_user/order_user_detail/presentation/widget/order_detail.dart';
import 'package:foto_in/feature/order_user/order_user_detail/preview/presentation/view/preview_view.dart';
import 'package:foto_in/feature/order_user/presentation/widgets/mobile/order_info.dart';
import 'package:foto_in/feature/payment/presentation/view/payment_view.dart';
import 'package:foto_in/utils/button.dart';

class OrderUserDetailWidget extends StatelessWidget {
  const OrderUserDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Pesanan"),
        // bottom line
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: AppColor.border,
            height: 1,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        children: [
          const OrderDetail(),
          const SizedBox(height: 20),
          const OrderInfo(
            title: "Status Pesanan",
            value: "Menunggu Konfirmasi",
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ringkasan Pembayaran",
                style: FotoInSubHeadingTypography.xSmall(
                  color: AppColor.textSecondary,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.backgroundPrimary,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFFF5F5F5),
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    DetailBayarItem(
                      title: "DP",
                      value: "500.000",
                      style: FotoInSubHeadingTypography.medium(
                        color: AppColor.textSecondary,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DetailBayarItem(
                      title: "Pelunasan",
                      value: "2.000.000",
                      style: FotoInSubHeadingTypography.medium(
                        color: AppColor.textSecondary,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // devider
                    Container(
                      height: 1,
                      color: AppColor.border,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DetailBayarItem(
                      title: "Total",
                      value: "2.500.000",
                      style: FotoInSubHeadingTypography.medium(),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Jumlah yang harus dibayar",
                style: FotoInSubHeadingTypography.xSmall(
                  color: AppColor.textSecondary,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.backgroundPrimary,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColor.primary,
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    DetailBayarItem(
                      title: "DP",
                      value: "500.000",
                      style: FotoInSubHeadingTypography.medium(
                        color: AppColor.textSecondary,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // devider
                    Container(
                      height: 1,
                      color: AppColor.border,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DetailBayarItem(
                      title: "Total",
                      value: "500.000",
                      style: FotoInSubHeadingTypography.medium(),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Column(
            children: [
              Text(
                "*Anda dapat melakukan pembayaran DP setelah fotografer mengkonfirmasi pesanan Anda dan Anda dapat melakukan pelunasan setelah sesi foto selesai.",
                style: FotoInParagraph.xSmall(
                  color: AppColor.textSecondary,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "*Harap Lakukan pembayaran dalam waktu 24 jam setelah fotografer mengkonfirmasi pesanan Anda, jika tidak, pesanan akan dibatalkan secara otomatis.",
                style: FotoInParagraph.xSmall(
                  color: AppColor.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          FotoInButton(
            text: "Bayar",
            onPressed: () {
              Navigator.pushNamed(context, PaymentView.routeName);
            },
          ),
          const SizedBox(
            height: 16,
          ),
          FotoInButton(
            text: "Batalkan",
            onPressed: () {},
            backgroundColor: AppColor.backgroundPrimary,
            textColor: AppColor.red600,
            border: BorderSide(
              color: AppColor.red600,
              width: 1,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          FotoInButton(
            text: "Lihat Preview",
            onPressed: () {
              Navigator.pushNamed(context, PreviewView.routeName);
            },
          ),
        ],
      ),
    );
  }
}
