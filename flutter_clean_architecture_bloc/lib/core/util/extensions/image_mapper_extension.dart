import 'package:flutter_clean_architecture_bloc/features/random_images/data/models/breed.dart';

import 'breed_mapper_extension.dart';
import '../../../features/random_images/data/models/image.dart';
import '../../../features/random_images/domain/entities/image.dart';

// extension ImageModelMapper on ImageModel {
//   ImageEntity toEntity() {
//     return ImageEntity(
//         id: id,
//         url: url,
//         width: width,
//         height: height,
//         breeds: breeds!.map((breed) => (breed as BreedModel).toEntity()).toList());
//   }
// }

// extension ImageEntityMapper on ImageEntity {
//   ImageModel toModel() {
//     return ImageModel(
//       id: id,
//       url: url,
//       width: null,
//       height: null,
//       breeds: breeds!.map((breed) => breed.toModel()).toList(),
//     );
//   }
// }
