import '../models/user.dart';
List<User> sampleUsers = [
  User(
    profilePic: "user1.png",
    username: "john_doe",
    email: "john@example.com",
    password: "password123",
    favoriteQuotesIdList: [1, 2],
    favoriteStoriesIdList: [1, 3],
  ),
  User(
    profilePic: "user2.png",
    username: "mary_smith",
    email: "mary@example.com",
    password: "password456",
    favoriteQuotesIdList: [3, 5],
    favoriteStoriesIdList: [2, 5],
  ),
  User(
    profilePic: "user3.png",
    username: "paul_jones",
    email: "paul@example.com",
    password: "password789",
    favoriteQuotesIdList: [1, 4],
    favoriteStoriesIdList: [4],
  ),
  User(
    profilePic: "user4.png",
    username: "peter_parker",
    email: "peter@example.com",
    password: "password321",
    favoriteQuotesIdList: [2],
    favoriteStoriesIdList: [2],
  ),
  User(
    profilePic: "user5.png",
    username: "james_brown",
    email: "james@example.com",
    password: "password654",
    favoriteQuotesIdList: [1, 3],
    favoriteStoriesIdList: [1, 5],
  ),
];
