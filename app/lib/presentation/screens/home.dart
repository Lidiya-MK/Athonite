import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../models/quote.dart';
import '../../models/saint.dart';
import '../../models/user.dart';
import '../../data/categorySample.dart';
import '../../data/quoteSample.dart';
import '../../data/saintSample.dart';
import '../../data/storySample.dart';
import '../../data/userSample.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User currentUser = sampleUsers[0];
  Quote quoteOfTheDay = sampleQuotes[0];
  Saint saintForQuote = sampleSaints[0];

  @override
  Widget build(BuildContext context) {
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
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Athonite",
                      style: GoogleFonts.islandMoments(
                        color: Color(0xFFFFD700),
                        fontSize: 40,
                      ),
                    ),
                    Row(
  children: [
    Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(currentUser.profilePic),
          radius: 16.5,
        ),
        const SizedBox(height: 4),
        Text(
          currentUser.username,
          style: TextStyle(
            color: Color(0xFFCDCBCB),
            fontSize: 10,
          ),
        ),
      ],
    ),
    const SizedBox(width: 8), 
    Icon(
      Icons.logout,
      color: Color(0xFFCDCBCB),
      size: 30,
    ),
  ],
),

                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Browse",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 250,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: sampleCategories.length,
                            itemBuilder: (context, index) {
                              final category = sampleCategories[index];
                              return Container(
                                width: 230,
                                margin: const EdgeInsets.only(right: 16),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        category.image,
                                        height: 250,
                                        width: 230,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(vertical: 12),
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.5),
                                          borderRadius: const BorderRadius.vertical(
                                            bottom: Radius.circular(20),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            category.name,
                                            style: const TextStyle(
                                              color: Color(0xFFDACFB1),
                                              fontSize: 25,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          width: 350,
                          height: 160,
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            color: Color(0xFFDACFB1).withOpacity(0.26),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Quote of the day",
                                        style: TextStyle(
                                          color: Color(0xFFDACFB1),
                                          fontSize: 25,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Expanded(
                                        child: Text(
                                          quoteOfTheDay.quoteContent,
                                          style: TextStyle(color: Colors.white),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        saintForQuote.name,
                                        style: TextStyle(color: Color(0xFFDACFB1)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                                child: Image.asset(
                                  quoteOfTheDay.quoteImage,
                                  width: 125,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Text(
                            "Explore further",
                            style: TextStyle(
                              color: Color(0xFFFFD700),
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Center(
                          child: Text(
                            "Featured readings of the day",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(3, (index) {
                            final story = sampleStories[index];
                            return Animate(
                              effects: [
                                ScaleEffect(duration: 600.ms, curve: Curves.easeInOut),
                                FadeEffect(duration: 600.ms),
                              ],
                              child: Column(
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      story.storyImage,
                                      height: story.id == 1 ? 86 : 50,
                                      width: story.id == 1 ? 86 : 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    story.storyTitle.length > 12
                                        ? '${story.storyTitle.substring(0, 12)}...'
                                        : story.storyTitle,
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    maxLines: 1,
                                  ),
                                  Text(
                                    sampleSaints.firstWhere((s) => s.id == story.categoryId).name,
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ).animate(
                              delay: Duration(milliseconds: index * 200),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: [
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
        currentIndex: 0,
        selectedItemColor: Color(0xFFDACFB1),
        unselectedItemColor: Color(0xFF898484),
        showUnselectedLabels: true,
        onTap: (index) {

        },
      ),
    );
  }
}
