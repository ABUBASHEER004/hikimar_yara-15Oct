import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../data/category_data.dart';
import '../../data/sample_stories.dart';
import '../../models/story.dart';
import '../../screens/search/search_screen.dart';
import '../../widgets/category_card.dart';
import '../../widgets/greeting_header.dart';
import '../../widgets/search_bar_widget.dart';
import '../../widgets/section_title.dart';
import '../../widgets/story_card.dart';
import '../story/story_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'All';

  List<Story> get filteredStories {
    if (selectedCategory == 'All') {
      return stories;
    }

    return stories
        .where((story) => story.category == selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final featured = stories.isNotEmpty ? stories.first : null;

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            setState(() {});
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(18, 16, 18, 110),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GreetingHeader(),

                const SizedBox(height: 20),

                // Search
                InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SearchScreen(),
                      ),
                    );
                  },
                  child: const IgnorePointer(
                    child: SearchBarWidget(),
                  ),
                ),

                const SizedBox(height: 23),

                // Featured story
                if (featured != null) _hero(context, featured),

                const SizedBox(height: 28),

                // Categories
                const SectionTitle(
                  title: 'Explore categories',
                  subtitle: 'Hausa culture, faith, character and fun',
                ),

                const SizedBox(height: 13),

                SizedBox(
                  height: 135,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CategoryCard(
                        icon: Icons.auto_stories_rounded,
                        title: 'Duka',
                        subtitle: 'All stories',
                        color: AppColors.primary,
                        isSelected: selectedCategory == 'All',
                        onTap: () {
                          setState(() {
                            selectedCategory = 'All';
                          });
                        },
                      ),

                      ...categories.map(
                        (category) => CategoryCard(
                          icon: category.icon,
                          title: category.title,
                          subtitle: category.subtitle,
                          color: category.color,
                          isSelected:
                              selectedCategory == category.title,
                          onTap: () {
                            setState(() {
                              selectedCategory = category.title;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 28),

                // Stories
                SectionTitle(
                  title: selectedCategory == 'All'
                      ? 'Sabbin labarai'
                      : selectedCategory,
                  subtitle:
                      '${filteredStories.length} stories • Hausa + English',
                ),

                const SizedBox(height: 13),

                if (filteredStories.isEmpty)
                  _emptyCategoryState()
                else
                  SizedBox(
                    height: 310,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: filteredStories.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(width: 14),
                      itemBuilder: (_, index) {
                        return SizedBox(
                          width: 205,
                          child: StoryCard(
                            story: filteredStories[index],
                          ),
                        );
                      },
                    ),
                  ),

                const SizedBox(height: 28),

                // Bilingual learning section
                const SectionTitle(
                  title: 'Learn while you listen',
                  subtitle: 'Read it, hear it, remember it',
                ),

                const SizedBox(height: 13),

                _learningBanner(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _hero(BuildContext context, Story story) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => StoryDetailsScreen(story: story),
          ),
        );
      },
      child: Container(
        height: 225,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.18),
              blurRadius: 25,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Story image
            Image.asset(
              story.image,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) {
                return Container(
                  color: AppColors.primary.withValues(alpha: 0.15),
                  child: const Center(
                    child: Icon(
                      Icons.auto_stories_rounded,
                      size: 60,
                      color: AppColors.primary,
                    ),
                  ),
                );
              },
            ),

            // Dark overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.05),
                    Colors.black.withValues(alpha: 0.82),
                  ],
                ),
              ),
            ),

            // Content
            Positioned(
              left: 20,
              right: 20,
              bottom: 18,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'LABARIN YAU • STORY OF THE DAY',
                    style: TextStyle(
                      color: Color(0xffFDE68A),
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.2,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    story.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    story.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      height: 1.35,
                    ),
                  ),

                  const SizedBox(height: 9),

                  Row(
                    children: [
                      const Icon(
                        Icons.play_circle_fill_rounded,
                        color: Colors.white,
                        size: 22,
                      ),
                      const SizedBox(width: 6),
                      Flexible(
                        child: Text(
                          'Read & listen • ${story.duration}',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _learningBanner() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary,
            AppColors.primary.withValues(alpha: 0.82),
          ],
        ),
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.18),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.record_voice_over_rounded,
            color: Colors.white,
            size: 34,
          ),

          SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bilingual learning',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                SizedBox(height: 4),

                Text(
                  'Switch between Hausa and English while reading or listening. Great for language growth.',
                  style: TextStyle(
                    color: Colors.white70,
                    height: 1.35,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _emptyCategoryState() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 35,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.12),
        ),
      ),
      child: const Column(
        children: [
          Icon(
            Icons.auto_stories_outlined,
            size: 48,
            color: AppColors.primary,
          ),

          SizedBox(height: 12),

          Text(
            'Babu labarai tukuna',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),

          SizedBox(height: 6),

          Text(
            'More stories are coming soon.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.muted,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}