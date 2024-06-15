import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/feature/order_fotografer/order_fotografer_detail/upload_preview/presentation/widget/success_dialog.dart';
import 'package:foto_in/feature/profile/register_photographer/add_portofolio/presentation/widgets/add_photo.dart';
import 'package:foto_in/feature/profile/register_photographer/add_portofolio/presentation/widgets/added_photo.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/profile_form_title.dart';
import 'package:foto_in/utils/button.dart';

class UploadPreviewWidget extends StatelessWidget {
  const UploadPreviewWidget({super.key});

  final int maxImage = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Preview'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Container(
            color: AppColor.border,
            height: 1,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const ProfileFormTitle(
            title: "Upload Preview",
            subtitle: "Berikan preview foto kepada klien Anda.",
          ),
          const SizedBox(height: 20),
          // List gambar
          AutoHeightGridView(
            padding: const EdgeInsets.all(0),
            itemCount: maxImage,
            crossAxisCount: 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 15.5,
            shrinkWrap: true,
            builder: (context, index) {
              return SizedBox();
              // return index == maxImage - 1 ? const AddPhoto() : const AddedPhoto();
            },
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 16 + MediaQuery.of(context).padding.bottom,
                top: 16),
            child: FotoInButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => SuccessDialog(
                    title: "Upload Preview Berhasil",
                    message:
                        "Foto-foto preview Anda telah berhasil diunggah dan dapat dilihat oleh klien.",
                    buttonText: "Kembali",
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  ),
                );
              },
              text: "Upload",
            ),
          ),
        ],
      ),
    );
  }
}
