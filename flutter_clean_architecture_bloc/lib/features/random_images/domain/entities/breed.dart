// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class BreedEntity extends Equatable {
  final String? id;
  final String? name;
  final String? lifeSpan;
  final String? description;
  const BreedEntity({
    this.id,
    this.name,
    this.lifeSpan,
    this.description
  });
  
  @override
  List<Object?> get props {
    return [
      id,
      name,
      lifeSpan,
      description
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'life_span': lifeSpan,
      'description': description,
    };
  }

  factory BreedEntity.fromMap(Map<String, dynamic> map) {
    return BreedEntity(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      lifeSpan: map['life_span'] != null ? map['life_span'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BreedEntity.fromJson(String source) => BreedEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
