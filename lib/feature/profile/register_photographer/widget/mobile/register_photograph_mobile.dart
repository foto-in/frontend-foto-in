import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/mobile/informasi_pribadi_mobile.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/mobile/informasi_tambahan_mobile.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/mobile/jenis_pemotretan_mobile.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/mobile/portofolio.dart';
import 'package:foto_in/feature/profile/register_photographer/widget/mobile/status_mobile.dart';
import 'package:foto_in/utils/button.dart';
import 'package:iconsax/iconsax.dart';

List<Widget> widgets = [
  StatusMobile(),
  JenisPemotretanMobile(),
  InformasiPribadiMobile(),
  InformasiTambahanMobile(),
  PortofolioPageMobile()
];

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  final _pageController = PageController();

  final _pageCount = widgets.length;

  int _currentPage = 0;
  double? _screenWidth;
  double? _unit;
  double? _progress;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _currentPage = _pageController.page!.round();
      setState(() {
        _progress = (_currentPage + 1) * _unit!;
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screenWidth = MediaQuery.of(context).size.width;
    _unit = _screenWidth! / _pageCount;
    _progress ??= _unit;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 32, bottom: 20),
              child: progressBar(),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                children: _createPage(),
              ),
            ),
            formNavigation()
          ],
        ),
      ),
    );
  }

  Stack progressBar() {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            height: 8,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.primary),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: AnimatedContainer(
            height: 8,
            width: _progress,
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.secondary,
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _createPage() {
    return widgets
        .map(
          (e) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: e,
          ),
        )
        .toList();
  }

  // void _moveNextPage() {
  //   if (_pageController.page!.round() == _pageCount - 1) {
  //     _pageController.jumpToPage(0);
  //   } else {
  //     _pageController.nextPage(
  //         curve: Curves.bounceIn, duration: const Duration(milliseconds: 100));
  //   }
  // }

  Widget formNavigation() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FotoInTextButton(
              onTap: () {
                if (_currentPage > 0) {
                  _currentPage = _currentPage - 1;
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  Navigator.pop(context);
                }
              },
              child: Row(
                children: [
                  const Icon(
                    Iconsax.arrow_left_2,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Kembali",
                    style: FotoInSubHeadingTypography.medium(
                      color: AppColor.textPrimary,
                    ),
                  ),
                ],
              )),
          FotoInTextButton(
            onTap: () {
              if (_currentPage < widgets.length - 1) {
                _currentPage = _currentPage + 1;
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else if (_currentPage == widgets.length - 1) {
                Navigator.pop(context);
              }
            },
            child: Row(
              children: [
                _currentPage == widgets.length - 1
                    ? Text(
                        "Daftar",
                        style: FotoInSubHeadingTypography.medium(
                          color: AppColor.textPrimary,
                        ),
                      )
                    : Text(
                        "Selanjutnya",
                        style: FotoInSubHeadingTypography.medium(
                          color: AppColor.textPrimary,
                        ),
                      ),
                const SizedBox(width: 8),
                const Icon(
                  Iconsax.arrow_right_3,
                  size: 20,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
