import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:user_valid/auth_feature/pages/signUp.dart';
import 'package:user_valid/auth_feature/pages/singIn.dart';
import 'package:user_valid/widgets/const_widgets.dart';

class SingHome extends StatelessWidget {
  static String rn = "/signHome";
  const SingHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: ConstWidgets.boxGradient(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ConstWidgets.btnStyle(),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignUp()));
                },
                child: const Text(
                  "ثبت نام",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                )),
            const Gap(20),
            ElevatedButton(
                style: ConstWidgets.btnStyle(),
                onPressed: () {
                  Navigator.pushNamed(context, SingIn.rn);
                },
                child: const Text("ورود",
                    style: TextStyle(color: Colors.black, fontSize: 16))),
          ],
        ),
      ),
    );
  }
}
