import 'package:flutter/cupertino.dart';

class SideMenuIconTabModel {
  IconData iconData;
  String title;
  VoidCallback onTab;

  SideMenuIconTabModel({
    required this.iconData,
    required this.title,
    required this.onTab,
  });
}
