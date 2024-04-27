import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/utils/button.dart';
import 'package:foto_in/utils/labeled_text_field.dart';

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({
    super.key,
  });

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 425,
        ),
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xffF5F5F5),
            width: 1.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Foto Profil
            Text(
              "Foto Profil",
              style: FotoInHeadingTypography.xxSmall(
                color: AppColor.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                color: AppColor.textSecondary,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(
                Icons.person,
                color: AppColor.textPrimary,
                size: 50,
              ),
            ),

            const SizedBox(height: 32),

            // Full Name
            LabeledTextField(
              controller: fullNameController,
              label: 'Full Name',
              keyboardType: TextInputType.text,
              validator: (value) {
                // not empty
                if (value == null || value.isEmpty) {
                  return 'Please enter your full name';
                }

                return null;
              },
            ),

            const SizedBox(height: 32),

            // Username
            LabeledTextField(
              controller: usernameController,
              label: 'Username',
              keyboardType: TextInputType.text,
              validator: (value) {
                // not empty
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }

                // cannot contain space
                if (value.contains(' ')) {
                  return 'Username cannot contain space';
                }

                return null;
              },
            ),

            const SizedBox(height: 32),

            // Email
            LabeledTextField(
              controller: emailController,
              label: 'Email',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                // not empty
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }

                // valid email
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                    .hasMatch(value)) {
                  return 'Please enter a valid email';
                }

                return null;
              },
            ),

            const SizedBox(height: 32),

            // Button
            FotoInButton(
              width: double.infinity,
              text: 'Save',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // save data
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
