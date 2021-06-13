import 'package:flutter/material.dart';
import 'package:pokemon_app/data/domain/Character.dart';
import 'package:pokemon_app/utils/arguments.dart';
import 'package:pokemon_app/utils/icons.dart';

class CharacterDetails extends StatefulWidget {
  CharacterDetails({Key? key}) : super(key: key);

  @override
  _CharacterDetailsState createState() => _CharacterDetailsState();
}

class _CharacterDetailsState extends State<CharacterDetails> {
  late Character character;

  void _getArguments() {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map;

    if (arguments.isEmpty) {
      Navigator.pop(context);
      return;
    }

    character = arguments[character_arg];
  }

  @override
  Widget build(BuildContext context) {
    _getArguments();

    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Character Details")],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: getIcon(AppIcons.favorite_border),
      ),
    );
  }
}
