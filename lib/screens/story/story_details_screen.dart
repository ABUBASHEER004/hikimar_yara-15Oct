import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../models/story.dart';
import '../../providers/favorites_provider.dart';
import 'story_reader_screen.dart';

class StoryDetailsScreen extends StatelessWidget {
  final Story story;
  const StoryDetailsScreen({super.key, required this.story});
  @override
  Widget build(BuildContext context) {
    final favorite = context.watch<FavoritesProvider>().isFavorite(story.id);
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(expandedHeight: 310, pinned: true, backgroundColor: AppColors.primary, foregroundColor: Colors.white, actions: [IconButton(onPressed: () => context.read<FavoritesProvider>().toggleFavorite(story.id), icon: Icon(favorite ? Icons.favorite_rounded : Icons.favorite_border_rounded))], flexibleSpace: FlexibleSpaceBar(background: Stack(fit: StackFit.expand, children: [Hero(tag: 'story-${story.id}', child: Image.asset(story.image, fit: BoxFit.cover)), Container(decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, Colors.black.withValues(alpha: .72)]))), Positioned(left: 20, right: 20, bottom: 22, child: Text(story.title, style: const TextStyle(color: Colors.white, fontSize: 27, fontWeight: FontWeight.w900)))]))),
        SliverToBoxAdapter(child: Padding(padding: const EdgeInsets.fromLTRB(20, 20, 20, 35), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Wrap(spacing: 8, runSpacing: 8, children: [Chip(avatar: const Icon(Icons.category_rounded, size: 15), label: Text(story.category)), Chip(avatar: const Icon(Icons.schedule_rounded, size: 15), label: Text(story.duration)), Chip(avatar: const Icon(Icons.child_care_rounded, size: 15), label: Text(story.ageRange))]),
          const SizedBox(height: 18),
          Text(story.description, style: const TextStyle(fontSize: 16, height: 1.55, color: AppColors.muted)),
          const SizedBox(height: 22),
          Container(padding: const EdgeInsets.all(17), decoration: BoxDecoration(color: AppColors.secondary.withValues(alpha: .12), borderRadius: BorderRadius.circular(20), border: Border.all(color: AppColors.secondary.withValues(alpha: .25))), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [const Icon(Icons.lightbulb_rounded, color: AppColors.secondary), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('DARASI • LESSON', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: AppColors.secondary, letterSpacing: 1)), const SizedBox(height: 5), Text(story.lesson, style: const TextStyle(fontWeight: FontWeight.w800, height: 1.4))]))])),
          const SizedBox(height: 24),
          Row(children: [Expanded(child: FilledButton.icon(style: FilledButton.styleFrom(backgroundColor: AppColors.primary, minimumSize: const Size.fromHeight(56), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => StoryReaderScreen(story: story))), icon: const Icon(Icons.menu_book_rounded), label: const Text('Read story'))), const SizedBox(width: 12), IconButton.filledTonal(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => StoryReaderScreen(story: story, startListening: true))), icon: const Icon(Icons.headphones_rounded), iconSize: 28, padding: const EdgeInsets.all(15))]),
        ]))),
      ]),
    );
  }
}
