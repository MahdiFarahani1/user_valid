import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'nav_state.dart';

class NavCubit extends Cubit<NavState> {
  NavCubit() : super(NavState(index: 0));

  void changeIndex(int index, PageController pageController) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
