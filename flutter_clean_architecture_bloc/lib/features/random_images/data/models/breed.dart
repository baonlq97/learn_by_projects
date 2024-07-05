// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/domain/entities/breed.dart';

class BreedModel extends BreedEntity {
  const BreedModel({
    required super.id,
    required super.name,
    required super.lifeSpan,
    required super.description,
  });

  factory BreedModel.fromEntity(BreedEntity entity) {
    return BreedModel(
      id: entity.id,
      name: entity.name,
      lifeSpan: entity.lifeSpan,
      description: entity.description,
    );
  }

  BreedEntity toEntity() {
    return BreedEntity(
      id: id,
      name: name,
      lifeSpan: lifeSpan,
      description: description,
    );
  }
}
