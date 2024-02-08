import 'package:app_notification/modal.dart/newplace.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart' as path;

Future<Database> _createDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(
    path.join(dbPath, 'product.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE products_list(id TEXT PRIMARY KEY,title TEXT,price TEXT,quantity TEXT)');
    },
    version: 1,
  );
  return db;
}

class Products extends StateNotifier<List<Plase>> {
  Products() : super(const []);

  Future<void> loadPlaces() async {
    final db = await _createDatabase();
    final data = await db.query('products_list');
    final products = data
        .map((row) => Plase(
              id: row['id'] as String,
              title: row['title'] as String,
              price: row['price'] as String, // Corrected 'price' from 'Price'
              quantity: row['quantity'] as String,
            ))
        .toList();
    state = products;
  }

  Future<void> addPlace(String title, String price, String quantity) async {
    final newProduct = Plase(title: title, price: price, quantity: quantity);
    final db = await _createDatabase();

    await db.insert('products_list', {
      'id': newProduct.id,
      'title': newProduct.title,
      'price': newProduct.price,
      'quantity': newProduct.quantity,
    });
    state = [newProduct, ...state];
  }

  Future<void> Updateplace(String title, String price, String quantity) async {
    final UpdateProduct = Plase(title: title, price: price, quantity: quantity);
    final db = await _createDatabase();

    await db.update('products_list', {
      'id': UpdateProduct.id,
      'title': UpdateProduct.title,
      'price': UpdateProduct.price,
      'quantity': UpdateProduct.quantity,
    });
    state = [UpdateProduct, ...state];
  }
}

final productsListProvider =
    StateNotifierProvider<Products, List<Plase>>((ref) => Products());
