import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:qr_reader/pages/mapas_page.dart';
import 'package:qr_reader/providers/db_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';
import 'package:qr_reader/widgets/custom_navigationbar.dart';
import 'package:qr_reader/widgets/scan_button.dart';

import 'direcciones_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Historia'), actions: [
        IconButton(icon: Icon(Icons.delete_forever), onPressed: () {})
      ]),
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
    //Obtener el Selected menu option
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOption;

    //TODO: Temporal leer BD
    DBProvider.db.database;

    final tempScan = new ScanModel(valor: 'http://localhost');
    // final intTemp = DBProvider.db.nuevoScan(tempScan);
    // print(intTemp);
    DBProvider.db.getScanById(1).then((value) => print(value));

    switch (currentIndex) {
      case 0:
        return MapasPage();
        break;
      case 1:
        return DireccionesPage();

      default:
        return MapasPage();
    }
  }
}
