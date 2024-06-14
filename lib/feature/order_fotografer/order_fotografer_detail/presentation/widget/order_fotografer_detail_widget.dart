import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/order_fotografer/order_fotografer_detail/presentation/widget/perbarui_status_dialog.dart';
import 'package:foto_in/feature/order_fotografer/order_fotografer_detail/presentation/widget/tolak_pesanan_dialog.dart';
import 'package:foto_in/feature/order_fotografer/order_fotografer_detail/upload_hasil/presentation/view/upload_hasil_view.dart';
import 'package:foto_in/feature/order_fotografer/order_fotografer_detail/upload_preview/presentation/view/upload_preview_view.dart';
import 'package:foto_in/feature/order_fotografer/order_fotografer_detail/upload_preview/presentation/widget/success_dialog.dart';
import 'package:foto_in/feature/order_user/order_user_detail/presentation/widget/detail_bayar_item.dart';
import 'package:foto_in/feature/order_user/order_user_detail/presentation/widget/order_detail.dart';
import 'package:foto_in/feature/order_user/presentation/widgets/mobile/order_info.dart';
import 'package:foto_in/utils/button.dart';

class OrderFotograferDetailWidget extends StatelessWidget {
  const OrderFotograferDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Pesanan"),
        // bottom line
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            color: AppColor.border,
            height: 1,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        children: [
          OrderDetail(),
          SizedBox(height: 20),
          OrderInfo(
            title: "Status Pesanan",
            value: "Menunggu Konfirmasi",
          ),
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ringkasan Pembayaran",
                style: FotoInSubHeadingTypography.xSmall(
                  color: AppColor.textSecondary,
                ),
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.backgroundPrimary,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Color(0xFFF5F5F5),
                  ),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    DetailBayarItem(
                      title: "DP",
                      value: "500.000",
                      style: FotoInSubHeadingTypography.medium(
                        color: AppColor.textSecondary,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DetailBayarItem(
                      title: "Pelunasan",
                      value: "2.000.000",
                      style: FotoInSubHeadingTypography.medium(
                        color: AppColor.textSecondary,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // devider
                    Container(
                      height: 1,
                      color: AppColor.border,
                    ),
                    SizedBox(
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
          SizedBox(
            height: 20,
          ),
          FotoInButton(
            text: "Terima",
            onPressed: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return SuccessDialog(
                    title: "Pesanan Diterima",
                    message: "Pesanan telah diterima, Terima kasih.",
                    buttonText: "Kembali",
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  );
                },
              );
            },
            backgroundColor: AppColor.green600,
            margin: EdgeInsets.only(bottom: 16),
          ),
          FotoInButton(
            text: "Tolak",
            onPressed: () {
              // show dialog
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return TolakStatusDialog();
                },
              );
            },
            backgroundColor: AppColor.red600,
            margin: EdgeInsets.only(bottom: 16),
          ),
          FotoInButton(
            text: "Perbarui Status",
            onPressed: () {
              // show dialog
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return PerbaruiStatusDialog();
                },
              );
            },
            margin: EdgeInsets.only(bottom: 16),
          ),
          FotoInButton(
            text: "Upload Preview",
            onPressed: () {
              Navigator.pushNamed(context, UploadPreviewView.routeName);
            },
            margin: EdgeInsets.only(bottom: 16),
          ),
          FotoInButton(
            text: "Upload Hasil",
            onPressed: () {
              Navigator.pushNamed(context, UploadHasilView.routeName);
            },
            margin: EdgeInsets.only(bottom: 16),
          ),
        ],
      ),
    );
  }
}
