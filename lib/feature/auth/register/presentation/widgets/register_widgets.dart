import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/utils/button.dart';
import 'package:foto_in/utils/text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  var isObsecure = true;
  var tfEmailController = TextEditingController();
  var tfPasswordController = TextEditingController();
  Function get onPressed => () {
        setState(() {
          isObsecure = !isObsecure;
        });
      };

  @override
  void dispose() {
    super.dispose();
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
              controller: tfEmailController,
              hintText: "Nama Lengkap",
              keyboardType: TextInputType.name),
          const SizedBox(
            height: 16,
          ),
          TfAuth(
              controller: tfEmailController,
              hintText: "Username",
              keyboardType: TextInputType.name),
          const SizedBox(
            height: 16,
          ),
          TfAuth(
              controller: tfEmailController,
              hintText: "Email",
              keyboardType: TextInputType.emailAddress),
          const SizedBox(
            height: 16,
          ),
          TfPasswordType(
              tfPasswordController: tfPasswordController,
              isObsecure: isObsecure,
              hintText: "Password",
              onPressed: onPressed),
          const SizedBox(
            height: 16,
          ),
          TfPasswordType(
              tfPasswordController: tfPasswordController,
              isObsecure: isObsecure,
              hintText: "Konfirmasi Password",
              onPressed: onPressed),
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
            onPressed: () {},
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
                            Navigator.of(context).pushNamed('/login');
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
