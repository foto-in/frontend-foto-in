import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/auth/register/presentation/widgets/register_widgets.dart';
import 'package:foto_in/utils/button.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWebWidgets extends StatefulWidget {
  const LoginWebWidgets({super.key});

  @override
  State<LoginWebWidgets> createState() => _LoginWebWidgetsState();
}

class _LoginWebWidgetsState extends State<LoginWebWidgets> {
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
    return SafeArea(
      child: Scaffold(
        body: _content(context),
      ),
    );
  }

  Column _content(BuildContext context) {
    return Column(
      children: [
        const NavBar(),
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
                  TfAuth(
                      controller: tfEmailController,
                      hintText: "Username",
                      keyboardType: TextInputType.name),
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
                        style: FotoInParagraph.small(
                            color: AppColor.textSecondary),
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
          ),
        )
      ],
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

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
              NavItem(title: "Beranda"),
              NavItem(title: "Booking"),
              NavItem(title: "Galeri"),
              NavItem(title: "Pesanan"),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 120,
                child: BtnPrimaryWhite(
                  tvButton: "Masuk",
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/login");
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
                      Navigator.pushReplacementNamed(context, "/register");
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

class NavItem extends StatelessWidget {
  const NavItem({super.key, required this.title});
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
