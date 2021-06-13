import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/components/CharacterItem.dart';
import 'package:pokemon_app/data/domain/Character.dart';

class ListOfCharacters extends StatelessWidget {
  final List<Character> characters;
  final Function(Character)? onTap;

  const ListOfCharacters({Key? key, required this.characters, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
        itemCount: characters.length,
        itemBuilder: (context, index) {
          return CharacterItem(
              character: characters[index], context: context, onTap: onTap);
        });
  }
}
