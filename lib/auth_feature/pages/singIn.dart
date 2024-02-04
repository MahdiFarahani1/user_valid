import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:user_valid/auth_feature/data_sourse/remote/send_user.dart';
import 'package:user_valid/auth_feature/pages/bloc/cubit-login-text/textlogin_cubit.dart';
import 'package:user_valid/auth_feature/pages/person.dart';
import 'package:user_valid/auth_feature/repositoreis/storage.dart';

import 'package:user_valid/auth_feature/repositoreis/validation_form.dart';
import 'package:user_valid/widgets/const_widgets.dart';
import 'package:user_valid/widgets/widgets_Custom.dart';

class SingIn extends StatelessWidget {
  static String rn = "/signIn";

  const SingIn({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formkey1 = GlobalKey<FormState>();
    final TextEditingController textUser = TextEditingController();
    final TextEditingController textpass = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 170,
        flexibleSpace: Container(
          alignment: Alignment.centerRight,
          height: 170,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.green,
                Colors.blue,
              ],
              begin: Alignment.topCenter, //
              end: Alignment.bottomCenter,
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.only(right: 22),
            child: Text(
              "پنل ورود",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: ConstWidgets.boxGradient(),
        child: Form(
            key: formkey1,
            child: BlocBuilder<TextLogingCubit, TextLoginState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WidgetsCustom.field(
                        controller: textUser,
                        valid: (value) {
                          return Valid.validateUsername(value!);
                        },
                        hint: "لطفا نام کاربری خود را وارد کنید",
                        label: "نام کاربری",
                        iconData: Icons.person),
                    ConstWidgets.space(15),
                    WidgetsCustom.field(
                        controller: textpass,
                        valid: (value) {
                          return Valid.validatePassword(value!);
                        },
                        isIcon: true,
                        hint: "لطفا رمز عبور خود را وارد کنید",
                        label: "رمز عبور",
                        obscureText: state.obText,
                        iconVisit: state.iconData,
                        onTap: () {
                          BlocProvider.of<TextLogingCubit>(context)
                              .toggleObscureText();
                        },
                        iconData: Icons.password_rounded),
                    const Gap(30),
                    ElevatedButton(
                      style: ConstWidgets.btnStyle(),
                      onPressed: () async {
                        print("${textUser.text}");
                        print("${textpass.text}");

                        if (formkey1.currentState!.validate()) {
                          ApiProvider apiProvider = ApiProvider();
                          var res = await apiProvider.checkUser(
                              username: textUser.text, password: textpass.text);

                          if (res != null) {
                            ManageStorage manageStorage = ManageStorage();
                            manageStorage.login();
                            manageStorage.saveUser(
                                username: res.username,
                                email: res.email,
                                phone: res.phone.toString());
                            // ignore: use_build_context_synchronously
                            Navigator.pushNamed(context, Person.rn, arguments: {
                              "username": textUser.text,
                              "email": res.email,
                              "phone": res.phone,
                            });
                            // ignore: use_build_context_synchronously
                            WidgetsCustom.sncakbar(
                                context: context,
                                text: "ورود با موفقیت انجام شد",
                                color: Colors.green);
                          } else {
                            // ignore: use_build_context_synchronously
                            WidgetsCustom.sncakbar(
                                context: context,
                                text: "این مشخصات وجود ندارد ",
                                color: Colors.red);
                          }
                        }
                      },
                      child: const Text(
                        "وارد شوید",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                );
              },
            )),
      ),
    );
  }
}
