import 'package:contacts/model/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class ContactRepository {
  // this is how we implement a singleton in dart
  static final ContactRepository instance = ContactRepository.internal();
  factory ContactRepository() => instance;
  ContactRepository.internal();
  final String tableName = "contact";

  // underscore at the begining makes the variable private
  Database _db;
  Future<Database> get db async {
    if (_db != null)
      return _db;
    else
      return _db = await init();
  }

  // creates and/or returns our database and table
  Future<Database> init() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "contacts.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      String sql =
          "CREATE TABLE $tableName (id INTEGER PRIMARY KEY, name TEXT, email TEXT, phone TEXT, imgPath TEXT);";
      await db.execute(sql);
    });
  }

  // close our DB connection
  Future close() async {
    Database dbContact = await db;
    dbContact.close();
  }

  Future<Contact> save(Contact contact) async {
    // "db" is a get db function declared above
    Database dbContact = await db;
    // returns the inserted id
    contact.id = await dbContact.insert(tableName, contact.toMap());
    return contact;
  }

  Future<Contact> getById(int id) async {
    Database dbContact = await db;
    List<Map> rows = await dbContact.query(tableName,
        columns: ["id", "name", "email", "phone", "imgPath"],
        where: "id = ?",
        whereArgs: [id]);
    if (rows.length > 0) {
      return Contact.fromMap(rows.first);
    }
  }

  Future<int> delete(int id) async {
    Database dbContact = await db;
    await dbContact.delete(tableName, where: "id = ?", whereArgs: [id]);
  }

  Future<int> update(Contact contact) async {
    Database dbContact = await db;
    return await dbContact.update(tableName, contact.toMap(),
        where: "id = ?", whereArgs: [contact.id]);
  }

  Future<List<Contact>> getAll() async {
    Database dbContact = await db;
    /*
    List<Map> rows = await dbContact.query(tableName, 
      columns: ["id", "name", "email", "phone", "imgPath"], 
    );
    */
    List<Map> rows = await dbContact.rawQuery("SELECT * FROM $tableName;");
    if (rows.length > 0) {
      return rows.map((map) => Contact.fromMap(map)).toList();
    }
    return null;
  }

  Future<int> count() async {
    Database dbContact = await db;
    return Sqflite.firstIntValue(
        await dbContact.rawQuery("SELECT COUNT(id) FROM $tableName;"));
  }
}
