// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ImageEntity extends Equatable {
  final String? id;
  final String? url;
  final int? width;
  final int? height;

  const ImageEntity({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
  });

  @override
  List<Object?> get props => [id, url, width, height];
}
