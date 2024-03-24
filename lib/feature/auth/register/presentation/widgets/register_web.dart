import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/utils/button.dart';

class RegisterWebWidgets extends StatefulWidget {
  const RegisterWebWidgets({super.key});

  @override
  State<RegisterWebWidgets> createState() => _RegisterWebWidgetsState();
}

class _RegisterWebWidgetsState extends State<RegisterWebWidgets> {
  var isObsecure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _navBar(),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(64),
                    decoration:
                        const BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Color(0x1E000000),
                        blurRadius: 15,
                        offset: Offset(0, 5),
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Color(0x143C4257),
                        blurRadius: 35,
                        offset: Offset(0, 15),
                        spreadRadius: 0,
                      )
                    ]),
                    width: 534,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Register",
                          style: FotoInHeadingTypography.small(),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Silahkan membuat akun terlebih dahulu.",
                          style: FotoInParagraph.small(
                              color: AppColor.textSecondary),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const _TfRegister(
                          title: "Nama",
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const _TfRegister(
                          title: "Username",
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        _TfPass(
                          isObsecure: isObsecure,
                          title: "Password",
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        _TfPass(
                          isObsecure: isObsecure,
                          title: "Konfirmasi Password",
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Checkbox(
                                activeColor: AppColor.primary,
                                value: !isObsecure,
                                onChanged: (value) {
                                  setState(() {
                                    isObsecure = !value!;
                                  });
                                }),
                            Text(
                              "Tampilkan Password",
                              style: FotoInParagraph.small(
                                  color: AppColor.textSecondary),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        BtnPrimary(
                          radius: 4,
                          tvButton: "Register",
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 48,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/logo-large-1.png'),
                      const SizedBox(
                        height: 32,
                      ),
                      Text(
                        "Selamat Datang",
                        style: FotoInHeadingTypography.xLarge(),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Ciptakan momen berkesan dalam hidup Anda",
                        style: FotoInParagraph.large(
                            color: AppColor.textSecondary),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _TfRegister extends StatelessWidget {
  const _TfRegister({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: FotoInSubHeadingTypography.small(),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          decoration: ShapeDecoration(
            color: const Color(0xFFF4F6F7),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            shadows: const [
              BoxShadow(
                color: Color(0x283C4257),
                blurRadius: 0,
                offset: Offset(0, 0),
                spreadRadius: 1,
              )
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              fillColor: const Color(0xffF4F6F7),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _TfPass extends StatelessWidget {
  const _TfPass({
    super.key,
    required this.title,
    required this.isObsecure,
  });

  final String title;
  final bool isObsecure;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: FotoInSubHeadingTypography.small(),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          decoration: ShapeDecoration(
            color: const Color(0xFFF4F6F7),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            shadows: const [
              BoxShadow(
                color: Color(0x283C4257),
                blurRadius: 0,
                offset: Offset(0, 0),
                spreadRadius: 1,
              )
            ],
          ),
          child: TextField(
            obscureText: isObsecure,
            decoration: InputDecoration(
              fillColor: const Color(0xffF4F6F7),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _navBar extends StatelessWidget {
  const _navBar({
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
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
      height: 101,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
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
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              SizedBox(
                  width: 120,
                  child: BtnPrimary(
                    radius: 8,
                    onPressed: () {},
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
  const _NavItem({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: FotoInHeadingTypography.xSmall(color: AppColor.textSecondary),
      ),
    );
  }
}
