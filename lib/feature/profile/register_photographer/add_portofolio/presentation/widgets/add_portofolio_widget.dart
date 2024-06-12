import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/profile_form_title.dart';
import 'package:foto_in/utils/button.dart';
import 'package:foto_in/utils/text_field.dart';
import 'package:iconsax/iconsax.dart';

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
    return Scaffold(
      backgroundColor: AppColor.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundPrimary,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
                        itemCount: maxImage,
                        crossAxisCount: 3,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 15.5,
                        shrinkWrap: true,
                        builder: (context, index) {
                          return index == maxImage - 1
                              ? AddPhoto()
                              : AddedPhoto();
                        },
                      ),

                      // Button
                      FotoInButton(
                        text: "Tambahkan",
                        onPressed: () {},
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

class AddedPhoto extends StatelessWidget {
  const AddedPhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 143,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColor.backgroundSecondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Image(
            image: NetworkImage(
              "https://images.unsplash.com/photo-1718049720096-7f1af82d69af",
            ),
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(6),
            child: Icon(
              Iconsax.trash,
              color: AppColor.textPrimary,
              size: 12,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ],
      ),
    );
  }
}

class AddPhoto extends StatelessWidget {
  const AddPhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 143,
      decoration: BoxDecoration(
        color: AppColor.backgroundSecondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Iconsax.add,
            color: AppColor.textSecondary,
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "Tambah\nGambar",
            style: FotoInLabelTypography.small(
              color: AppColor.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
