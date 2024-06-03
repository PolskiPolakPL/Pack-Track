import 'package:objectbox/objectbox.dart';

@Entity()
class Travel {
  @Id()
  int id = 0; // ObjectBox wymaga, aby pole ID było typu int i miało wartość domyślną 0.
  String name;

  @Backlink('travel')
  final luggages = ToMany<Luggage>();

  Travel({required this.name});
}

@Entity()
class Luggage {
  @Id()
  int id = 0; // ObjectBox wymaga, aby pole ID było typu int i miało wartość domyślną 0.
  String name;
  String type;
  String size;
  int color;

  @Backlink('luggage')
  final items = ToMany<Item>();

  final travel = ToOne<Travel>();

  Luggage({required this.name, required this.type, required this.size, required this.color});
}

@Entity()
class Item {
  @Id()
  int id = 0;
  String name;
  int quantity;
  bool oneWay;

  final luggage = ToOne<Luggage>();

  Item({required this.name, required this.quantity, this.oneWay = false});
}
