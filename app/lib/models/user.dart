class User {
  final String profilePic;
  final String username;
  final String email;
  final String password;
  final List<int> favoriteQuotesIdList;
  final List<int> favoriteStoriesIdList;

  User({
    required this.profilePic,
    required this.username,
    required this.email,
    required this.password,
    required this.favoriteQuotesIdList,
    required this.favoriteStoriesIdList,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      profilePic: json['profilepic'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      favoriteQuotesIdList: List<int>.from(json['favoritequotesidlist']),
      favoriteStoriesIdList: List<int>.from(json['favoritestoriesidlist']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'profilepic': profilePic,
      'username': username,
      'email': email,
      'password': password,
      'favoritequotesidlist': favoriteQuotesIdList,
      'favoritestoriesidlist': favoriteStoriesIdList,
    };
  }
}
