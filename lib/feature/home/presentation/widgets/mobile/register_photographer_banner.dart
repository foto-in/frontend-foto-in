import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';

class RegisterPhotographerBannerMobile extends StatelessWidget {
  final Function()? onPressed;

  const RegisterPhotographerBannerMobile({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Positioned(
              top: 60,
              left: -3,
              child: Image.asset('assets/images/star-subtract.png')),
          Positioned(
            right: 0,
            top: -1,
            child: Image.asset('assets/images/star-subtract-big.png'),
          ),
          Positioned(
              top: 40,
              right: 0,
              child: Image.asset('assets/images/photographer.png')),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Anda adalah seorang fotografer?",
                  style: FotoInSubHeadingTypography.xLarge(color: Colors.white),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 24),
                      backgroundColor: AppColor.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: onPressed,
                    child: Text(
                      "Daftar Sekarang",
                      style: FotoInHeadingTypography.xxSmall(
                        color: AppColor.textPrimary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
