import 'dart:ui';

class ProfileModel {
  String leadingIcon, title;
  bool ishowDivider;
  Color? color;
  ProfileModel(
      {required this.leadingIcon,
      required this.title,
      required this.ishowDivider,
      this.color});
}
