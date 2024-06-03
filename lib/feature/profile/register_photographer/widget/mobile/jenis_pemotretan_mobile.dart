import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/profile_form_title.dart';

class JenisPemotretanMobile extends StatefulWidget {
  const JenisPemotretanMobile({
    super.key,
  });

  @override
  State<JenisPemotretanMobile> createState() => _JenisPemotretanMobileState();
}

class _JenisPemotretanMobileState extends State<JenisPemotretanMobile> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ProfileFormTitle(
          title: "Jenis Pemotretan",
          subtitle:
              "Anda dapat memilih minimal satu dari beberapa jenis pemotretan yang anda sukai.",
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: ListView.builder(
              itemCount: _kategori.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: categoryCard(
                    category: _kategori[index],
                    isSelected: selectedCategory.contains(_kategori[index]),
                  ),
                );
              }),
        ),
      ],
    );
  }

  List<String> selectedCategory = [];

  Widget categoryCard({required String category, bool isSelected = false}) {
    // checkbox with text
    return GestureDetector(
      onTap: () {
        // add or remove category
        setState(() {
          selectedCategory.contains(category)
              ? selectedCategory.remove(category)
              : selectedCategory.add(category);
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? AppColor.primary : AppColor.backgroundSecondary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              category,
              style: FotoInLabelTypography.medium(
                color: isSelected ? Colors.white : AppColor.textPrimary,
              ),
            ),
            Checkbox(
              value: isSelected,
              onChanged: (value) {
                // add or remove category
                setState(() {
                  selectedCategory.contains(category)
                      ? selectedCategory.remove(category)
                      : selectedCategory.add(category);
                });
              },
              activeColor: Colors.white,
              checkColor: AppColor.primary,
            ),
          ],
        ),
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
