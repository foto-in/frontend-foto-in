import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/utils/button.dart';

class SuccessDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final Function() onPressed;

  const SuccessDialog({
    super.key,
    required this.title,
    required this.message,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(16),
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xffffffff),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/payment-success.png",
              width: 180,
              height: 180,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style:
                  FotoInSubHeadingTypography.large(color: AppColor.textPrimary),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: FotoInParagraph.small(color: AppColor.textPrimary),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            BtnPrimary(
              tvButton: buttonText,
              onPressed: onPressed,
              radius: 8,
            ),
          ],
        ),
      ),
    );
  }
}
