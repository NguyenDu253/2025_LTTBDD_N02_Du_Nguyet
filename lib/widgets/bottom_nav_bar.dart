import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart'; // nhớ import
import 'package:app_music/screens/home_screen.dart';
import 'package:app_music/screens/search_screen.dart';
import 'package:app_music/screens/library_screen.dart';
import 'package:app_music/screens/profile_screen.dart';
import 'package:app_music/screens/now_playing_screen.dart';
import 'package:app_music/screens/premium_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  bool _showMiniPlayer = false;

  String _currentSongTitle = '';
  String _currentSongArtist = '';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onSongSelected(String title, String artist) {
    setState(() {
      _currentSongTitle = title;
      _currentSongArtist = artist;
      _showMiniPlayer = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      HomeScreen(onSongSelected: _onSongSelected),
      const SearchScreen(),
      const LibraryScreen(),
      const PremiumScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: Stack(
        children: [
          _screens[_selectedIndex],

          // Mini Player
          if (_showMiniPlayer)
            Positioned(
              left: 0,
              right: 0,
              bottom: 18,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => NowPlayingScreen(
                        songTitle: _currentSongTitle,
                        artist: _currentSongArtist,
                        imagePath: 'https://picsum.photos/300',
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 10,
                        offset: const Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          'https://picsum.photos/80',
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _currentSongTitle,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              _currentSongArtist,
                              style: const TextStyle(color: Colors.white70),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _showMiniPlayer = false;
                          });
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white70,
                          size: 26,
                        ),
                      ),
                      const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 32,
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),

      // Bottom Navigation Bar đa ngôn ngữ
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color(0xFF1DB954),
        unselectedItemColor: Colors.white70,
        backgroundColor: const Color(0xFF121212),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            label: 'home'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: 'search'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.library_music_outlined),
            label: 'library'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.star_outline),
            label: 'premium'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline),
            label: 'profile'.tr(),
          ),
        ],
      ),
    );
  }
}
