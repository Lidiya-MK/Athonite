import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/quote.dart';
import '../../data/quoteSample.dart';
import '../screens/favorites.dart';
import '../screens/home.dart';
import '../../data/userSample.dart';
import '../../models/user.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  _QuotesScreenState createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  User currentUser = sampleUsers[0];


  List<bool> isFavorited = List.generate(sampleQuotes.length, (index) => false);

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
                        color: const Color(0xFFFFD700),
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
                              style: const TextStyle(
                                color: Color(0xFFCDCBCB),
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.logout,
                          color: Color(0xFFCDCBCB),
                          size: 30,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
           
                Center(
                  child: Text(
                    "Quotes",
                    style: GoogleFonts.islandMoments(
                      color: const Color(0xFFFFD700),
                      fontSize: 100,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: sampleQuotes.asMap().entries.map((entry) {
                        int index = entry.key;
                        Quote quote = entry.value;

                        return Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFDACFB1).withOpacity(0.26),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            quote.quoteContent,
                                            style: const TextStyle(color: Colors.white),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3, 
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
                                      quote.quoteImage,
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
                                    GestureDetector(
                                      onTap: () {
                                      
                                      },
                                      child: Icon(
                                        Icons.favorite,
                                        color: isFavorited[index] ? Colors.red : const Color(0xFFDACFB1),
                                        size: 20,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      "${quote.favoriteCount}",
                                      style: TextStyle(
                                        color: const Color(0xFFDACFB1).withOpacity(1),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
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
        currentIndex: 2, 
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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const FavoritesScreen()),
            );
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
}
