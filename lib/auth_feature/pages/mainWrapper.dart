import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_valid/auth_feature/pages/bloc/cubit_bot_nav/nav_cubit.dart';
import 'package:user_valid/auth_feature/pages/home.dart';
import 'package:user_valid/auth_feature/pages/signHome.dart';

class MainWrapper extends StatelessWidget {
  const MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, NavState>(
      builder: (context, state) {
        return Scaffold(
          body: PageView(
            controller: state.controller,
            children: const [Home(), SingHome()],
          ),
          bottomNavigationBar: Directionality(
            textDirection: TextDirection.rtl,
            child: BottomBarBubble(
              color: Colors.white,
              backgroundColor: Colors.blue.shade500,
              selectedIndex: 0,
              items: [
                BottomBarItem(
                  label: "خانه",
                  labelTextStyle: const TextStyle(fontSize: 16),
                  iconData: Icons.home,
                ),
                BottomBarItem(
                  iconData: Icons.person,
                  label: "حساب",
                  labelTextStyle: const TextStyle(fontSize: 14),
                ),
              ],
              onSelect: (index) {
                BlocProvider.of<NavCubit>(context)
                    .changeIndex(index, state.controller);
              },
            ),
          ),
        );
      },
    );
  }
}
