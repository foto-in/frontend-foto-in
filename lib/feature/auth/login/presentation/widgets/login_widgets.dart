import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/utils/button.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
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
      body: _content(),
    );
  }

  Center _content() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/logo.png'),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Selamat Datang!",
              style: FotoInHeadingTypography.small(
                  color: FotoInColor.blue.shade900),
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
            TextField(
              controller: tfEmailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Email/Username",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: AppColor.textFieldBackground,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: tfPasswordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: isObsecure,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      onPressed();
                    },
                    icon: Icon(
                      isObsecure
                          ? CupertinoIcons.eye_slash
                          : CupertinoIcons.eye,
                      color: AppColor.textSecondary,
                    )),
                hintText: "Password",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: AppColor.textFieldBackground,
              ),
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
              tvButton: "Masuk",
              onPressed: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  child: Divider(
                    color: AppColor.textSecondary,
                    thickness: 1,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Belum punya akun?",
                  style: FotoInParagraph.small(color: AppColor.textSecondary),
                ),
                const SizedBox(
                  width: 16,
                ),
                const Expanded(
                  child: Divider(
                    color: AppColor.textSecondary,
                    thickness: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            BtnPrimaryWhite(
              tvButton: "Daftar",
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
            ),
          ],
        ),
      ),
    );
  }
}
