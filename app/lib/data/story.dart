class Story {
  final int id;
  final int favoriteCount;
  final String storyContent;
  final String storyTitle;
  final String storyImage;
  final int categoryId;

  Story({
    required this.id,
    required this.favoriteCount,
    required this.storyContent,
    required this.storyTitle,
    required this.storyImage,
    required this.categoryId,
  });

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      id: json['id'],
      favoriteCount: json['favoritecount'],
      storyContent: json['storycontent'],
      storyTitle: json['storytitle'],
      storyImage: json['storyimage'],
      categoryId: json['categoryid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'favoritecount': favoriteCount,
      'storycontent': storyContent,
      'storytitle': storyTitle,
      'storyimage': storyImage,
      'categoryid': categoryId,
    };
  }
}
