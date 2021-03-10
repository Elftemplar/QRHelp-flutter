import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedmenuOpt;
    return BottomNavigationBar(
        onTap: (int i) => uiProvider.selectedmenuOpt = i,
        currentIndex: currentIndex,
        elevation: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text('Mapa'),
            icon: Icon(Icons.map),
          ),
          BottomNavigationBarItem(
            title: Text('Direciones'),
            icon: Icon(Icons.location_on),
          ),
        ]);
  }
}
