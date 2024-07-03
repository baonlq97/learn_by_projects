import 'dart:convert';

import 'package:floor/floor.dart';
import '../../models/breed.dart';
import '../../../domain/entities/breed.dart';

class ImageConverter extends TypeConverter<List<BreedModel>?, String> {
  @override
  List<BreedModel>? decode(String databaseValue) {
    final List<dynamic> jsonList = json.decode(databaseValue);
    return jsonList
        .map((json) => BreedModel(
            id: json['id'],
            name: json['name'],
            lifeSpan: json['life_span'],
            description: json['description']))
        .toList();
  }

  @override
  String encode(List<BreedModel>? value) {
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
