import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'recipe_model.dart';

class RecipeDetailScreen extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize controller only if videoUrl is not empty
    if (widget.recipe.videoUrl.isNotEmpty) {
      _controller = VideoPlayerController.network(widget.recipe.videoUrl)
        ..initialize().then((_) {
          setState(() {});
          _controller.play();
        });
    }
  }

  @override
  void dispose() {
    if (widget.recipe.videoUrl.isNotEmpty) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.recipe.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (widget.recipe.videoUrl.isNotEmpty && _controller.value.isInitialized)
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            else
              const Center(child: Text('No video available')),
            const SizedBox(height: 20),
            Text(widget.recipe.description),
            const SizedBox(height: 10),
            Text('Category: ${widget.recipe.category}', style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}