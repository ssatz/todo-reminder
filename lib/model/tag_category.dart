import 'dart:ui';
import 'package:flutter/material.dart';

class TagCategory {
  int id;
  String name;
  Color color;

  TagCategory({this.id, this.name, this.color});

  factory TagCategory.fromMap(Map<String, dynamic> json) => TagCategory(
        id: json["id"],
        name: json["name"],
        color: json["color"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "color": Color,
      };
}
