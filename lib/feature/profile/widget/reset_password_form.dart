import 'package:flutter/material.dart';
import 'package:foto_in/utils/button.dart';
import 'package:foto_in/utils/labeled_text_field.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({
    super.key,
  });

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmNewPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 425,
        ),
        padding: EdgeInsets.all(40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Color(0xffF5F5F5),
            width: 1.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Current Password
            LabeledTextField(
              label: 'Password  saat ini',
              controller: currentPassword,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Current Password is required';
                }
                return null;
              },
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
            ),

            const SizedBox(height: 32),

            // New Password
            LabeledTextField(
              label: 'Password baru',
              controller: newPassword,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'New Password is required';
                }
                return null;
              },
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
            ),

            const SizedBox(height: 32),

            // Confirm New Password
            LabeledTextField(
              label: 'Konfirmasi Password',
              controller: confirmNewPassword,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Confirm New Password is required';
                }
                if (value != newPassword.text) {
                  return 'Password does not match';
                }
                return null;
              },
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
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
