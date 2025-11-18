import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harry_potter/providers/hogwarts_data.dart';
import 'package:harry_potter/screens/splash.dart';
import 'package:provider/provider.dart';

import 'l10n/app_localizations.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HogwartsData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(
          fontFamily: GoogleFonts.montserrat().fontFamily,
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFFC0A9FF),
            centerTitle: true,
          ),
        ),
        home: Splash(),
      ),
    );
  }
}
