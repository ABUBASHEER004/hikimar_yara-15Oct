class Story {
  final String id;
  final String title;
  final String englishTitle;
  final String image;
  final String author;
  final String duration;
  final String category;
  final String description;
  final String englishDescription;
  final String content;
  final String englishContent;
  final String lesson;
  final String englishLesson;
  final String ageRange;
  final String audio;

  const Story({
    required this.id,
    required this.title,
    required this.englishTitle,
    required this.image,
    required this.author,
    required this.duration,
    required this.category,
    required this.description,
    required this.englishDescription,
    required this.content,
    required this.englishContent,
    required this.lesson,
    required this.englishLesson,
    required this.ageRange,
    this.audio = '',
  });
}
