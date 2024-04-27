import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/navigation/presentation/view/navigation.dart';
import 'package:foto_in/feature/service_order/presentation/widgets/tolak_order_form_page.dart';
import 'package:foto_in/utils/button.dart';
import 'package:foto_in/utils/enums/action_button_variant_enum.dart';

class ServiceOrderDetail extends StatelessWidget {
  const ServiceOrderDetail({super.key});

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
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              "Rp 2.000.000",
                              style: FotoInSubHeadingTypography.xxLarge(
                                  color: AppColor.textPrimary),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: ActionButton(
                          variant: ActionButtonVariant.accept,
                          text: 'Terima',
                          onPressed: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: ActionButton(
                          variant: ActionButtonVariant.reject,
                          text: 'Tolak',
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  backgroundColor: Colors.transparent,
                                  surfaceTintColor: Colors.transparent,
                                  child: Container(
                                    clipBehavior: Clip.antiAlias,
                                    child: Material(
                                      child: Padding(
                                        padding: const EdgeInsets.all(40),
                                        child: TolakOrderFormPage(),
                                      ),
                                      color: Colors.white,
                                    ),
                                    constraints: BoxConstraints(
                                        maxWidth: 490, maxHeight: 640),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
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
