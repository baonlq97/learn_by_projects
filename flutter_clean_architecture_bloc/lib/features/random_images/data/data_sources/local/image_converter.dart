import 'dart:convert';

import 'package:floor/floor.dart';
import '../../models/breed.dart';
import '../../../domain/entities/breed.dart';

class ImageConverter extends TypeConverter<List<BreedEntity>?, String> {
  @override
  List<BreedEntity>? decode(String databaseValue) {
    final List<dynamic> jsonList = json.decode(databaseValue);
    return jsonList
        .map((json) => BreedEntity(
            id: json['id'],
            name: json['name'],
            lifeSpan: json['life_span'],
            description: json['description']))
        .toList();
  }

  @override
  String encode(List<BreedEntity>? value) {
    return json.encode(value!
        .map((e) => {
              'id': e.id,
              'name': e.name,
              'life_span': e.lifeSpan,
              'description': e.description
            })
        .toList());
  }
}
