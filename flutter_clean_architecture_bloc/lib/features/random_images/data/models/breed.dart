// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

import 'package:flutter_clean_architecture_bloc/features/random_images/domain/entities/breed.dart';

class BreedModel extends Equatable {
  final String? id;
  final String? name;
  final String? lifeSpan;
  final String? description;
  const BreedModel({
    this.id,
    this.name,
    this.lifeSpan,
    this.description,
  });

  @override
  List<Object> get props => [id!, name!, lifeSpan!, description!];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'lifeSpan': lifeSpan,
      'description': description,
    };
  }

  factory BreedModel.fromMap(Map<String, dynamic> map) {
    return BreedModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      lifeSpan: map['lifeSpan'] != null ? map['lifeSpan'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BreedModel.fromJson(String source) =>
      BreedModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
