import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_valid/auth_feature/data_sourse/model/model-send-user.dart';
import 'package:user_valid/auth_feature/data_sourse/remote/send_user.dart';
import 'package:user_valid/auth_feature/pages/bloc/cubit_visit_text/visit_text_cubit.dart';
import 'package:user_valid/auth_feature/pages/person.dart';
import 'package:user_valid/auth_feature/repositoreis/validation_form.dart';
import 'package:user_valid/widgets/const_widgets.dart';
import 'package:user_valid/widgets/widgets_Custom.dart';

class SignUp extends StatelessWidget {
  static String rn = "/signUp";

  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formkey = GlobalKey<FormState>();
    final TextEditingController textUser = TextEditingController();
    final TextEditingController textpass = TextEditingController();
    final TextEditingController textphone = TextEditingController();
    final TextEditingController textemail = TextEditingController();

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
              'پنل ثبت نام',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
          decoration: ConstWidgets.boxGradient(),
          child: BlocBuilder<VisitTextCubit, VisitTextState>(
            builder: (context, state) {
              return Form(
                key: formkey,
                child: Column(
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
                          BlocProvider.of<VisitTextCubit>(context)
                              .toggleObscureText();
                        },
                        iconData: Icons.password_rounded),
                    ConstWidgets.space(15),
                    WidgetsCustom.field(
                        controller: textphone,
                        valid: (value) {
                          return Valid.validatePhoneNumber(value!);
                        },
                        hint: "لطفا شماره همراه خود را وارد کنید",
                        label: "شماره همراه",
                        iconData: Icons.phone),
                    ConstWidgets.space(15),
                    WidgetsCustom.field(
                        controller: textemail,
                        valid: (value) {
                          return Valid.validateEmail(value!);
                        },
                        hint: "لطفا نام ایمیل خود را وارد کنید",
                        label: "ایمیل",
                        iconData: Icons.email_rounded),
                    ConstWidgets.space(65),
                    ElevatedButton(
                      style: ConstWidgets.btnStyle(),
                      onPressed: () async {
                        print("${textUser.text}");
                        print("${textpass.text}");
                        print("${textphone.text}");
                        print("${textemail.text}");

                        if (formkey.currentState!.validate()) {
                          ApiProvider apiProvider = ApiProvider();
                          if (await apiProvider.sendUser(User(
                              username: textUser.text,
                              password: textpass.text,
                              phone: textphone.text,
                              email: textemail.text))) {
                            // ignore: use_build_context_synchronously
                            Navigator.pushNamed(context, Person.rn, arguments: {
                              "username": textUser.text,
                              "email": textemail.text,
                              "phone": textphone.text,
                            });
                            // ignore: use_build_context_synchronously
                            WidgetsCustom.sncakbar(
                                context: context,
                                text: "ثبت نام با موفقیت انجام شد",
                                color: Colors.green);
                          } else {
                            // ignore: use_build_context_synchronously
                            WidgetsCustom.sncakbar(
                                context: context,
                                text: "این مشخصات قبلا ثبت شده است",
                                color: Colors.red);
                          }
                        }
                      },
                      child: const Text(
                        "ثبت نام",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              );
            },
          )),
    );
  }
}
