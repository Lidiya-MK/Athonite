class Quote {
  final int id;
  final String quoteImage;
  final int saintId;
  final String quoteContent;
  final int favoriteCount;

  Quote({
    required this.id,
    required this.quoteImage,
    required this.saintId,
    required this.quoteContent,
    required this.favoriteCount,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['id'],
      quoteImage: json['quoteimage'],
      saintId: json['saintid'],
      quoteContent: json['quotecontent'],
      favoriteCount: json['favoriteCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quoteimage': quoteImage,
      'saintid': saintId,
      'quotecontent': quoteContent,
      'favoriteCount': favoriteCount,
    };
  }
}
