import 'package:flutter/material.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/profile_form_title.dart';
import 'package:foto_in/utils/labeled_text_field.dart';

class DescriptionForm extends StatefulWidget {
  const DescriptionForm({
    super.key,
  });

  @override
  State<DescriptionForm> createState() => _DescriptionFormState();
}

class _DescriptionFormState extends State<DescriptionForm> {
  TextEditingController judulController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProfileFormTitle(
          title: "Tambah Portofolio",
          subtitle: "Lengkapi form berikut dengan benar.",
        ),
        SizedBox(height: 20),
        LabeledTextField(
          label: "Judul",
          controller: judulController,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value!.isEmpty) {
              return "Judul portofolio tidak boleh kosong";
            }
            return null;
          },
        ),
        SizedBox(height: 20),
        LabeledTextField(
          label: "Deskripsi",
          controller: deskripsiController,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value!.isEmpty) {
              return "Deskripsi portofolio tidak boleh kosong";
            }
            return null;
          },
          maxLines: 8,
        ),
      ],
    );
  }
}
