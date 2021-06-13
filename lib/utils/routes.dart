import 'package:flutter/material.dart';
import 'package:pokemon_app/pages/character_detail_page.dart';
import 'package:pokemon_app/pages/home_page.dart';
import 'package:pokemon_app/utils/strings.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    home_route: (BuildContext context) => HomePage(title: app_name),
    character_detail_route: (BuildContext context) => CharacterDetails()
  };
}

const home_route = '/';
const character_detail_route = 'character_detail';
