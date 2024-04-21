// import 'dart:ffi';

// import 'package:flutter_spotify_ui/data/hive/func/hive_func.dart';
// import 'package:flutter_spotify_ui/models/class/economy_class.dart';
// import 'package:flutter_spotify_ui/models/class/part_time__class.dart';
// import 'package:flutter_spotify_ui/models/enum/part_time__enum.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class EconomyRepo {
//   late Box<EconomyElement> boxEconomy;

//   static const String _boxEconomy = 'boxEconomy';

//   Future init() async {
//     if (!Hive.isAdapterRegistered(0)) {
//       Hive.registerAdapter(EconomyElementAdapter());
//       if (!Hive.isAdapterRegistered(2)) {
//         Hive.registerAdapter(PartTimeAdapter());
//       }
//       if (!Hive.isAdapterRegistered(3)) {
//         Hive.registerAdapter(PartTimeEnumAdapter());
//       }
//       boxEconomy = await Hive.openBox<EconomyElement>(_boxEconomy);
//     }
//   }

//   Future wipe() async {
//     await Hive.deleteBoxFromDisk(_boxEconomy);
//     boxEconomy = await Hive.openBox<EconomyElement>(_boxEconomy);
//   }

//   List<EconomyElement> get() {
//     // List<EconomyElement> get({DateTime? dateFilter}) {

//     // if (dateFilter != null) {
//     //   return moneyBox.values
//     //       .where((money) => money.wastedDate.month == dateFilter.month)
//     //       .toList();
//     // }
//     return boxEconomy.values.toList();
//   }

//   Future<bool> add({
//     required EconomyElement element,
//   }) async {
//     return (await boxEconomy.add(element)) != -1;
//   }

//   Future edit({
//     required EconomyElement element,
//     // required int index,
//   }) async {}

//   Future<bool> delete({
//     required String id,
//   }) async {
//     final indexElement = getIndex(id: id, box: boxEconomy);
//     await boxEconomy.deleteAt(indexElement);
//     return true;
//   }
// }
