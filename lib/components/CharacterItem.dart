import 'package:flutter/material.dart';
import 'package:pokemon_app/data/domain/Character.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  final BuildContext context;
  final Function(Character)? onTap;

  const CharacterItem(
      {Key? key, required this.character, required this.context, this.onTap})
      : super(key: key);

  void _onTap() {
    if (onTap != null) {
      onTap!(character);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      onTap: _onTap,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(character.imageUrl ?? ""),
            Text(character.name)
          ],
        ),
      ),
    ));
  }
}
