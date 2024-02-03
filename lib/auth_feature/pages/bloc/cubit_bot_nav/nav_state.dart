part of 'nav_cubit.dart';

class NavState {
  int index;
  final PageController controller = PageController(initialPage: 0);

  NavState({required this.index});
}
