import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:qr/providers/db_provider.dart';
// import 'package:qr/models/scan_model.dart';
// import 'package:qr/providers/db_provider.dart';
import 'package:qr/providers/scan_list_provider.dart';
import 'package:qr/providers/ui_provider.dart';

import 'package:qr/pages/mapas_page.dart';
import 'package:qr/pages/direcciones_page.dart';

import 'package:qr/widgets/custom_navigationbar.dart';
import 'package:qr/widgets/scan_button.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('historial'),
        actions: [
          IconButton(
              icon: Icon(Icons.delete_forever),
              onPressed: () {
                Provider.of<ScanlistProvider>(context, listen: false)
                    .borrarTodos();
              })
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //obtener el selected menu opt

    final uiProvider = Provider.of<UiProvider>(context);
    // cabiar para morstrar paguina respectiva
    final currentIndex = uiProvider.selectedmenuOpt;
    // TODO: temporal leer base de datos
    // final tempScan = new ScanModel(valor: 'https://www.youtube.com/');
    // DBprovider.db.deleteAllScan().then(print);

    //usar scan list Provider
    final scanListProvider =
        Provider.of<ScanlistProvider>(context, listen: false);
    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScansPorTipo('geo');
        return MapasPage();
      case 1:
        scanListProvider.cargarScansPorTipo('http');
        return DireccionesPage();
      default:
        return MapasPage();
    }
  }
}
