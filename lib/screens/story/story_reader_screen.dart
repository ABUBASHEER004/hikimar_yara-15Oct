import 'package:flutter/material.dart';

import '../../models/story.dart';

class StoryReaderScreen extends StatelessWidget {
  final Story story;

  const StoryReaderScreen({
    super.key,
    required this.story,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(story.title),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: SingleChildScrollView(
          child: SelectableText(
            story.content,
            style: const TextStyle(
              fontSize: 20,
              height: 1.8,
            ),
          ),
        ),
      ),
    );
  }
}