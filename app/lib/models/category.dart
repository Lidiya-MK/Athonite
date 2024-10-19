class Category {
  final int id;
  final List<int> storyIdList;
  final String image;
  final String name;
  final String description;

  Category({
    required this.id,
    required this.storyIdList,
    required this.image,
    required this.name,
    required this.description,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      storyIdList: List<int>.from(json['storyidlist']),
      image: json['image'],
      name: json['name'],
      description: json['description'], 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'storyidlist': storyIdList,
      'image': image,
      'name': name,
      'description': description,
    };
  }
}
