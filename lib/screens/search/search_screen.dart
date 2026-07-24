import 'package:flutter/material.dart';

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
    setState(() {
      if (value.trim().isEmpty) {
        results = stories;
      } else {
        results = stories.where((story) {
          return story.title
              .toLowerCase()
              .contains(value.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Stories"),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),

            child: TextField(
              controller: controller,
              autofocus: true,
              onChanged: search,

              decoration: InputDecoration(
                hintText: "Search story...",
                prefixIcon: const Icon(Icons.search),

                suffixIcon: controller.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          controller.clear();
                          search("");
                        },
                      )
                    : null,

                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(16),
                ),
              ),
            ),
          ),

          Expanded(
            child: results.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 70,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 20),
                        Text(
                          "No story found",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: results.length,

                    itemBuilder: (context, index) {
                      final story = results[index];

                      return ListTile(
                        leading: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(8),

                          child: Image.asset(
                            story.image,
                            width: 55,
                            height: 55,
                            fit: BoxFit.cover,

                            errorBuilder:
                                (_, __, ___) =>
                                    Container(
                              width: 55,
                              height: 55,
                              color: Colors.grey.shade300,
                              child: const Icon(
                                Icons.image,
                              ),
                            ),
                          ),
                        ),

                        title: Text(story.title),

                        subtitle: Text(story.category),

                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        ),

                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  StoryDetailsScreen(
                                story: story,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}