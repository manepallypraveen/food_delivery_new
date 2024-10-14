import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'cart_item_model.dart';

class CartDatabaseHelper {
  static final CartDatabaseHelper _instance = CartDatabaseHelper._internal();
  static Database? _database;

  CartDatabaseHelper._internal();

  factory CartDatabaseHelper() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    String path = join(await getDatabasesPath(), 'cart.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE cart(
        id INTEGER PRIMARY KEY,
        name TEXT,
        size TEXT,
        description TEXT,
        price TEXT,
        discount TEXT,
        calories TEXT,
        grams TEXT,
        proteins TEXT,
        fats TEXT,
        carbs TEXT,
        image TEXT,
        productType TEXT
      )
    ''');
  }

  Future<void> insertCartItem(CartItem item) async {
    final db = await database;
    await db.insert('cart', item.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<CartItem>> getCartItems() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('cart');
    return List.generate(maps.length, (i) {
      return CartItem(
        id: maps[i]['id'],
        name: maps[i]['name'],
        size: maps[i]['size'],
        description: maps[i]['description'],
        price: maps[i]['price'],
        discount: maps[i]['discount'],
        calories: maps[i]['calories'],
        grams: maps[i]['grams'],
        proteins: maps[i]['proteins'],
        fats: maps[i]['fats'],
        carbs: maps[i]['carbs'],
        image: maps[i]['image'],
        productType: maps[i]['productType'],
      );
    });
  }

  Future<String?> getItemSizeById(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'cart',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return maps[0]['size'];
    } else {
      return null;
    }
  }

  Future<void> deleteCartItem(int id) async {
    final db = await database;
    await db.delete('cart', where: 'id = ?', whereArgs: [id]);
  }

  void deleteFromCart(int id) async {
    final db = await CartDatabaseHelper().database;
    List<Map<String, dynamic>> existingItem = await db.query(
      'cart',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (existingItem.isNotEmpty) {
      await db.delete(
        'cart',
        where: 'id = ?',
        whereArgs: [id],
      );
    } else {
      print('Item does not exist in the cart');
    }
  }

  Future<void> clearCart() async {
    final db = await database;
    await db.delete('cart');
  }
}
