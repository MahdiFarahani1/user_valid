import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_storage/get_storage.dart';
import 'package:user_valid/auth_feature/repositoreis/storage.dart';

class Person extends StatelessWidget {
  static String rn = "/person";
  const Person({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final storge = GetStorage();
    final islogin = storge.read("login");
    ManageStorage manageStorage = ManageStorage();
    final storageArg = manageStorage.readUser();
    final username = args?["username"] ?? 'a';
    final email = args?["email"] ?? 'a';
    final phone = args?["phone"] ?? 'a';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade500,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: islogin
              ? [
                  const Text("خوش آمد"),
                  const Gap(20),
                  Text("${storageArg["username"]} : نام کاربری"),
                  const Gap(20),
                  Text("${storageArg["email"]} : ایمیل "),
                  const Gap(20),
                  Text(" ${storageArg["phone"]} : شماره تلفن"),
                ]
              : [
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
