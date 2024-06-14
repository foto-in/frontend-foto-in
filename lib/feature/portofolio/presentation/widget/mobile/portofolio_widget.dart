import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/fotografer/presentation/widgets/portofolio_card_small.dart';
import 'package:foto_in/feature/portofolio_detail/presentation/view/portofolio_view.dart';

class PortofolioMobileWidget extends StatelessWidget {
  const PortofolioMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundPrimary,
        appBar: AppBar(
          title: Text('Portofolio'),
          backgroundColor: AppColor.backgroundPrimary,
          centerTitle: true,
          titleTextStyle: FotoInHeadingTypography.xSmall(
            color: AppColor.textPrimary,
          ),
        ),
        body: SafeArea(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                        context, PortofolioDetailMobileView.routeName);
                  },
                  child: PortofolioCardSmall());
            },
          ),
        ));
  }
}
