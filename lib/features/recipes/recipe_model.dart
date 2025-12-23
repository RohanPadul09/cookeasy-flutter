class Recipe {
  final String title;
  final String description;
  final String category;
  final String videoUrl;

  Recipe({
    required this.title,
    required this.description,
    required this.category,
    required this.videoUrl
  });
  factory Recipe.fromFirestore(Map<String, dynamic> data) {
    return Recipe(
      title: data['title'],
      description: data['description'],
      category: data['category'],
      videoUrl: data['videoUrl']
    );
  }
}
