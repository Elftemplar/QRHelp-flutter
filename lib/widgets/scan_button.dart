import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr/providers/scan_list_provider.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon(Icons.filter_center_focus),
      onPressed: () async {
        // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        //     '#3D8BEF', 'Cancelar', false, ScanMode.QR);
        final barcodeScanRes = 'https://www.youtube.com/';
        final scanListProvider =
            Provider.of<ScanlistProvider>(context, listen: false);
        scanListProvider.nuevoScan(barcodeScanRes);
        scanListProvider.nuevoScan('geo:15.33,15.66');
      },
    );
  }
}
