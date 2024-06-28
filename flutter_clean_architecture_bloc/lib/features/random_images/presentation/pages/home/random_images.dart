// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/presentation/bloc/image/remote/remote_images_bloc.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/presentation/widgets/image_widget.dart';

class RandomImages extends StatelessWidget {
  const RandomImages({super.key});

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
      ),
      actions: [
          GestureDetector(
            onTap: () => _onShowSavedArticlesViewTapped(context),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Icon(Icons.bookmark, color: Colors.black),
            ),
          ),
        ],
    );
  }

  _buildBody(BuildContext context) {
    return BlocBuilder<RemoteImagesBloc, RemoteImagesState>(
      builder: (_, state) {
        if (state is RemoteImagesLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteImagesError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteImagesDone) {
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
  
  _onShowSavedArticlesViewTapped(context) {
    Navigator.pushNamed(context, '/saved_images');
  }
}


