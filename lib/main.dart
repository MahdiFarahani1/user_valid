import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_valid/auth_feature/pages/bloc/cubit-login-text/textlogin_cubit.dart';
import 'package:user_valid/auth_feature/pages/bloc/cubit_bot_nav/nav_cubit.dart';
import 'package:user_valid/auth_feature/pages/bloc/cubit_visit_text/visit_text_cubit.dart';
import 'package:user_valid/auth_feature/pages/mainWrapper.dart';
import 'package:user_valid/auth_feature/pages/person.dart';
import 'package:user_valid/auth_feature/pages/signHome.dart';
import 'package:user_valid/auth_feature/pages/signUp.dart';
import 'package:user_valid/auth_feature/pages/singIn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => VisitTextCubit(),
        ),
        BlocProvider(
          create: (context) => NavCubit(),
        ),
        BlocProvider(
          create: (context) => TextLogingCubit(),
        )
      ],
      child: MaterialApp(
        initialRoute: "/",
        routes: {
          SingIn.rn: (context) => const SingIn(),
          SignUp.rn: (context) => const SignUp(),
          SingHome.rn: (context) => const SingHome(),
          Person.rn: (context) => const Person(),
        },
        debugShowCheckedModeBanner: false,
        home: const MainWrapper(),
      ),
    );
  }
}
