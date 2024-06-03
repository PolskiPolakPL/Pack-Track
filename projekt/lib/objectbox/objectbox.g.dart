// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again
// with `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'models.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(1, 5989035304517861041),
      name: 'Item',
      lastPropertyId: const obx_int.IdUid(5, 8993984867510355278),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 7496177357581151607),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 4822760175045556779),
            name: 'name',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 732152797217805109),
            name: 'quantity',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 1344067265551087458),
            name: 'oneWay',
            type: 1,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 8993984867510355278),
            name: 'luggageId',
            type: 11,
            flags: 520,
            indexId: const obx_int.IdUid(1, 1741979378428645344),
            relationTarget: 'Luggage')
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(2, 341217097533485390),
      name: 'Luggage',
      lastPropertyId: const obx_int.IdUid(6, 1632054896012876160),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 6406651982188057810),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 7100658344631884249),
            name: 'name',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 2723212820540154915),
            name: 'type',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 3063555802910040739),
            name: 'size',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 5067581359994624677),
            name: 'color',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 1632054896012876160),
            name: 'travelId',
            type: 11,
            flags: 520,
            indexId: const obx_int.IdUid(2, 6913523058200672128),
            relationTarget: 'Travel')
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[
        obx_int.ModelBacklink(
            name: 'items', srcEntity: 'Item', srcField: 'luggage')
      ]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(3, 4601665463223228725),
      name: 'Travel',
      lastPropertyId: const obx_int.IdUid(2, 2924766414374412330),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 2663115861667685027),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 2924766414374412330),
            name: 'name',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[
        obx_int.ModelBacklink(
            name: 'luggages', srcEntity: 'Luggage', srcField: 'travel')
      ])
];

/// Shortcut for [obx.Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [obx.Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
Future<obx.Store> openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) async {
  await loadObjectBoxLibraryAndroidCompat();
  return obx.Store(getObjectBoxModel(),
      directory: directory ?? (await defaultStoreDirectory()).path,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [obx.Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(3, 4601665463223228725),
      lastIndexId: const obx_int.IdUid(2, 6913523058200672128),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    Item: obx_int.EntityDefinition<Item>(
        model: _entities[0],
        toOneRelations: (Item object) => [object.luggage],
        toManyRelations: (Item object) => {},
        getId: (Item object) => object.id,
        setId: (Item object, int id) {
          object.id = id;
        },
        objectToFB: (Item object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addInt64(2, object.quantity);
          fbb.addBool(3, object.oneWay);
          fbb.addInt64(4, object.luggage.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final quantityParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0);
          final oneWayParam =
              const fb.BoolReader().vTableGet(buffer, rootOffset, 10, false);
          final object = Item(
              name: nameParam, quantity: quantityParam, oneWay: oneWayParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          object.luggage.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0);
          object.luggage.attach(store);
          return object;
        }),
    Luggage: obx_int.EntityDefinition<Luggage>(
        model: _entities[1],
        toOneRelations: (Luggage object) => [object.travel],
        toManyRelations: (Luggage object) => {
              obx_int.RelInfo<Item>.toOneBacklink(
                      5, object.id, (Item srcObject) => srcObject.luggage):
                  object.items
            },
        getId: (Luggage object) => object.id,
        setId: (Luggage object, int id) {
          object.id = id;
        },
        objectToFB: (Luggage object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final typeOffset = fbb.writeString(object.type);
          final sizeOffset = fbb.writeString(object.size);
          fbb.startTable(7);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, typeOffset);
          fbb.addOffset(3, sizeOffset);
          fbb.addInt64(4, object.color);
          fbb.addInt64(5, object.travel.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final typeParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final sizeParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 10, '');
          final colorParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0);
          final object = Luggage(
              name: nameParam,
              type: typeParam,
              size: sizeParam,
              color: colorParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          object.travel.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 14, 0);
          object.travel.attach(store);
          obx_int.InternalToManyAccess.setRelInfo<Luggage>(
              object.items,
              store,
              obx_int.RelInfo<Item>.toOneBacklink(
                  5, object.id, (Item srcObject) => srcObject.luggage));
          return object;
        }),
    Travel: obx_int.EntityDefinition<Travel>(
        model: _entities[2],
        toOneRelations: (Travel object) => [],
        toManyRelations: (Travel object) => {
              obx_int.RelInfo<Luggage>.toOneBacklink(
                      6, object.id, (Luggage srcObject) => srcObject.travel):
                  object.luggages
            },
        getId: (Travel object) => object.id,
        setId: (Travel object, int id) {
          object.id = id;
        },
        objectToFB: (Travel object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(3);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final object = Travel(name: nameParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          obx_int.InternalToManyAccess.setRelInfo<Travel>(
              object.luggages,
              store,
              obx_int.RelInfo<Luggage>.toOneBacklink(
                  6, object.id, (Luggage srcObject) => srcObject.travel));
          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [Item] entity fields to define ObjectBox queries.
class Item_ {
  /// See [Item.id].
  static final id = obx.QueryIntegerProperty<Item>(_entities[0].properties[0]);

  /// See [Item.name].
  static final name = obx.QueryStringProperty<Item>(_entities[0].properties[1]);

  /// See [Item.quantity].
  static final quantity =
      obx.QueryIntegerProperty<Item>(_entities[0].properties[2]);

  /// See [Item.oneWay].
  static final oneWay =
      obx.QueryBooleanProperty<Item>(_entities[0].properties[3]);

  /// See [Item.luggage].
  static final luggage =
      obx.QueryRelationToOne<Item, Luggage>(_entities[0].properties[4]);
}

/// [Luggage] entity fields to define ObjectBox queries.
class Luggage_ {
  /// See [Luggage.id].
  static final id =
      obx.QueryIntegerProperty<Luggage>(_entities[1].properties[0]);

  /// See [Luggage.name].
  static final name =
      obx.QueryStringProperty<Luggage>(_entities[1].properties[1]);

  /// See [Luggage.type].
  static final type =
      obx.QueryStringProperty<Luggage>(_entities[1].properties[2]);

  /// See [Luggage.size].
  static final size =
      obx.QueryStringProperty<Luggage>(_entities[1].properties[3]);

  /// See [Luggage.color].
  static final color =
      obx.QueryIntegerProperty<Luggage>(_entities[1].properties[4]);

  /// See [Luggage.travel].
  static final travel =
      obx.QueryRelationToOne<Luggage, Travel>(_entities[1].properties[5]);

  /// see [Luggage.items]
  static final items = obx.QueryBacklinkToMany<Item, Luggage>(Item_.luggage);
}

/// [Travel] entity fields to define ObjectBox queries.
class Travel_ {
  /// See [Travel.id].
  static final id =
      obx.QueryIntegerProperty<Travel>(_entities[2].properties[0]);

  /// See [Travel.name].
  static final name =
      obx.QueryStringProperty<Travel>(_entities[2].properties[1]);

  /// see [Travel.luggages]
  static final luggages =
      obx.QueryBacklinkToMany<Luggage, Travel>(Luggage_.travel);
}
