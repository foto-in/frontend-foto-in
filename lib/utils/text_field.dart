import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foto_in/core/styles/colors.dart';

class TfFotoin extends StatelessWidget {
  const TfFotoin(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.keyboardType,
      this.readOnly = false,
      required this.maxLines,
      this.prefixIcon,
      required this.validator});

  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final int? maxLines;
  final bool readOnly;
  final String validator;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      readOnly: readOnly,
      maxLines: maxLines,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Tolong Masukan $validator';
        }
        return null;
      },
      cursorColor: AppColor.primary,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: AppColor.textFieldBackground,
      ),
    );
  }
}

class TfPasswordType extends StatelessWidget {
  const TfPasswordType({
    super.key,
    required this.tfPasswordController,
    required this.isObsecure,
    required this.onPressed,
    required this.hintText,
  });

  final TextEditingController tfPasswordController;
  final bool isObsecure;
  final Function onPressed;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Tolong Masukan Password';
        }
        return null;
      },
      controller: tfPasswordController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: isObsecure,
      decoration: InputDecoration(
        suffixIcon: IconButton(
            onPressed: () {
              onPressed();
            },
            icon: Icon(
              isObsecure ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
              color: AppColor.textSecondary,
            )),
        hintText: hintText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: AppColor.textFieldBackground,
      ),
    );
  }
}

class TfAuth extends StatelessWidget {
  const TfAuth({
    super.key,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    this.validator,
    this.hintStyle,
    this.obscureText = false,
    this.maxLines,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final TextStyle? hintStyle;
  final bool obscureText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: AppColor.textFieldBackground,
      ),
      validator: validator,
      obscureText: obscureText,
      maxLines: maxLines,
    );
  }
}
