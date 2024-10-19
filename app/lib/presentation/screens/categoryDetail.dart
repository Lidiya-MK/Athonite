import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/category.dart';
import '../../models/user.dart';
import '../../models/story.dart';
import '../../models/saint.dart';
import '../../data/userSample.dart';
import '../../data/storySample.dart';
import '../../data/saintSample.dart';

class CategoryDetailScreen extends StatelessWidget {
  final Category category;
  final User currentUser = sampleUsers[0];

  CategoryDetailScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Saint categorySaint = sampleSaints.firstWhere(
      (s) => s.storyIdList.contains(category.id),
      orElse: () => Saint(
        id: -1,
        storyIdList: [],
        quoteIdList: [],
        name: 'Unknown',
      ),
    );

    
    String truncateText(String text, int length) {
      return text.length > length ? '${text.substring(0, length)}...' : text;
    }

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

                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        category.image,
                        width: 166,
                        height: 205,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            category.name,
                            style: GoogleFonts.instrumentSans(
                              fontSize: 28,
                              color: Color(0xFFDACFB1),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            category.description,
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

                const SizedBox(height: 20),

                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: category.storyIdList.length,
                    itemBuilder: (context, index) {
                      Story story = sampleStories.firstWhere((s) => s.id == category.storyIdList[index]);
                      return Container(
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
                              padding: const EdgeInsets.all(.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        truncateText(story.storyTitle, 12), 
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xFFDACFB1),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        truncateText("${category.name} from ${categorySaint.name}", 30), 
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFFDACFB1),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.favorite, color: Colors.red, size: 16),
                                      const SizedBox(width: 4),
                                      Text(
                                        '${story.favoriteCount}',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFFDACFB1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
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
