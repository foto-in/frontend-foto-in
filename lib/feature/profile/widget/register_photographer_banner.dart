import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/utils/button.dart';

class RegisterPhotographerBanner extends StatelessWidget {
  const RegisterPhotographerBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      constraints: const BoxConstraints(
        maxWidth: 490,
      ),
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          // Stars
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 64,
                ),
                child: Image.asset(
                  'assets/images/profile/register_photographer_left.png',
                  width: 24,
                  alignment: Alignment.bottomLeft,
                ),
              ),

              // read svg from image/profile/register_photographer_right.svg
              Image.asset(
                'assets/images/profile/register_photographer_right.png',
                width: 184,
                alignment: Alignment.bottomRight,
              ),
            ],
          ),

          // Text
          Container(
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Raih penghasilan dari passion fotografi Anda",
                  style: FotoInSubHeadingTypography.medium(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 12),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 320,
                  ),
                  child: Text(
                    "Bergabunglah dengan ribuan fotografer FotoIn dan mulailah mendapatkan klien, untuk segala jenis fotografi.",
                    style: FotoInParagraph.small(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 24),
                FotoInButton(
                  text: "Bergabung menjadi Fotografer",
                  onPressed: () {
                    Navigator.of(context).pushNamed('/register_photographer');
                  },
                  backgroundColor: AppColor.secondary,
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 9,
                  ),
                  width: null,
                  textStyle: FotoInSubHeadingTypography.small(
                    color: AppColor.primary,
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
