import 'package:change_theme/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.currentTheme,
    required this.title,
  });

  final ThemeEnum currentTheme;
  final String title;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              if (themeProvider.currentTheme == ThemeEnum.light) {
                themeProvider.changeTheme(ThemeEnum.dark);
              } else {
                themeProvider.changeTheme(ThemeEnum.light);
              }
            },
            icon: Icon(
              themeProvider.currentTheme == ThemeEnum.light
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
          ),
        ],
      ),
    );
  }
}
