import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/search_screen.dart';
import '../screens/library_screen.dart';
import '../screens/profile_screen.dart';

const kBackground = Color(0xFF121212);
const kAccentGreen = Color(0xFF1DB954);

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    LibraryScreen(),
    ProfileScreen(),
  ];

  // Mini-player sample state
  bool _isPlaying = false;
  String _songTitle = 'Tên bài hát';
  String _artist = 'Tên nghệ sĩ';

  void _onTap(int idx) => setState(() => _selectedIndex = idx);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: Stack(
        children: [
          // main screen
          _screens[_selectedIndex],
          // bottom area: mini-player + nav bar
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Mini player
                GestureDetector(
                  onTap: () {
                    // mở chi tiết player (placeholder)
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Open player (placeholder)'),
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.black87,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: Row(
                      children: [
                        // album art
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Icon(
                            Icons.music_note,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 12),
                        // title + artist
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                _songTitle,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                _artist,
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // play/pause button
                        IconButton(
                          onPressed: () =>
                              setState(() => _isPlaying = !_isPlaying),
                          icon: Icon(
                            _isPlaying
                                ? Icons.pause_circle_filled
                                : Icons.play_circle_filled,
                            color: kAccentGreen,
                            size: 36,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // BottomNavigationBar
                Container(
                  decoration: const BoxDecoration(
                    color: kBackground,
                    border: Border(
                      top: BorderSide(color: Colors.white12, width: 0.4),
                    ),
                  ),
                  child: BottomNavigationBar(
                    backgroundColor: kBackground,
                    type: BottomNavigationBarType.fixed,
                    showUnselectedLabels: true,
                    currentIndex: _selectedIndex,
                    onTap: _onTap,
                    selectedItemColor: kAccentGreen,
                    unselectedItemColor: Colors.white70,
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home_outlined),
                        activeIcon: Icon(Icons.home),
                        label: 'Trang chủ',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.search_outlined),
                        activeIcon: Icon(Icons.search),
                        label: 'Tìm kiếm',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.library_music_outlined),
                        activeIcon: Icon(Icons.library_music),
                        label: 'Thư viện',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person_outline),
                        activeIcon: Icon(Icons.person),
                        label: 'Hồ sơ',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
