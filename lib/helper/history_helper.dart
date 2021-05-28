import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String historyTABLE = "historyTABLE";
final String idColumn = "idColumn";
final String dataColumn = "dataColumn";
final String valueColumn = "valueColumn";
final String tipeColumn = "tipeColumn";
final String descriptionColumn = "descriptionColumn";

class HistoryHelper {
  static final HistoryHelper _instance = HistoryHelper.internal();

  factory HistoryHelper() => _instance;

  HistoryHelper.internal();

  Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "history.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute("CREATE TABLE $historyTABLE(" +
          "$idColumn INTEGER PRIMARY KEY," +
          "$valueColumn FLOAT," +
          "$dataColumn TEXT," +
          "$tipeColumn TEXT," +
          "$descriptionColumn TEXT)");
    });
  }

  Future<History> saveHistory(History history) async {
    print("save");
    Database dbHistory = await db;
    history.id = await dbHistory.insert(historyTABLE, history.toMap());
    return history;
  }

  Future<History> getHistory(int id) async {
    Database dbHistory = await db;
    List<Map> maps = await dbHistory.query(historyTABLE,
        columns: [
          idColumn,
          valueColumn,
          dataColumn,
          tipeColumn,
          descriptionColumn
        ],
        where: "$idColumn =?",
        whereArgs: [id]);

    if (maps.length > 0) {
      return History.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteHistory(History history) async {
    Database dbHistory = await db;
    return await dbHistory
        .delete(historyTABLE, where: "$idColumn =?", whereArgs: [history.id]);
  }

  Future<int> updateHistory(History history) async {
    print("update");
    print(history.toString());
    Database dbHistory = await db;
    return await dbHistory.update(historyTABLE, history.toMap(),
        where: "$idColumn =?", whereArgs: [history.id]);
  }

  Future<List> getAllHistory() async {
    Database dbHistory = await db;
    List listMap = await dbHistory.rawQuery("SELECT * FROM $historyTABLE");
    List<History> listHistory = List();

    for (Map m in listMap) {
      listHistory.add(History.fromMap(m));
    }
    return listHistory;
  }

  Future<List> getAllHistoryForMe(String data) async {
    Database dbHistory = await db;
    List listMap = await dbHistory.rawQuery(
        "SELECT * FROM $historyTABLE WHERE $dataColumn LIKE '%$data%'");
    List<History> listHistory = List();

    for (Map m in listMap) {
      listHistory.add(History.fromMap(m));
    }
    return listHistory;
  }

  Future<List> getAllHistoryForTipe(String tipo) async {
    Database dbHistory = await db;
    List listMap = await dbHistory
        .rawQuery("SELECT * FROM $historyTABLE WHERE $tipeColumn ='$tipo' ");
    List<History> listHistory = List();

    for (Map m in listMap) {
      listHistory.add(History.fromMap(m));
    }
    return listHistory;
  }

  Future<int> getNumber() async {
    Database dbHistory = await db;
    return Sqflite.firstIntValue(
        await dbHistory.rawQuery("SELECT COUNT(*) FROM $historyTABLE"));
  }

  Future close() async {
    Database dbHistory = await db;
    dbHistory.close();
  }
}

class History {
  int id;
  String data;
  double value;
  String tipe;
  String description;

  History();

  History.fromMap(Map map) {
    id = map[idColumn];
    value = map[valueColumn];
    data = map[dataColumn];
    tipe = map[tipeColumn];
    description = map[descriptionColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      valueColumn: value,
      dataColumn: data,
      tipeColumn: tipe,
      descriptionColumn: description,
    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }

  String toString() {
    return "History(id: $id, valor: $value, data: $data, tipo: $tipe, desc: $description, )";
  }
}
