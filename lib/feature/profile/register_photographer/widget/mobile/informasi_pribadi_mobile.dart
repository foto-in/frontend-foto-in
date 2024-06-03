import 'package:flutter/material.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/profile_form_title.dart';
import 'package:foto_in/utils/labeled_text_field.dart';

class InformasiPribadiMobile extends StatefulWidget {
  const InformasiPribadiMobile({
    super.key,
  });

  @override
  State<InformasiPribadiMobile> createState() => _InformasiPribadiMobileState();
}

class _InformasiPribadiMobileState extends State<InformasiPribadiMobile> {
  final TextEditingController namaLengkap = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController noTelp = TextEditingController();
  final TextEditingController noTelegram = TextEditingController();

  ScrollController _controller = ScrollController();
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // After the widget has been built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.addListener(() async {
        if (_focusNode.hasFocus) {
          // If you remove the delay sometimes the scroll doesnt animate completely at the end
          await Future.delayed(const Duration(milliseconds: 150));
          _controller.animateTo(
            _controller.position.maxScrollExtent,
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeOut,
          );
        }
      });
      // This is if you want to automatically toggle the keyboard when visitting the screen
      _focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          const ProfileFormTitle(
            title: "Informasi Pribadi",
            subtitle: "Lengkapi form berikut dengan benar untuk melanjutkan.",
          ),
          const SizedBox(height: 20),
          Column(
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
              const SizedBox(height: 16),
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
              const SizedBox(height: 16),
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
              const SizedBox(height: 16),
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
              const SizedBox(height: 16),
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
      ),
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
