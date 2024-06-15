import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/profile/register_photographer/provider/register_photographer_provider.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/profile_form_title.dart';
import 'package:foto_in/utils/text_field.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class InformasiTambahanMobile extends StatefulWidget {
  const InformasiTambahanMobile({
    super.key,
  });

  @override
  State<InformasiTambahanMobile> createState() =>
      _InformasiTambahanMobileState();
}

class _InformasiTambahanMobileState extends State<InformasiTambahanMobile> {
  @override
  Widget build(BuildContext context) {
    List<TextEditingController> gearController =
        Provider.of<RegisterPhotographerProvider>(context).camera;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProfileFormTitle(
          title: "Informasi Tambahan",
          subtitle:
              "Untuk mengetahui detail harga layanan dan spesifikasi perangkat Anda, silahkan mengisi form berikut dengan benar.",
        ),
        const SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Label
            Text(
              "Rentang Harga (IDR)",
              style: FotoInHeadingTypography.xxSmall(
                color: AppColor.textPrimary,
              ),
            ),

            const SizedBox(height: 16),

            // Input
            Row(
              children: [
                Expanded(
                  child: TfAuth(
                    controller:
                        Provider.of<RegisterPhotographerProvider>(context)
                            .startPrice,
                    hintText: "Mulai dari",
                    hintStyle: FotoInLabelTypography.small(
                      color: AppColor.textPrimary,
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Rentang harga tidak boleh kosong";
                      }

                      if (int.parse(value) < 0) {
                        return "Rentang harga tidak boleh kurang dari 0";
                      }

                      // rentang bawah tidak boleh lebih dari rentang atas
                      if (int.parse(value) >
                          int.parse(
                              Provider.of<RegisterPhotographerProvider>(context)
                                  .endPrice
                                  .text)) {
                        return "Rentang bawah tidak boleh lebih dari rentang atas";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 20,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColor.textPrimary,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TfAuth(
                    controller:
                        Provider.of<RegisterPhotographerProvider>(context)
                            .endPrice,
                    hintText: "Hingga",
                    hintStyle: FotoInLabelTypography.small(
                      color: AppColor.textPrimary,
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Rentang harga tidak boleh kosong";
                      }

                      if (int.parse(value) < 0) {
                        return "Rentang harga tidak boleh kurang dari 0";
                      }

                      // rentang atas tidak boleh lebih dari rentang bawah
                      if (int.parse(value) <
                          int.parse(
                              Provider.of<RegisterPhotographerProvider>(context)
                                  .endPrice
                                  .text)) {
                        return "Rentang atas tidak boleh lebih dari rentang bawah";
                      }

                      return null;
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Label
            Text(
              "Tipe Kamera yang Anda gunakan saat ini",
              style: FotoInHeadingTypography.xxSmall(
                color: AppColor.textPrimary,
              ),
            ),

            const SizedBox(height: 16),

            Column(
              // create a list of textfield with bbutton to add more textfield if the index is the last index
              children: gearController.map((e) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: TfAuth(
                          controller: e,
                          hintText:
                              "contoh: Canon EOS 5D Mark IV, Fujifilm XT10",
                          hintStyle: FotoInLabelTypography.small(
                            color: AppColor.textPrimary,
                          ),
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Tipe kamera tidak boleh kosong";
                            }

                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      // if the index is the last index, add button to add more textfield
                      // else add remove button to remove the textfield
                      if (gearController.indexOf(e) ==
                          gearController.length - 1)
                        IconButton(
                          onPressed: () {
                            setState(() {
                              gearController.add(TextEditingController());
                            });
                          },
                          icon: const Icon(
                            Iconsax.add,
                            color: AppColor.textPrimary,
                          ),
                        ),
                      if (gearController.indexOf(e) !=
                          gearController.length - 1)
                        IconButton(
                          onPressed: () {
                            setState(() {
                              gearController.remove(e);
                            });
                          },
                          icon: const Icon(
                            Iconsax.trash,
                            color: AppColor.textPrimary,
                          ),
                        ),
                    ],
                  ),
                );
              }).toList(),

              //     children: [
              //       Container(
              //         width: 300,
              //         child: TfAuth(
              //           controller: _gearController[0],
              //           hintText: "contoh: Canon EOS 5D Mark IV, Fujifilm XT10",
              //           hintStyle: FotoInLabelTypography.small(
              //             color: AppColor.textPrimary,
              //           ),
              //           keyboardType: TextInputType.number,
              //           validator: (value) {
              //             if (value!.isEmpty) {
              //               return "Tipe kamera tidak boleh kosong";
              //             }

              //             return null;
              //           },
              //         ),
              //       ),
              //       SizedBox(height: 16),
              //       IconButton(
              //         onPressed: () {
              //           setState(() {
              //             _gearController.add(TextEditingController());
              //           });
              //         },
              //         icon: Icon(
              //           Iconsax.add,
              //           color: AppColor.textPrimary,
              //         ),
              //       ),
              //     ],
              //   ),
              // ],
            ),
          ],
        ),
      ],
    );
  }
}

final List<String> _kategori = [
  "Pernikahan",
  "Keluaraga",
  "Wisuda",
  "Konser",
  "Acara sosial",
  "Produk",
  "Travel",
  "Lainnya",
];
