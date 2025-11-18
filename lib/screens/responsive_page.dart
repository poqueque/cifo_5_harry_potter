import 'package:flutter/material.dart';
import 'package:harry_potter/screens/character_list.dart';
import 'package:harry_potter/screens/wide_layout.dart';

class ResponsivePage extends StatelessWidget {
  const ResponsivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return CharacterList();
        } else {
          return WideLayout();
        }
      },
    );
  }
}
