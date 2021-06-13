import 'package:flutter/material.dart';

final _icons = <AppIcons, IconData>{
  AppIcons.favorite_border: Icons.favorite_border_outlined,
  AppIcons.favorite: Icons.favorite
};

Icon getIcon(AppIcons name, {Color? color}) {
  if (color == null) {
    return Icon(_icons[name]);
  } else {
    return Icon(_icons[name], color: color);
  }
}

enum AppIcons {
  favorite,
  favorite_border,
}
