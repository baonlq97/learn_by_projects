import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/image/local/local_images_bloc.dart';
import '../../data/models/breed.dart';
import '../../data/models/image.dart';
import '../../domain/entities/image.dart';

class SavedImageWidget extends StatelessWidget {
  final ImageEntity? image;
  const SavedImageWidget({
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
              context.read<LocalImagesBloc>().add(DeleteImage(image!));
            },
            child: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
        ],
      ),
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
