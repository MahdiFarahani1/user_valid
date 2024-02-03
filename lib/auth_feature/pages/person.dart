import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Person extends StatelessWidget {
  static String rn = "/person";
  const Person({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments! as Map<String, dynamic>;
    final username = args["username"];
    final email = args["email"];
    final phone = args["phone"];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade500,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("خوش آمد"),
            const Gap(20),
            Text("$username : نام کاربری"),
            const Gap(20),
            Text("$email : ایمیل "),
            const Gap(20),
            Text(" $phone : شماره تلفن"),
          ],
        ),
      ),
    );
  }
}
