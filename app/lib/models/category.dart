class Category {
  final int id;
  final List<int> storyIdList;
  final String image;
  final String name;

  Category({
    required this.id,
    required this.storyIdList,
    required this.image,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      storyIdList: List<int>.from(json['storyidlist']),
      image: json['image'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'storyidlist': storyIdList,
      'image': image,
      'name': name,
    };
  }
}
