import 'package:flutter/material.dart';
import 'package:harry_potter/l10n/app_localizations.dart';
import 'package:harry_potter/providers/hogwarts_data.dart';
import 'package:harry_potter/screens/character_detail.dart';
import 'package:harry_potter/services/preferences.dart';
import 'package:provider/provider.dart';

class CharacterList extends StatefulWidget {
  const CharacterList({
    super.key,
    this.hasToShowAppBar = true,
    this.onCharacterTap,
  });
  final bool hasToShowAppBar;
  final Function(int)? onCharacterTap;

  @override
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  
  @override
  Widget build(BuildContext context) {
    AppLocalizations l = AppLocalizations.of(context)!;
    return Consumer<HogwartsData>(
      builder: (context, hogwartsData, child) {
        return Scaffold(
          appBar: widget.hasToShowAppBar
              ? AppBar(
                  title: Text(l.welcome),
                  actions: [
                    Switch(
                      value: Preferences.instance.hasToShowSubtitles(),
                      onChanged: (value) {
                        Preferences.instance.setShowSubtitles(value);
                        setState(() {});
                      },
                    ),
                  ],
                )
              : null,
          body: ListView(
            children: [
              for (var character in hogwartsData.characters)
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: ListTile(
                    leading: Hero(
                      tag: character.name,
                      child: Image.network(character.imageUrl),
                    ),
                    title: Text(character.name),

                    subtitle: Preferences.instance.hasToShowSubtitles()
                        ? Text("${character.totalReviews} valoracions")
                        : null,
                    trailing: InkWell(
                      onTap: () {
                        hogwartsData.toggleFavorite(character.id);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          character.favorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                        ),
                      ),
                    ),
                    onTap: () {
                      if (widget.onCharacterTap == null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CharacterDetail(characterId: character.id),
                          ),
                        );
                      } else {
                        widget.onCharacterTap!(character.id);
                      }
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
