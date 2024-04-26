import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/profile_form_title.dart';
import 'package:foto_in/utils/text_field.dart';
import 'package:iconsax/iconsax.dart';

class InformasiTambahan extends StatefulWidget {
  const InformasiTambahan({
    super.key,
  });

  @override
  State<InformasiTambahan> createState() => _InformasiTambahanState();
}

class _InformasiTambahanState extends State<InformasiTambahan> {
  final TextEditingController mulaiDari = TextEditingController();
  final TextEditingController hingga = TextEditingController();

  List<TextEditingController> _gearController = [TextEditingController()];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProfileFormTitle(
          title: "Informasi Tambahan",
          subtitle:
              "Untuk mengetahui detail harga layanan dan spesifikasi perangkat Anda, silahkan mengisi form berikut dengan benar.",
        ),
        SizedBox(height: 20),
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
                Container(
                  width: 300,
                  child: TfAuth(
                    controller: mulaiDari,
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
                      if (int.parse(value) > int.parse(hingga.text)) {
                        return "Rentang bawah tidak boleh lebih dari rentang atas";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  width: 20,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColor.textPrimary,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  width: 300,
                  child: TfAuth(
                    controller: hingga,
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
                      if (int.parse(value) < int.parse(mulaiDari.text)) {
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
        SizedBox(
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
              children: _gearController.map((e) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      Container(
                        width: 400,
                        child: TfAuth(
                          controller: e,
                          hintText:
                              "contoh: Canon EOS 5D Mark IV, Fujifilm XT10",
                          hintStyle: FotoInLabelTypography.small(
                            color: AppColor.textPrimary,
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Tipe kamera tidak boleh kosong";
                            }

                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 8),
                      // if the index is the last index, add button to add more textfield
                      // else add remove button to remove the textfield
                      if (_gearController.indexOf(e) ==
                          _gearController.length - 1)
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _gearController.add(TextEditingController());
                            });
                          },
                          icon: Icon(
                            Iconsax.add,
                            color: AppColor.textPrimary,
                          ),
                        ),
                      if (_gearController.indexOf(e) !=
                          _gearController.length - 1)
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _gearController.remove(e);
                            });
                          },
                          icon: Icon(
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
