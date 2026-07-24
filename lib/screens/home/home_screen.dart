import 'package:flutter/material.dart';

import '../../data/category_data.dart';
import '../../data/sample_stories.dart';
import '../../models/story.dart';
import '../../screens/search/search_screen.dart';
import '../../widgets/category_card.dart';
import '../../widgets/greeting_header.dart';
import '../../widgets/search_bar_widget.dart';
import '../../widgets/section_title.dart';
import '../../widgets/story_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = "All";

  final ScrollController _storiesController = ScrollController();
final ScrollController _categoriesController = ScrollController();

@override
void dispose() {
  _storiesController.dispose();
  _categoriesController.dispose();
  super.dispose();
}


  List<Story> get filteredStories {
  final list = selectedCategory == "All"
      ? stories
      : stories.where((s) => s.category == selectedCategory).toList();

  final seen = <String>{};

  return list.where((story) {
    return seen.add(story.title);
  }).toList();
}

  Future<void> refreshStories() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FFF8),

      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: refreshStories,

          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const GreetingHeader(),

                const SizedBox(height: 25),

                InkWell(
                  borderRadius: BorderRadius.circular(16),
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

                const SizedBox(height: 30),

                const SectionTitle(title: "Categories"),

                const SizedBox(height: 15),

                SizedBox(
  height: 140,

  child: ListView(
  controller: _categoriesController,
  scrollDirection: Axis.horizontal,
  physics: const BouncingScrollPhysics(),

    children: [

      CategoryCard(
        emoji: "📚",
        title: "All",
        isSelected: selectedCategory == "All",
        onTap: () {
          setState(() {
            selectedCategory = "All";
          });
        },
      ),

      ...categories.map(
        (category) {
          return CategoryCard(
            emoji: category.emoji,
            title: category.title,
            isSelected:
                selectedCategory == category.title,
            onTap: () {
              setState(() {
                selectedCategory = category.title;
              });
            },
          );
        },
      ),
    ],
  ),
),
                const SizedBox(height: 30),

                buildStorySection(
                  title: "Stories",
                  storyList: filteredStories,
                ),

                const SizedBox(height: 30),

                buildStorySection(
                  title: "Continue Reading",
                  storyList: filteredStories,
                ),

                const SizedBox(height: 30),

                buildStorySection(
                  title: "Popular Stories",
                  storyList: filteredStories,
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget categoryChip(
    String title, {
    String emoji = "📚",
  }) {
    final selected = selectedCategory == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = title;
        });
      },

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),

        margin: const EdgeInsets.only(right: 12),

        child: CategoryCard(
          emoji: emoji,
          title: title,
        ),
      ),
    );
  }

  Widget buildStorySection({
    required String title,
    required List<Story> storyList,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        SectionTitle(title: title),

        const SizedBox(height: 15),

        SizedBox(
          height: 300,

          child: storyList.isEmpty
              ? const Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.menu_book_outlined,
              size: 70,
              color: Colors.grey,
            ),
            SizedBox(height: 16),
                   Text(
                    "No stories found",
                    style: TextStyle(fontSize: 18),
                 ),
          ],
        ),
      )
              : AnimatedSwitcher(
  duration: const Duration(milliseconds: 350),

  child: SizedBox(
    key: ValueKey(selectedCategory),
    height: 300,

    child: ListView.builder(
  controller: _storiesController,
  scrollDirection: Axis.horizontal,
  physics: const BouncingScrollPhysics(),
  itemCount: storyList.length,

itemBuilder: (context, index) {
  return StoryCard(
    story: storyList[index],
  );
  },
)
  ),
),
        ),
      ],
    );
  }
}