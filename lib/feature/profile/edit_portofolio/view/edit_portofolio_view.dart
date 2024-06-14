import 'package:flutter/material.dart';
import 'package:foto_in/feature/profile/edit_portofolio/widget/edit_portofolio.dart';

class EditPortofolioView extends StatelessWidget {
  static const routeName = '/edit-portofolio';
  const EditPortofolioView({super.key});

  @override
  Widget build(BuildContext context) {
    return EditPortofolioMobileWidget();
  }
}
