import 'package:flutter/material.dart';
import 'package:harry_potter/providers/hogwarts_data.dart';
import 'package:harry_potter/screens/character_list.dart';
import 'package:harry_potter/services/database.dart';
import 'package:harry_potter/services/preferences.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String status = "";

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text(status),
          ],
        ),
      ),
    );
  }

  Future<void> init() async {
    status = "Inicialitzant App";
    setState(() {});
    await Future.delayed(Duration(seconds: 1));
    status = "Inicialitzant Preferences";
    setState(() {});
    await Preferences.instance.init();
    await Future.delayed(Duration(seconds: 1));
    status = "Inicialitzant Base de dades";
    setState(() {});
    await Database.instance.init();
    status = "Llegint dades de la base de dades";
    setState(() {});
    if (!mounted) return;
    HogwartsData hogwartsData = context.read<HogwartsData>();
    await hogwartsData.init();
    await Future.delayed(Duration(seconds: 1));
    status = "Preferences ok";
    setState(() {});
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => CharacterList()),
    );
  }
}
