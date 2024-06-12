import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/data/auth/model/RegisterRequest.dart';
import 'package:foto_in/feature/auth/provider/auth_provider.dart';
import 'package:foto_in/feature/auth/register/presentation/provider/register_provider.dart';
import 'package:foto_in/utils/button.dart';
import 'package:foto_in/utils/text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  var isObsecure = true;

  final TextEditingController tfFullNameController = TextEditingController();
  final TextEditingController tfUsernameController = TextEditingController();
  final TextEditingController tfEmailController = TextEditingController();
  final TextEditingController tfPasswordController = TextEditingController();

  Function get onPressed => () {
        setState(() {
          isObsecure = !isObsecure;
        });
      };

  @override
  void dispose() {
    super.dispose();
    tfFullNameController.dispose();
    tfUsernameController.dispose();
    tfEmailController.dispose();
    tfPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _content(),
      ),
    );
  }

  Padding _content() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          Row(
            children: [
              Image.asset('assets/images/logo.png'),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Selamat Datang!",
            style:
                FotoInHeadingTypography.small(color: AppColor.primary.shade900),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Silahkan masuk untuk memulai",
            style: FotoInParagraph.small(color: AppColor.textSecondary),
          ),
          const SizedBox(
            height: 20,
          ),
          TfAuth(
            controller: tfFullNameController,
            hintText: "Nama Lengkap",
            keyboardType: TextInputType.name,
          ),
          const SizedBox(
            height: 16,
          ),
          TfAuth(
            controller: tfUsernameController,
            hintText: "Username",
            keyboardType: TextInputType.text,
          ),
          const SizedBox(
            height: 16,
          ),
          TfAuth(
            controller: tfEmailController,
            hintText: "Email",
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 16,
          ),
          TfPasswordType(
            tfPasswordController: tfPasswordController,
            isObsecure: isObsecure,
            hintText: "Password",
            onPressed: onPressed,
          ),
          const SizedBox(
            height: 16,
          ),
          TfPasswordType(
            tfPasswordController: tfPasswordController,
            isObsecure: isObsecure,
            hintText: "Konfirmasi Password",
            onPressed: onPressed,
          ),
          const SizedBox(
            height: 16,
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Lupa Password?",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColor.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          BtnPrimary(
            radius: 8,
            onPressed: () async {
              final RegisterProvider registerProvider =
                  Provider.of<RegisterProvider>(context, listen: false);
              final AuthProvider authProvider =
                  Provider.of<AuthProvider>(context, listen: false);

              // _formKey.currentState!.save();
              await registerProvider.register(
                registerRequest: RegisterRequest(
                  fullname: tfFullNameController.text,
                  username: tfUsernameController.text,
                  password: tfPasswordController.text,
                ),
              );

              if (registerProvider.failure != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Gagal Register"),
                  ),
                );
              } else {
                await authProvider.update();
              }
            },
            tvButton: "Daftar",
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Sudah punya akun? ",
                    style: FotoInParagraph.small(color: AppColor.textSecondary),
                    children: [
                      TextSpan(
                        text: "Masuk",
                        style: GoogleFonts.plusJakartaSans(
                          decoration: TextDecoration.underline,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColor.primary,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Provider.of<AuthProvider>(context, listen: false)
                                .changeAuthState(AuthState.login);
                          },
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
