class Saint {
  final int id;
  final List<int> storyIdList;
  final List<int> quoteIdList;
  final String name;

  Saint({
    required this.id,
    required this.storyIdList,
    required this.quoteIdList,
    required this.name,
  });

  factory Saint.fromJson(Map<String, dynamic> json) {
    return Saint(
      id: json['id'],
      storyIdList: List<int>.from(json['storyidlist']),
      quoteIdList: List<int>.from(json['quoteidlist']),
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'storyidlist': storyIdList,
      'quoteidlist': quoteIdList,
      'name': name,
    };
  }
}
