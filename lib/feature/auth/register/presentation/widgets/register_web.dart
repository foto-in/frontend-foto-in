import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/data/auth/model/RegisterRequest.dart';
import 'package:foto_in/feature/auth/register/presentation/provider/register_provider.dart';
import 'package:foto_in/feature/auth/register/presentation/widgets/register_widgets.dart';
import 'package:foto_in/feature/navigation/presentation/view/navigation.dart';
import 'package:foto_in/utils/button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterWebWidgets extends StatefulWidget {
  const RegisterWebWidgets({super.key});

  @override
  State<RegisterWebWidgets> createState() => _RegisterWebWidgetsState();
}

class _RegisterWebWidgetsState extends State<RegisterWebWidgets> {
  var isObsecure = true;
  var tfUsernameController = TextEditingController();
  var tfFullName = TextEditingController();
  var tfPasswordController = TextEditingController();
  var tfConfirmPasswordController = TextEditingController();
  Function get onPressed => () {
        setState(() {
          isObsecure = !isObsecure;
        });
      };

  @override
  void dispose() {
    super.dispose();
    tfPasswordController.dispose();
    tfUsernameController.dispose();
    tfFullName.dispose();
    tfConfirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _content(context),
      ),
    );
  }

  Column _content(BuildContext context) {
    return Column(
      children: [
        const NavigationCustom(),
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height - 44,
          child: Center(
            child: SizedBox(
              width: 343,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Image.asset(
                      'assets/images/logo.png',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Daftar",
                    style:
                        FotoInHeadingTypography.small(color: AppColor.primary),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Silahkan membuat akun terlebih dahulu.",
                    style: FotoInParagraph.small(color: AppColor.textSecondary),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: TfAuth(
                        controller: tfFullName,
                        hintText: "Nama Lengkap",
                        keyboardType: TextInputType.name),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: TfAuth(
                        controller: tfUsernameController,
                        hintText: "Username",
                        keyboardType: TextInputType.name),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: TfPasswordType(
                        tfPasswordController: tfPasswordController,
                        isObsecure: isObsecure,
                        hintText: "Password",
                        onPressed: onPressed),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: TfPasswordType(
                        tfPasswordController: tfConfirmPasswordController,
                        isObsecure: isObsecure,
                        hintText: "Konfirmasi Password",
                        onPressed: onPressed),
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
                  Consumer<RegisterProvider>(builder: (context, state, _) {
                    return BtnPrimary(
                      tvButton: "Register",
                      radius: 8,
                      onPressed: () async {
                        if (tfPasswordController.text !=
                            tfConfirmPasswordController.text) {
                          return setState(() {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Password tidak sama"),
                              ),
                            );
                          });
                        } else if (tfPasswordController.text.length < 8) {
                          return setState(() {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Password minimal 8 karakter"),
                              ),
                            );
                          });
                        } else if (tfUsernameController.text.isEmpty ||
                            tfFullName.text.isEmpty) {
                          return setState(() {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    "Username dan Nama Lengkap tidak boleh kosong"),
                              ),
                            );
                          });
                        } else {
                          try {
                            state.register(
                              registerRequest: RegisterRequest(
                                  username: tfUsernameController.text,
                                  fullname: tfFullName.text,
                                  password: tfPasswordController.text),
                            );
                            setState(() {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Berhasil Register"),
                                ),
                              );
                            });
                          } catch (e) {
                            print(e);
                          }
                        }
                      },
                    );
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "Sudah punya akun? ",
                          style: FotoInParagraph.small(
                              color: AppColor.textSecondary),
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
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
