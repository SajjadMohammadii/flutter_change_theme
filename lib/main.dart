import 'package:change_theme/providers/theme_provider.dart';
import 'package:change_theme/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeProvider.instance.changeTheme(ThemeEnum.light);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final String title = 'Change Theme App';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeEnum currentTheme = ThemeEnum.light;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider.instance)
        ],
        builder: (context, Widget) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Provider.of<ThemeProvider>(context).currentThemeData,
            home: HomeScreen(
              currentTheme: currentTheme,
              title: title,
            ),
          );
        });
  }
}
