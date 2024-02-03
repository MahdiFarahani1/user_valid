import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'textlogin_state.dart';

class TextLogingCubit extends Cubit<TextLoginState> {
  TextLogingCubit()
      : super(
            const TextLoginState(obText: true, iconData: Icons.visibility_off));

  void toggleObscureText() {
    if (state.obText) {
      emit(const TextLoginState(obText: false, iconData: Icons.visibility));
    } else {
      emit(const TextLoginState(obText: true, iconData: Icons.visibility_off));
    }
  }
}
