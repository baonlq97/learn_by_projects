// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/data/data_sources/local/image_converter.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/domain/entities/breed.dart';

class ImageEntity extends Equatable {
  final String? id;
  final String? url;
  final int? width;
  final int? height;
  @TypeConverters([ImageConverter])
  final List<BreedEntity>? breeds;
  // bool isSaved;

  ImageEntity({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
    required this.breeds,
  });

  @override
  List<Object?> get props => [id, url, width, height, breeds];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'url': url,
      'width': width,
      'height': height,
      'breeds': breeds!.map((x) => x.toMap()).toList(),
    };
  }

  factory ImageEntity.fromJson(Map<String, dynamic> map) {
    return ImageEntity(
      id: map['id'] != null ? map['id'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      width: map['width'] != null ? map['width'] as int : null,
      height: map['height'] != null ? map['height'] as int : null,
      breeds: List<BreedEntity>.from(
        (map['breeds'] as List<dynamic>).map<BreedEntity>(
          (x) => BreedEntity.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());
}
