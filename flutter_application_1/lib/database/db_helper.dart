import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/product.dart';
class DBHelper {
 DBHelper._(); static final DBHelper instance=DBHelper._(); static Database? _db;
 Future<Database> get database async => _db ??= await _open();
 Future<Database> _open() async { final p=join(await getDatabasesPath(),'smart_cart.db'); return openDatabase(p,version:1,onCreate:(db,v) async { await db.execute('CREATE TABLE master_products (id TEXT PRIMARY KEY, name TEXT, price REAL, description TEXT)'); await db.execute('CREATE TABLE local_cart (id TEXT PRIMARY KEY, product_id TEXT, name TEXT, price REAL, quantity INTEGER)'); }); }
 Future<int> insertProduct(Product p) async => (await database).insert('master_products',p.toMap(),conflictAlgorithm:ConflictAlgorithm.replace);
 Future<List<Product>> getProducts() async => (await (await database).query('master_products',orderBy:'name COLLATE NOCASE')).map(Product.fromMap).toList();
 Future<int> insertCart(Product p,{int quantity=1}) async => (await database).insert('local_cart',{'id':p.id,'product_id':p.id,'name':p.name,'price':p.price.toDouble(),'quantity':quantity},conflictAlgorithm:ConflictAlgorithm.replace);
 Future<List<Map<String,Object?>>> getCartItems() async => (await database).query('local_cart');
 Future<int> updateCartQuantity(String id,int q) async => (await database).update('local_cart',{'quantity':q},where:'id = ?',whereArgs:[id]);
 Future<int> deleteCartItem(String id) async => (await database).delete('local_cart',where:'id = ?',whereArgs:[id]);
}
