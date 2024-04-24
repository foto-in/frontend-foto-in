import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foto_in/core/const/constant.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/data/model/RegisterRequest.dart';
import 'package:foto_in/feature/auth/register/presentation/provider/register_provider.dart';
import 'package:foto_in/feature/auth/register/presentation/widgets/register_widgets.dart';
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
  var tfEmailController = TextEditingController();
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
    tfEmailController.dispose();
    tfPasswordController.dispose();
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
        const _navBar(),
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
                  TfAuth(
                      controller: tfFullName,
                      hintText: "Nama Lengkap",
                      keyboardType: TextInputType.name),
                  const SizedBox(
                    height: 16,
                  ),
                  TfAuth(
                      controller: tfUsernameController,
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
                      tfPasswordController: tfConfirmPasswordController,
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
                  Consumer<RegisterProvider>(builder: (context, state, _) {
                    return ElevatedButton(
                      child: Text("Regiter Contol"),
                      onPressed: () async {
                        print("Urlnya bang:" + base_url + register_path);
                        print(tfUsernameController.text);
                        print(tfFullName.text);
                        print(tfPasswordController.text);
                        try {
                          state.register(
                              registerRequest: RegisterRequest(
                                  username: tfUsernameController.text,
                                  fullname: tfFullName.text,
                                  password: tfPasswordController.text));
                        } catch (e) {
                          print(e);
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

class _navBar extends StatelessWidget {
  const _navBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 14,
            child: Image.asset('assets/images/logo-2.png'),
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _NavItem(title: "Beranda"),
              _NavItem(title: "Booking"),
              _NavItem(title: "Galeri"),
              _NavItem(title: "Pesanan"),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 120,
                child: BtnPrimaryWhite(
                  tvButton: "Masuk",
                  onPressed: () {
                    Navigator.of(context).pushNamed('/login');
                  },
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              SizedBox(
                  width: 120,
                  child: BtnPrimary(
                    radius: 8,
                    onPressed: () {
                      Navigator.of(context).pushNamed('/register');
                    },
                    tvButton: "Daftar",
                  ))
            ],
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: FotoInHeadingTypography.xxSmall(color: AppColor.textSecondary),
      ),
    );
  }
}
