import 'package:flutter/material.dart';

class ThemeSelectorScreen extends StatelessWidget {
  const ThemeSelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const ThemeMode selectedThemeMode = ThemeMode.system; 

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Material(
          elevation: 0.1,
          color: Colors.white,
          child: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text("Theme", style: TextStyle(color: Colors.black)),
          ),
        ),
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: const Text('System Default'),
            value: ThemeMode.system,
            groupValue: selectedThemeMode,
            onChanged: null, // disabled
          ),
          RadioListTile<ThemeMode>(
            title: const Text('Light'),
            value: ThemeMode.light,
            groupValue: selectedThemeMode,
            onChanged: null,
          ),
          RadioListTile<ThemeMode>(
            title: const Text('Dark'),
            value: ThemeMode.dark,
            groupValue: selectedThemeMode,
            onChanged: null,
          ),
        ],
      ),
    );
  }
}
