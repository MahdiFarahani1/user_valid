import 'package:flutter/material.dart';

class WidgetsCustom {
  static Widget field({
    required String label,
    required String hint,
    required IconData iconData,
    IconData? iconVisit,
    bool? obscureText = false,
    bool? isIcon = false,
    Function? onTap,
    required String? Function(String? value) valid,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextFormField(
        controller: controller,
        validator: valid,
        obscureText: obscureText!,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          suffixIcon: isIcon!
              ? IconButton(
                  onPressed: () {
                    onTap!();
                  },
                  icon: Icon(iconVisit))
              : null,
          hintStyle: TextStyle(
            fontSize: 16.0,
            color: Colors.black.withAlpha(150),
          ),
          labelStyle: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(
            iconData,
            color: Colors.black,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        style: const TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
      ),
    );
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> sncakbar(
      {required BuildContext context,
      required String text,
      required Color color}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      showCloseIcon: true,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 22),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      content:
          Directionality(textDirection: TextDirection.rtl, child: Text(text)),
      backgroundColor: color,
    ));
  }
}
