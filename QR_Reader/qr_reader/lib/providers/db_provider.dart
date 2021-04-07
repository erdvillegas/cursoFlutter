import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:qr_reader/models/scan_model.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');
    print(path);

    // crear BD
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE Scans(
        id INTEGER PRIMARY KEY,
        tipo TEXT,
        valor TEXT
      )''');
    });
  }

  // metodo RAW
  nuevoScanRaw(ScanModel nuevoScan) async {
    // Verifica la base de datos
    final db = await database;

    final id = nuevoScan.id;
    final tipo = nuevoScan.tipo;
    final valor = nuevoScan.valor;

    final res = await db.rawInsert('''
    INSERT INTO Scans( id, tipo, valor )
      VALUES( $id, '$tipo', '$valor')
    ''');

    return res;
  }

  // metodo ORM
  Future<int> nuevoScan(ScanModel nuevoScan) async {
    // Verifica la base de datos
    final db = await database;
    final res = await db.insert('Scans', nuevoScan.toJson());

    return res;
  }

  Future<ScanModel> getScanById(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<ScanModel> getScans(int id) async {
    final db = await database;
    final res = await db.query('Scans');

    return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
  }

  Future<ScanModel> getScansPorTypo(String tipo) async {
    final db = await database;
    final res = await db.rawQuery('''
      SELECT * FROM Scans WHERE tipo = '$tipo'
    ''');

    return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
  }
}
