import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/domain/usecases/save_image.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/presentation/bloc/image/local/local_images_bloc.dart';
import 'package:flutter_clean_architecture_bloc/injection_container.dart';
import '../../data/models/breed.dart';
import '../../data/models/image.dart';
import '../../domain/entities/image.dart';

class ImageWidget extends StatelessWidget {
  final ImageEntity? image;
  const ImageWidget({
    super.key,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
          start: 14, end: 14, bottom: 7, top: 7),
      height: MediaQuery.of(context).size.width / 2.2,
      child: Row(
        children: [
          CachedImage(image: image),
          ImageInfo(image: image),
        ],
      ),
    );
  }
}

class ImageInfo extends StatelessWidget {
  const ImageInfo({
    super.key,
    required this.image,
  });

  final ImageEntity? image;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalImagesBloc, LocalImagesState>(
      builder: (context, state) {
        if (state is LocalImagesDone) {
          // Show Snackbar when image is saved successfully
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Image saved successfully'),
              duration: Duration(seconds: 2),
            ),
          );
        }
        return Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${image != null && image!.breeds != null ? image!.breeds![0].name : ""}",
                style: const TextStyle(
                  fontFamily: 'Butler',
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              Text(
                  'Life span: ${image != null && image!.breeds != null ? image!.breeds![0].lifeSpan : ""}'),
              Expanded(
                child: Text(
                  '${image != null && image!.breeds != null ? image!.breeds![0].description : ""}',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              GestureDetector(
                onTap: () {
                  sl<LocalImagesBloc>().add(SaveImage(image!));
                },
                child: const Icon(
                  Icons.favorite_outline,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    required this.image,
  });

  final ImageEntity? image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: CachedNetworkImage(
        imageUrl: image!.url!,
        imageBuilder: (context, imageProvider) => Container(
          padding: const EdgeInsetsDirectional.only(end: 14),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.08),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover)),
            ),
          ),
        ),
      ),
    );
  }
}
