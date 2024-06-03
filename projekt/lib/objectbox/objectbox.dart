import 'package:objectbox/objectbox.dart';
import 'models.dart';
import 'objectbox.g.dart'; // Importuj wygenerowany plik

class ObjectBox {
  late final Store store;

  late final Box<Luggage> luggageBox;
  late final Box<Item> itemBox;

  ObjectBox._create(this.store) {
    luggageBox = Box<Luggage>(store);
    itemBox = Box<Item>(store);
  }

  /// Utwórz i otwórz store
  static Future<ObjectBox> create() async {
    final store = await openStore();
    return ObjectBox._create(store);
  }
}
