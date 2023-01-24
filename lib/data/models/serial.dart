import 'package:flutter/material.dart';

@immutable
class Serial {
  final int id;
  final String title;
  final int price;

  const Serial({required this.id, required this.title, required this.price});

  // @override
  // int get hashCode => id;

  // @override
  // bool operator ==(Object other) => other is Serial && other.id == id;

  // Serial getById(int id) => Serial(id, itemNames[id % itemNames.length]);

  Serial copyWith({int? id, String? title, int? price}) {
    return Serial(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
    );
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ price.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Serial &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          price == other.price;

  // String get serialId => serial.map((e) => e.id).toList();;
}
