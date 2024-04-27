import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/profile_form_title.dart';

class Status extends StatefulWidget {
  const Status({
    super.key,
  });

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  String? status;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProfileFormTitle(
          title: "Status",
          subtitle: "Pilih salah satu dari opsi berikut.",
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 210,
          child: Row(
            children: [
              radio(
                title: "Individu",
                icon: Icons.person,
              ),
              const SizedBox(width: 16),
              radio(
                title: "Tim",
                icon: Icons.people,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget radio({
    required String title,
    required IconData icon,
  }) {
    bool isSelected = status == title;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            status = title;
          });
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? AppColor.primary : AppColor.backgroundSecondary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 32,
                color: isSelected ? Colors.white : AppColor.textSecondary,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: FotoInSubHeadingTypography.small(
                  color: isSelected ? Colors.white : AppColor.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
