import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/auth/register/presentation/widgets/register_widgets.dart';
import 'package:foto_in/feature/navigation/presentation/view/navigation.dart';

class ProfileWeb extends StatefulWidget {
  const ProfileWeb({super.key});

  @override
  State<ProfileWeb> createState() => _ProfileWebState();
}

class _ProfileWebState extends State<ProfileWeb> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NavigationCustom(),
        Form(
          key: _formKey,
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              horizontal: 80,
              vertical: 64,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Profile',
                  textAlign: TextAlign.start,
                  style: FotoInHeadingTypography.medium(
                    color: AppColor.textPrimary,
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          textField(
                            controller: fullNameController,
                            label: 'Full Name',
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your full name';
                              }

                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column textField({
    required TextEditingController controller,
    required String label,
    required TextInputType? keyboardType,
    required String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Full Name
        Text(
          label,
          style: FotoInHeadingTypography.xxSmall(
            color: AppColor.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        TfAuth(
          controller: fullNameController,
          hintText: label,
          hintStyle: FotoInLabelTypography.small(
            color: AppColor.textPrimary,
          ),
          keyboardType: keyboardType ?? TextInputType.text,
          validator: validator,
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
