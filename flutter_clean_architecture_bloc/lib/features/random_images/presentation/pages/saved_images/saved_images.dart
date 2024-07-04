

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/presentation/bloc/image/local/local_images_bloc.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/presentation/bloc/image/remote/remote_images_bloc.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/presentation/widgets/image_widget.dart';
import 'package:flutter_clean_architecture_bloc/injection_container.dart';

class SavedImages extends StatefulWidget {
  const SavedImages({super.key});

  @override
  State<SavedImages> createState() => _SavedImagesState();
}

class _SavedImagesState extends State<SavedImages> {

  @override
  void initState() {
    super.initState();
    sl<LocalImagesBloc>().add(const GetSavedImages());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'The Cats',
        style: TextStyle(color: Colors.black),
      )
    );
  }

  _buildBody(BuildContext context) {
    return BlocBuilder<LocalImagesBloc, LocalImagesState>(
      builder: (_, state) {
        if (state is LocalImagesLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is LocalImagesDone) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ImageWidget(image: state.images![index]);
            },
            itemCount: state.images!.length,
          );
        }
        return const SizedBox();
      },
    );
  }
}


