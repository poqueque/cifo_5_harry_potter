import 'package:flutter/material.dart';
import 'package:harry_potter/screens/character_detail.dart';
import 'package:harry_potter/screens/character_list.dart';
import 'package:harry_potter/services/preferences.dart';

class WideLayout extends StatefulWidget {
  const WideLayout({super.key});

  @override
  State<WideLayout> createState() => _WideLayoutState();
}

class _WideLayoutState extends State<WideLayout> {
  int? selectedCharacter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Benvinguts a Hogwarts"),
        actions: [
          Switch(
            value: Preferences.instance.hasToShowSubtitles(),
            onChanged: (value) {
              Preferences.instance.setShowSubtitles(value);
              setState(() {});
            },
          ),
        ],
      ),
      body: Row(
        children: [
          Flexible(
            flex: 1,
            child: CharacterList(
              hasToShowAppBar: false,
              onCharacterTap: (int characterId) {
                selectedCharacter = characterId;
                setState(() {});
              },
            ),
          ),
          Flexible(
            flex: 2,
            child: (selectedCharacter == null)
                ? Center(child: Text("Selecciona un personatge a la llista"))
                : CharacterDetail(
                    characterId: selectedCharacter!,
                    hasToShowAppBar: false,
                  ),
          ),
        ],
      ),
    );
  }
}
