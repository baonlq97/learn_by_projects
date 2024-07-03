// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:flutter_clean_architecture_bloc/core/util/extensions/breed_mapper_extension.dart';

import 'package:flutter_clean_architecture_bloc/features/random_images/data/data_sources/local/image_converter.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/data/models/breed.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/domain/entities/image.dart';

@Entity(tableName: 'images', primaryKeys: ['id'])
@TypeConverters([ImageConverter])
class ImageModel extends Equatable {
  final String? id;
  final String? url;
  final int? width;
  final int? height;
  final List<BreedModel>? breeds;

  const ImageModel({
    this.id,
    this.url,
    this.width,
    this.height,
    required this.breeds,
  });

  @override
  List<Object> get props {
    return [
      id!,
      url!,
      width!,
      height!,
      breeds!,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'url': url,
      'width': width,
      'height': height,
      'breeds': breeds?.map((x) => x.toMap()).toList(),
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      id: map['id'] != null ? map['id'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      width: map['width'] != null ? map['width'] as int : null,
      height: map['height'] != null ? map['height'] as int : null,
      breeds: map['breeds'] != null
        ? (map['breeds'] as List<dynamic>)
            .map((breed) => BreedModel.fromMap(breed as Map<String, dynamic>))
            .toList()
        : null,
    );
  }

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      ImageModel.fromMap(json);
  

  String toJson() => json.encode(toMap());
}
