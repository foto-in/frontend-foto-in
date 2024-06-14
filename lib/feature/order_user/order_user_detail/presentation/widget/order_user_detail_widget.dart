import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/order_user/presentation/widgets/mobile/order_info.dart';
import 'package:foto_in/utils/button.dart';

class OrderUserDetailWidget extends StatelessWidget {
  const OrderUserDetailWidget({super.key});

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
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20,
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
                SizedBox(height: 8),
                Text(
                  "Dibuat pada tanggal 24 Maret 2024",
                  style: FotoInSubHeadingTypography.xSmall(
                    color: AppColor.textSecondary,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                OrderInfo(
                  title: "Jenis Acara",
                  value: "Pernikahan",
                ),
                SizedBox(
                  height: 16,
                ),
                OrderInfo(
                  title: "Lokasi",
                  value:
                      "Ballroom Hotel Majapahit, Jl. Sudirman No.456, Bandung",
                ),
                SizedBox(
                  height: 16,
                ),
                OrderInfo(
                  title: "Sesi Foto",
                  value: "31 Maret 2024",
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: OrderInfo(
                        title: "Durasi",
                        value: "8 Jam",
                      ),
                    ),
                    Expanded(
                      child: OrderInfo(
                        title: "Waktu Mulai",
                        value: "10:00 AM",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                OrderInfo(
                  title: "Catatan",
                  value:
                      "Kami ingin fokus pada momen-momen candid selama upacara dan resepsi.",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: OrderInfo(
              title: "Status Pesanan",
              value: "Menunggu Konfirmasi",
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
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
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jumlah yang harus dibayar",
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
                      color: AppColor.primary,
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
                        value: "500.000",
                        style: FotoInSubHeadingTypography.medium(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Text(
                  "*Anda dapat melakukan pembayaran DP setelah fotografer mengkonfirmasi pesanan Anda dan Anda dapat melakukan pelunasan setelah sesi foto selesai.",
                  style: FotoInParagraph.xSmall(
                    color: AppColor.textSecondary,
                  ),
                ),
                SizedBox(
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
          ),
          SizedBox(
            height: 20,
          ),
          FotoInButton(
            text: "Bayar",
            onPressed: () {},
            margin: EdgeInsets.symmetric(horizontal: 16),
          ),
          SizedBox(
            height: 16,
          ),
          FotoInButton(
            text: "Batalkan",
            onPressed: () {},
            margin: EdgeInsets.symmetric(horizontal: 16),
            backgroundColor: AppColor.backgroundPrimary,
            textColor: AppColor.red600,
            border: BorderSide(
              color: AppColor.red600,
              width: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class DetailBayarItem extends StatelessWidget {
  final String title;
  final String value;
  final TextStyle style;

  DetailBayarItem({
    super.key,
    required this.title,
    required this.value,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: style,
        ),
        Text(
          value,
          style: style,
        ),
      ],
    );
  }
}
