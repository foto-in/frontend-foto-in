import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/navigation/presentation/view/navigation.dart';
import 'package:foto_in/utils/button.dart';

class OrderDetailUser extends StatelessWidget {
  const OrderDetailUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const NavigationCustom(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 64),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
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
                          'Pesanan/Detail',
                          style: FotoInSubHeadingTypography.medium(
                            color: AppColor.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  Text(
                    'Cahaya Abadi Fotografi',
                    style: FotoInHeadingTypography.large(
                      color: AppColor.textPrimary,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Dibuat pada tanggal 24 Maret 2024",
                    style: FotoInSubHeadingTypography.medium(
                        color: AppColor.textSecondary),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DetailItem(
                        title: 'Jenis Acara',
                        content: 'Pernikahan',
                      ),
                      DetailItem(
                          title: "Lokasi",
                          content:
                              "Ballroom Hotel Majapahit, Jl. Sudirman No.456, Bandung"),
                      DetailItem(title: "Sesi Foto", content: "31 Maret 2024"),
                      DetailItem(title: "Durasi", content: "8 Jam"),
                      DetailItem(title: "Waktu Mulai", content: "10:00 WIB"),
                      DetailItem(
                          title: "Catatan",
                          content:
                              "Kami ingin fokus pada momen-momen candid selama upacara dan resepsi."),
                    ],
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const DetailItem(
                          title: "Status Pesanan",
                          content: "Menunggu Konfirmasi"),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Jumlah yang harus dibayar",
                              overflow: TextOverflow.clip,
                              style: FotoInSubHeadingTypography.medium(
                                  color: AppColor.textSecondary),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              "Rp 2.000.000",
                              style: FotoInSubHeadingTypography.xxLarge(
                                  color: AppColor.textPrimary),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "*Anda dapat melakukan pembayaran DP setelah fotografer mengkonfirmasi pesanan Anda dan Anda dapat melakukan pelunasan setelah sesi foto selesai.",
                                    style: FotoInSubHeadingTypography.small(
                                        color: AppColor.textSecondary),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    "*Harap Lakukan pembayaran dalam waktu 24 jam setelah fotografer mengkonfirmasi pesanan Anda, jika tidak, pesanan akan dibatalkan secara otomatis.",
                                    style: FotoInSubHeadingTypography.small(
                                        color: AppColor.textSecondary),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 48,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ringkasan pembayaran",
                              style: FotoInSubHeadingTypography.medium(
                                  color: AppColor.textSecondary),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              "DP (Uang muka)",
                              style: FotoInSubHeadingTypography.medium(
                                  color: AppColor.textSecondary),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              "Rp 1.000.000",
                              style: FotoInSubHeadingTypography.medium(
                                  color: AppColor.textPrimary),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              "Pelunasan",
                              style: FotoInSubHeadingTypography.medium(
                                  color: AppColor.textSecondary),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              "Rp 1.000.000",
                              style: FotoInSubHeadingTypography.medium(
                                  color: AppColor.textPrimary),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              "Total",
                              style: FotoInSubHeadingTypography.medium(
                                  color: AppColor.textSecondary),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 156,
                        child: BtnPrimary(
                          tvButton: "Bayar",
                          onPressed: () {
                            Navigator.pushNamed(context, '/payment');
                          },
                          radius: 8,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailItem extends StatelessWidget {
  const DetailItem({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            overflow: TextOverflow.clip,
            style: FotoInSubHeadingTypography.medium(
                color: AppColor.textSecondary),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            content,
            style:
                FotoInSubHeadingTypography.xxLarge(color: AppColor.textPrimary),
          ),
        ],
      ),
    );
  }
}
