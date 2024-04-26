import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/navigation/presentation/view/navigation.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/profile_form_title.dart';

class RegisterPhotographerWidget extends StatelessWidget {
  const RegisterPhotographerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NavigationCustom(),
          Container(
            constraints: BoxConstraints(
              maxWidth: 1500,
            ),
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              horizontal: 80,
              vertical: 64,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.arrow_back,
                      size: 24,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Profil/Daftar menjadi fotografer',
                      textAlign: TextAlign.start,
                      style: FotoInSubHeadingTypography.medium(
                        color: AppColor.textSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Status(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Status extends StatelessWidget {
  const Status({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProfileFormTitle(
          title: "Status",
          subtitle: "Pilih salah satu dari opsi berikut.",
        ),
        SizedBox(height: 20),
        Container(
          height: 210,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColor.textSecondary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
