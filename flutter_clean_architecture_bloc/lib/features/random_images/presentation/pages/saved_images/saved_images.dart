import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/image/local/local_images_bloc.dart';
import '../../bloc/image/remote/remote_images_bloc.dart';
import '../../widgets/image_widget.dart';
import '../../widgets/saved_imaged_widget.dart';
import '../../../../../injection_container.dart';

class SavedImages extends StatefulWidget {
  const SavedImages({super.key});

  @override
  State<SavedImages> createState() => _SavedImagesState();
}

class _SavedImagesState extends State<SavedImages> {
  @override
  void initState() {
    super.initState();
    context.read<LocalImagesBloc>().add(const GetSavedImages());
  }

  // @override
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
    ));
  }

  _buildBody(BuildContext context) {
    return BlocBuilder<LocalImagesBloc, LocalImagesState>(
      builder: (_, state) {
        if (state is LocalImagesLoading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state is LocalImagesDone) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return SavedImageWidget(image: state.images![index]);
            },
            itemCount: state.images!.length,
          );
        }
        else if (state is LocalImageDeleteSuccessfully) {
          context.read<LocalImagesBloc>().add(const GetSavedImages());
        }
        return const SizedBox();
      },
    );
  }
}
