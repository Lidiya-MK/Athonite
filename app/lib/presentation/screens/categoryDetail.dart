import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/category.dart';
import '../../models/user.dart';
import '../../data/userSample.dart';

class CategoryDetailScreen extends StatelessWidget {
  final Category category;
  final User currentUser = sampleUsers[0]; 

  CategoryDetailScreen({Key? key, required this.category}) : super(key: key);

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
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFFDACFB1), 
                                ),
                              ),
                            ],
                          ),
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
