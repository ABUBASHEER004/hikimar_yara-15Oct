import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../data/sample_stories.dart';
import '../../models/story.dart';
import '../story/story_details_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();

  List<Story> results = stories;

  void search(String value) {
    final query = value.trim().toLowerCase();

    setState(() {
      if (query.isEmpty) {
        results = stories;
        return;
      }

      results = stories.where((story) {
        final searchableText = [
          story.title,
          story.englishTitle,
          story.description,
          story.englishDescription,
          story.category,
        ].join(' ').toLowerCase();

        return searchableText.contains(query);
      }).toList();
    });
  }

  void clearSearch() {
    controller.clear();
    search('');
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasQuery = controller.text.trim().isNotEmpty;

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        elevation: 0,
        titleSpacing: 18,
        title: const Text(
          'Bincika Labarai',
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
      ),

      body: Column(
        children: [
          // Search area
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 8, 18, 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 18,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: TextField(
                controller: controller,
                autofocus: true,
                onChanged: search,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: 'Rubuta Hausa ko English…',
                  hintStyle: const TextStyle(
                    color: AppColors.muted,
                    fontSize: 14,
                  ),
                  prefixIcon: const Icon(
                    Icons.search_rounded,
                    color: AppColors.primary,
                  ),
                  suffixIcon: hasQuery
                      ? IconButton(
                          tooltip: 'Clear search',
                          onPressed: clearSearch,
                          icon: const Icon(
                            Icons.clear_rounded,
                          ),
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 17,
                  ),
                ),
              ),
            ),
          ),

          // Result count
          if (hasQuery)
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 18, 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${results.length} ${results.length == 1 ? 'story' : 'stories'} found',
                  style: const TextStyle(
                    color: AppColors.muted,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),

          // Results
          Expanded(
            child: results.isEmpty
                ? _buildEmptyState()
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(
                      18,
                      0,
                      18,
                      35,
                    ),
                    itemCount: results.length,
                    separatorBuilder: (_, __) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final story = results[index];

                      return _buildStoryTile(
                        context,
                        story,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoryTile(
    BuildContext context,
    Story story,
  ) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => StoryDetailsScreen(
                story: story,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              // Story image
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  story.image,
                  width: 78,
                  height: 78,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return Container(
                      width: 78,
                      height: 78,
                      color: AppColors.background,
                      child: const Icon(
                        Icons.auto_stories_rounded,
                        color: AppColors.primary,
                        size: 30,
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(width: 13),

              // Story information
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      story.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      story.englishTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 7),

                    Row(
                      children: [
                        Flexible(
                          child: _infoChip(
                            Icons.category_outlined,
                            story.category,
                          ),
                        ),

                        const SizedBox(width: 8),

                        _infoChip(
                          Icons.schedule_rounded,
                          story.duration,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 6),

              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.muted,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoChip(
    IconData icon,
    String label,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 13,
          color: AppColors.muted,
        ),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            label,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.muted,
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 105,
              height: 105,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(
                  alpha: 0.08,
                ),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.menu_book_outlined,
                size: 52,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Ba a sami labari ba',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w900,
              ),
            ),

            const SizedBox(height: 7),

            const Text(
              'No story found',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Gwada wani suna, category, ko kalma a Hausa ko English.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.muted,
                height: 1.5,
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 20),

            OutlinedButton.icon(
              onPressed: clearSearch,
              icon: const Icon(
                Icons.refresh_rounded,
              ),
              label: const Text(
                'Show all stories',
              ),
            ),
          ],
        ),
      ),
    );
  }
}