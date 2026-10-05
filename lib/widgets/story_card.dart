import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/constants/app_colors.dart';
import '../models/story.dart';
import '../providers/favorites_provider.dart';
import '../screens/story/story_details_screen.dart';

class StoryCard extends StatelessWidget {
  final Story story;
  const StoryCard({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<FavoritesProvider>();
    final favorite = favorites.isFavorite(story.id);
    return SizedBox(
      width: 252,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => StoryDetailsScreen(story: story))),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(children: [
              Hero(tag: 'story-${story.id}', child: Image.asset(story.image, height: 155, width: double.infinity, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(height: 155, color: AppColors.primary.withValues(alpha: .08), child: const Icon(Icons.auto_stories_rounded, size: 54, color: AppColors.primary)))),
              Positioned(top: 12, left: 12, child: Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: Colors.black.withValues(alpha: .58), borderRadius: BorderRadius.circular(30)), child: Text(story.category, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700)))),
              Positioned(top: 8, right: 8, child: Material(color: Colors.white.withValues(alpha: .92), shape: const CircleBorder(), child: IconButton(icon: Icon(favorite ? Icons.favorite_rounded : Icons.favorite_border_rounded, color: favorite ? Colors.red : AppColors.ink, size: 19), onPressed: () => favorites.toggleFavorite(story.id)))),
            ]),
            Expanded(child: Padding(padding: const EdgeInsets.fromLTRB(15, 13, 15, 12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(story.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w900, height: 1.1)),
              const SizedBox(height: 7),
              Text(story.description, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(color: AppColors.muted, fontSize: 12, height: 1.35)),
              const Spacer(),
              Row(children: [const Icon(Icons.schedule_rounded, size: 15, color: AppColors.primary), const SizedBox(width: 5), Text(story.duration, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700)), const Spacer(), const Icon(Icons.headphones_rounded, size: 16, color: AppColors.secondary), const SizedBox(width: 5), const Text('HA / EN', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: AppColors.muted))]),
            ]))),
          ]),
        ),
      ),
    );
  }
}
