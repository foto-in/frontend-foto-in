import 'package:flutter/material.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/profile_form_title.dart';
import 'package:foto_in/feature/profile/widget/potofolio_page.dart';

class PortofolioPageForm extends StatelessWidget {
  const PortofolioPageForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProfileFormTitle(
          title: "Jenis Pemotretan",
          subtitle:
              "Anda dapat memilih minimal satu dari beberapa jenis pemotretan yang anda sukai.",
        ),
        SizedBox(height: 20),
        PortofolioPage(),
      ],
    );
  }
}
