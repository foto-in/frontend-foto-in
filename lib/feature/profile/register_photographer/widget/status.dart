import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/profile/register_photographer/provider/register_photographer_provider.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/profile_form_title.dart';
import 'package:provider/provider.dart';

class Status extends StatefulWidget {
  const Status({
    super.key,
  });

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
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
                context,
                title: "Individu",
                icon: Icons.person,
              ),
              const SizedBox(width: 16),
              radio(
                context,
                title: "Tim",
                icon: Icons.people,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget radio(
    context, {
    required String title,
    required IconData icon,
  }) {
    String? status = Provider.of<RegisterPhotographerProvider>(context).type;
    bool isSelected = status == title;
    return Expanded(child:
        Consumer<RegisterPhotographerProvider>(builder: (context, state, _) {
      return GestureDetector(
        onTap: () {
          try {
            setState(() {
              status = title;
            });
            state.type = status;
          } catch (e) {}
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
      );
    }));
  }
}
