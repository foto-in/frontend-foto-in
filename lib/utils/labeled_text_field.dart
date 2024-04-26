import 'package:flutter/cupertino.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/auth/register/presentation/widgets/register_widgets.dart';

class LabeledTextField extends StatelessWidget {
  const LabeledTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.keyboardType,
    required this.validator,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final String label;
  final TextInputType? keyboardType;
  final String? Function(String? p1)? validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Label
        Text(
          label,
          style: FotoInHeadingTypography.xxSmall(
            color: AppColor.textPrimary,
          ),
        ),

        const SizedBox(height: 16),

        // Input
        TfAuth(
          controller: controller,
          hintText: label,
          hintStyle: FotoInLabelTypography.small(
            color: AppColor.textPrimary,
          ),
          keyboardType: keyboardType ?? TextInputType.text,
          validator: validator,
          obscureText: obscureText,
        ),
      ],
    );
  }
}
