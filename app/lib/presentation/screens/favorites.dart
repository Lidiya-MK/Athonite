import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/quoteSample.dart';
import '../../data/userSample.dart';
import '../screens/home.dart';
import '../screens/quotes.dart';
import '../../models/user.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User currentUser = sampleUsers[0];

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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       const Icon(
                        Icons.favorite,
                        color: Color(0xFFFFD700), 
                        size: 60, 
                      ),
                       const SizedBox(width: 0),
                      Text(
                        "Favorites",
                        style: GoogleFonts.islandMoments(
                          color: const Color(0xFFFFD700),
                          fontSize: 100,
                        ),
                      ),
                     
                     
                    ],
                  ),
                ),
                const SizedBox(height: 20),

               
                Expanded(
                  child: ListView.builder(
                    itemCount: sampleQuotes.length,
                    itemBuilder: (context, index) {
                      final quote = sampleQuotes[index];
                      return Card(
                        color: const Color(0xFFDACFB1).withOpacity(0.26),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  quote.quoteImage,
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      quote.quoteContent,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "Favorites: ${quote.favoriteCount}",
                                      style: const TextStyle(
                                        color: Color(0xFFDACFB1),
                                        fontSize: 12,
                                      ),
                                    ),
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
            icon: Icon(Icons.home, color: Color(0xFF898484)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Color(0xFFDACFB1)),
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
