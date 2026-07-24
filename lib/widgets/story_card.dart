import 'package:flutter/material.dart';

import '../models/story.dart';
import '../screens/story/story_details_screen.dart';

class StoryCard extends StatelessWidget {
  final Story story;

  const StoryCard({
    super.key,
    required this.story,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,

      child: Card(
        margin: const EdgeInsets.only(right: 18),
        elevation: 4,
        clipBehavior: Clip.antiAlias,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),

        child: InkWell(
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

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Hero(
                tag: story.title,

                child: Image.asset(
                  story.image,
                  height: 150,
                  width: 180,
                  fit: BoxFit.cover,

                  errorBuilder:
                      (context, error, stackTrace) {
                    return Container(
                      height: 150,
                      color: Colors.grey.shade300,

                      child: const Center(
                        child: Icon(
                          Icons.image,
                          size: 60,
                        ),
                      ),
                    );
                  },
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [
                      Text(
                        story.title,
                        maxLines: 2,
                        overflow:
                            TextOverflow.ellipsis,

                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        story.author,
                        style: TextStyle(
                          color:
                              Colors.grey.shade600,
                        ),
                      ),

                      const Spacer(),

                      Row(
                        children: [
                          const Icon(
                            Icons.schedule,
                            size: 18,
                          ),

                          const SizedBox(width: 6),

                          Text(story.duration),

                          const Spacer(),

                          const Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}