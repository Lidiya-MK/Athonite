import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/quote.dart';
import '../../models/story.dart';
import '../../models/user.dart';
import '../screens/home.dart';
import '../../data/userSample.dart';
import '../../data/quoteSample.dart';
import '../../data/storySample.dart';
import '../screens/story.dart';
import '../screens/quotes.dart';
import '../../data/categorySample.dart';
import '../../data/saintSample.dart'; 

class FavoritesScreen extends StatefulWidget {
  final User currentUser = sampleUsers[0];

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  int currentQuoteIndex = 0;

  void nextQuote() {
    setState(() {
      currentQuoteIndex = (currentQuoteIndex + 1) % widget.currentUser.favoriteQuotesIdList.length;
    });
  }

  void previousQuote() {
    setState(() {
      currentQuoteIndex = (currentQuoteIndex - 1 + widget.currentUser.favoriteQuotesIdList.length) % widget.currentUser.favoriteQuotesIdList.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Quote> favoriteQuotes = sampleQuotes
        .where((quote) => widget.currentUser.favoriteQuotesIdList.contains(quote.id))
        .toList();

    final List<Story> favoriteStories = sampleStories
        .where((story) => widget.currentUser.favoriteStoriesIdList.contains(story.id))
        .toList();

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/homeSaint.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.favorite, color: Colors.red),
                    SizedBox(width: 8),
                    Text(
                      "Favorites",
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFFDACFB1),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    "Quotes",
                    style: GoogleFonts.islandMoments(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                if (favoriteQuotes.isNotEmpty)
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFDACFB1).withOpacity(0.26),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          left: 10,
                          child: IconButton(
                            icon: Icon(Icons.close, color: Colors.black),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      favoriteQuotes[currentQuoteIndex].quoteContent,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      '- ${getSaintForQuote(favoriteQuotes[currentQuoteIndex].id)} -',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              child: Image.asset(
                                favoriteQuotes[currentQuoteIndex].quoteImage,
                                width: 125,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.favorite, color: Colors.red),
                                onPressed: () {
                                },
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "${favoriteQuotes[currentQuoteIndex].favoriteCount}",
                                style: TextStyle(
                                  color: const Color(0xFFDACFB1).withOpacity(1),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.arrow_left, color: Colors.black),
                                onPressed: previousQuote,
                              ),
                              IconButton(
                                icon: Icon(Icons.arrow_right, color: Colors.black),
                                onPressed: nextQuote,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 30),
                Text(
                  "Readings",
                  style: GoogleFonts.islandMoments(
                    color: Colors.white,
                    fontSize: 50,
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: favoriteStories.length,
                    itemBuilder: (context, index) {
                      Story story = favoriteStories[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StoryScreen(story: story),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFDACFB1).withOpacity(0.26),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                child: Image.asset(
                                  story.storyImage,
                                  height: 130,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            story.storyTitle,
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xFFDACFB1),
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            'Favorites: ${story.favoriteCount}',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xFFDACFB1),
                                            ),
                                          ),
                                          Text(
                                            "${getCategoryForStory(story.id)} from ${getSaintForStory(story.id)}",
                                            style: TextStyle(color: Color(0xFFDACFB1), fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(Icons.favorite, color: Colors.red, size: 16),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xFFDACFB1)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Color(0xFF898484)),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark, color: Color(0xFF898484)),
            label: 'Quotes',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: const Color(0xFFDACFB1),
        unselectedItemColor: const Color(0xFF898484),
        showUnselectedLabels: true,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          } else if (index == 1) {
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const QuotesScreen()),
            );
          }
        },
      ),
    );
  }

  String getCategoryForQuote(int quoteId) {
 
    for (var category in sampleCategories) {
      if (category.storyIdList.contains(quoteId)) {
        return category.name;
      }
    }
    return "Unknown Category";
  }


  String getSaintForQuote(int quoteId) {
  
    for (var saint in sampleSaints) {
      if (saint.quoteIdList.contains(quoteId)) {
        return saint.name;
      }
    }
    return "Unknown Saint";
  }

 
  String getCategoryForStory(int storyId) {
    for (var category in sampleCategories) {
      if (category.storyIdList.contains(storyId)) {
        return category.name;
      }
    }
    return "Unknown Category";
  }


  String getSaintForStory(int storyId) {
    for (var saint in sampleSaints) {
      if (saint.storyIdList.contains(storyId)) {
        return saint.name;
      }
    }
    return "Unknown Saint";
  }
}
