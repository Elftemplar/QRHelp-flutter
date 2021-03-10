import 'package:flutter/material.dart';
import 'package:qr/models/scan_model.dart';

import 'db_provider.dart';
// import 'db_provider.dart';

class ScanlistProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';
  nuevoScan(String valor) async {
    final nuevoScan = new ScanModel(valor: valor);
    final id = await DBprovider.db.nuevoScan(nuevoScan);
    //asignar el ID de la base de datos al modelo
    nuevoScan.id = id;

    if (this.tipoSeleccionado == nuevoScan.tipo) {
      this.scans.add(nuevoScan);
    }
    notifyListeners();
  }

  cargarScans() async {
    final scans = await DBprovider.db.getTodosScans();
    this.scans = [...scans];

    notifyListeners();
  }

  cargarScansPorTipo(String tipo) async {
    final scans = await DBprovider.db.getScansPorTipo(tipo);
    this.scans = [...scans];
    this.tipoSeleccionado = tipo;

    notifyListeners();
  }

  borrarTodos() async {
    await DBprovider.db.deleteAll();
    this.scans = [];
    notifyListeners();
  }

  borrarScanPorId(int id) async {
    await DBprovider.db.deleteScan(id);
    cargarScansPorTipo(this.tipoSeleccionado);
  }
}
