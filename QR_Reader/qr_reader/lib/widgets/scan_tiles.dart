import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart' as utils;

class ScanTiles extends StatelessWidget {
  final String tipo;

  const ScanTiles({@required this.tipo});

  @override
  Widget build(BuildContext context) {
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    final scan = scanListProvider.scans;

    return ListView.builder(
        itemCount: scanListProvider.scans.length,
        itemBuilder: (_, i) => Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.red,
                child: Center(
                    child: Text('Eliminar',
                        style: Theme.of(context).textTheme.subtitle1)),
              ),
              onDismissed: (DismissDirection direction) {
                Provider.of<ScanListProvider>(context, listen: false)
                    .borrarScanPorId(scan[i].id);
              },
              child: ListTile(
                  leading: Icon(
                      tipo == 'http' ? Icons.home_outlined : Icons.map_outlined,
                      color: Theme.of(context).primaryColor),
                  title: Text(scan[i].valor),
                  subtitle: Text(scan[i].id.toString()),
                  trailing: Icon(Icons.keyboard_arrow_right,
                      color: Theme.of(context).primaryColor),
                  onTap: () {
                    utils.launchURL(context, scan[i]);
                  }),
            ));
  }
}
