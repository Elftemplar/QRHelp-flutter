import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr/pages/home_page.dart';
import 'package:qr/pages/mapa_page.dart';

import 'package:qr/providers/ui_provider.dart';
import 'package:qr/providers/scan_list_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => new UiProvider()),
        ChangeNotifierProvider(create: (context) => new ScanlistProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          'home': (_) => Homepage(),
          'mapa': (_) => Mapapage(),
        },
        theme: ThemeData(
            primaryColor: Colors.blueAccent,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.blueAccent)),
      ),
    );
  }
}
