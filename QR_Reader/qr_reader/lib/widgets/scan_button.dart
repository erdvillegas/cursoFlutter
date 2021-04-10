import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var faker = new Faker();

    return FloatingActionButton(
      elevation: 0,
      child: Icon(Icons.filter_center_focus),
      onPressed: () async {
        // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        //     '#ff6666', 'Cancelar', false, ScanMode.DEFAULT);
        //
        // String barcodeScanRes;
        // if (faker.randomGenerator.boolean()) {
        //   barcodeScanRes = faker.internet.httpUrl();
        // } else {
        //   String pos = faker.randomGenerator.fromPattern(['##.####,-##.####']);
        //   barcodeScanRes = "geo:$pos";
        // }

        String barcodeScanRes = 'geo:19.4286,-99.2067611';
        // String barcodeScanRes = 'https://www.udemy.com/';

        if (barcodeScanRes == '-1') {
          return;
        }

        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);

        final nuevoSca = await scanListProvider.nuevoScan(barcodeScanRes);
      },
    );
  }
}
