import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/quote.dart';
import '../../data/quoteSample.dart';
import '../screens/favorites.dart';
import '../screens/home.dart';

class QuotesScreen extends StatelessWidget {
  const QuotesScreen({super.key});

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
                Center(
                  child: Text(
                    "Quotes",
                    style: GoogleFonts.islandMoments(
                      color: const Color(0xFFFFD700),
                      fontSize: 100,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: sampleQuotes.map((quote) {
                        return Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFDACFB1).withOpacity(0.26),
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
  currentIndex: 0, 
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
