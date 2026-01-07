import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter_ducky_app/l10n/l10n.dart';
import 'package:flutter_ducky_app/screens/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const DuckyApp());
}

class DuckyApp extends StatefulWidget {
  const DuckyApp({super.key});

  @override
  State<DuckyApp> createState() => _DuckyAppState();
}

class _DuckyAppState extends State<DuckyApp> {
  Locale? _selectedLocale;

  @override
  void initState() {
    super.initState();
    _loadLocale();
  }

  Future<void> _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final localeCode = prefs.getString('selected_locale') ?? 'en';
    setState(() {
      _selectedLocale = Locale(localeCode);
    });
  }

  Future<void> _updateLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_locale', locale.languageCode);
    setState(() {
      _selectedLocale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_selectedLocale == null) {
      return MaterialApp(
        title: 'Flipper DuckyMaker',
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamicColorScheme, ColorScheme? darkDynamicColorScheme) {
        return MaterialApp(
          title: 'Flipper DuckyMaker',
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightDynamicColorScheme ?? ColorScheme.fromSeed(
              seedColor: const Color(0xFF6A0ACA),
              brightness: Brightness.light,
            ),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkDynamicColorScheme ?? ColorScheme.fromSeed(
              seedColor: const Color(0xFF6A0ACA),
              brightness: Brightness.dark,
            ),
          ),
          themeMode: ThemeMode.system,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: L10n.all,
          locale: _selectedLocale,
          home: MainScreen(updateLocaleCallback: _updateLocale),
        );
      },
    );
  }
}