import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SavedImages extends StatelessWidget {
  const SavedImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'The Saved Cats',
        style: TextStyle(color: Colors.black),
      )
    );
  }
}