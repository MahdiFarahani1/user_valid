import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ConstWidgets {
  static Widget space(double val) {
    return Gap.expand(val);
  }

  static BoxDecoration boxGradient() {
    return const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.green]));
  }

  static ButtonStyle btnStyle() {
    return ElevatedButton.styleFrom(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      elevation: 0,
      fixedSize: const Size(180, 40),
    );
  }
}
