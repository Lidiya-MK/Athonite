import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/story.dart';
import '../../data/storySample.dart';
import '../../models/user.dart';
import '../../data/userSample.dart';
import '../screens/home.dart';
import '../screens/favorites.dart';
import '../screens/quotes.dart';

class StoryScreen extends StatelessWidget {
  final Story story;
  final User currentUser = sampleUsers[0];
  StoryScreen({Key? key, required this.story}) : super(key: key);

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

        
                Text(
                  story.storyTitle,
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xFFDACFB1),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Color(0xFFDACFB1),
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${story.favoriteCount}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFDACFB1),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
             
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    story.storyImage,
                    height: 215,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),


                Text(
                  story.storyContent,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFDACFB1),
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
        MaterialPageRoute(builder: (context) => FavoritesScreen()),
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
