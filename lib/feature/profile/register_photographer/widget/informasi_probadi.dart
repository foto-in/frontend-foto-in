import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/profile_form_title.dart';
import 'package:foto_in/utils/labeled_text_field.dart';

class InformasiProbadi extends StatefulWidget {
  const InformasiProbadi({
    super.key,
  });

  @override
  State<InformasiProbadi> createState() => _InformasiProbadiState();
}

class _InformasiProbadiState extends State<InformasiProbadi> {
  final TextEditingController namaLengkap = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController noTelp = TextEditingController();
  final TextEditingController noTelegram = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProfileFormTitle(
          title: "Informasi Pribadi",
          subtitle: "Lengkapi form berikut dengan benar untuk melanjutkan.",
        ),
        SizedBox(height: 20),
        GridView(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: 100,
          ),
          children: [
            LabeledTextField(
              label: "Nama Lengkap",
              controller: namaLengkap,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Nama lengkap tidak boleh kosong";
                }
                return null;
              },
            ),
            LabeledTextField(
              label: "Username",
              controller: username,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Username tidak boleh kosong";
                }
                return null;
              },
            ),
            LabeledTextField(
              label: "Email",
              controller: email,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Email tidak boleh kosong";
                }
                return null;
              },
            ),
            LabeledTextField(
              label: "Nomor Telp",
              controller: noTelp,
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value!.isEmpty) {
                  return "No. Telp tidak boleh kosong";
                }
                return null;
              },
            ),
            LabeledTextField(
              label: "Nomor Telegram",
              controller: noTelegram,
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value!.isEmpty) {
                  return "No. Telegram tidak boleh kosong";
                }
                return null;
              },
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
