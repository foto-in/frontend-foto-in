import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/profile/register_photographer/add_portofolio/presentation/provider/add_portofolio_provider.dart';
import 'package:foto_in/feature/profile/register_photographer/add_portofolio/presentation/widgets/add_photo.dart';
import 'package:foto_in/feature/profile/register_photographer/add_portofolio/presentation/widgets/added_photo.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/profile_form_title.dart';
import 'package:foto_in/utils/button.dart';
import 'package:foto_in/utils/text_field.dart';
import 'package:provider/provider.dart';

class AddPortofolioWidget extends StatelessWidget {
  // text field controller
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final int maxImage = 10;

  // form key
  final _formKey = GlobalKey<FormState>();

  AddPortofolioWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AddPortofolioProvider addPortofolioProvider =
        Provider.of<AddPortofolioProvider>(context);
    return Scaffold(
      backgroundColor: AppColor.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundPrimary,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: ProfileFormTitle(
              title: "Tambah Portofolio",
              subtitle: "Lengkapi form berikut dengan benar.",
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TfAuth(
                        maxLines: 1,
                        controller: titleController,
                        hintText: "Judul",
                        hintStyle: FotoInLabelTypography.small(
                          color: AppColor.textSecondary,
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Judul tidak boleh kosong";
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TfAuth(
                        maxLines: 5,
                        controller: descriptionController,
                        hintText: "Deskripsi",
                        hintStyle: FotoInLabelTypography.small(
                          color: AppColor.textSecondary,
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Deskripsi tidak boleh kosong";
                          }

                          return null;
                        },
                      ),

                      // Gambar
                      const SizedBox(height: 16),
                      Text(
                        "Gambar",
                        style: FotoInSubHeadingTypography.medium(),
                      ),
                      const SizedBox(height: 16),

                      // List gambar
                      AutoHeightGridView(
                        padding: const EdgeInsets.all(0),
                        itemCount: addPortofolioProvider.images.length + 1,
                        crossAxisCount: 3,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 15.5,
                        shrinkWrap: true,
                        builder: (context, index) {
                          if (index == addPortofolioProvider.images.length) {
                            return const AddPhoto();
                          }
                          return AddedPhoto(index: index);
                          // return index == maxImage - 1
                          //     ? const AddPhoto()
                          //     : const AddedPhoto();
                        },
                      ),

                      // Button
                      FotoInButton(
                        text: "Tambahkan",
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(vertical: 40),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
