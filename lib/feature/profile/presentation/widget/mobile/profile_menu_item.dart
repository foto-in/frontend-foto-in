import 'package:flutter/cupertino.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.trailingIcon,
    this.onTap,
  });

  final IconData leadingIcon;
  final String title;
  final IconData trailingIcon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xffE9E9E9),
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  leadingIcon,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  title,
                  style: FotoInHeadingTypography.xxSmall(),
                ),
              ],
            ),
            Icon(
              trailingIcon,
              size: 16,
              color: AppColor.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}
