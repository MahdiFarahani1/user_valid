import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'visit_text_state.dart';

class VisitTextCubit extends Cubit<VisitTextState> {
  VisitTextCubit()
      : super(
            const VisitTextState(obText: true, iconData: Icons.visibility_off));

  void toggleObscureText() {
    if (state.obText) {
      emit(const VisitTextState(obText: false, iconData: Icons.visibility));
    } else {
      emit(const VisitTextState(obText: true, iconData: Icons.visibility_off));
    }
  }
}
