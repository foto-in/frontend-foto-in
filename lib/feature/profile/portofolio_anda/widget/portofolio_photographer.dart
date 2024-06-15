import 'package:flutter/material.dart';
import 'package:foto_in/core/styles/colors.dart';
import 'package:foto_in/core/styles/typography.dart';
import 'package:foto_in/feature/profile/edit_portofolio/view/edit_portofolio_view.dart';
import 'package:foto_in/feature/profile/presentation/widget/portofolio_card.dart';
import 'package:foto_in/feature/profile/register_photographer/add_portofolio/presentation/view/add_portofolio_view.dart';

class PhotographerPortofolioWidget extends StatefulWidget {
  const PhotographerPortofolioWidget({super.key});

  @override
  State<PhotographerPortofolioWidget> createState() =>
      _PhotographerPortofolioWidgetState();
}

class _PhotographerPortofolioWidgetState
    extends State<PhotographerPortofolioWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portofolio'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: AppColor.secondary),
            onPressed: () {
              Navigator.pushNamed(context, AddPortofolioView.routeName);
            },
          ),
        ],
        titleTextStyle: FotoInHeadingTypography.xSmall(
          color: AppColor.textPrimary,
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
              child: PortofolioCard(
                id: 'xxx',
                title: 'Pernikahan Romantis di Pantai',
                description:
                    'Pernikahan pasangan Budi dan Ani yang diadakan di tepi pantai dengan tema romantis dan alami. Foto-foto ini menampilkan momen-momen istimewa sepanjang acara pernikahan mereka, mulai dari persiapan pagi hingga pesta malam hari.',
                onTap: () {
                  Navigator.pushNamed(context, EditPortofolioView.routeName);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
