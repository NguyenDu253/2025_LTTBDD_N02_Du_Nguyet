import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'now_playing_screen.dart';

const kBackground = Color(0xFF121212);
const kAccentGreen = Color(0xFF1DB954);

class CategorySongsScreen extends StatefulWidget {
  final String categoryKey;

  const CategorySongsScreen({super.key, required this.categoryKey});

  @override
  _CategorySongsScreenState createState() => _CategorySongsScreenState();
}

class _CategorySongsScreenState extends State<CategorySongsScreen> {
  bool _showMiniPlayer = false;
  String _currentSongTitle = '';
  String _currentSongArtist = '';

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> songs = List.generate(10, (index) {
      return {
        'title': '${tr(widget.categoryKey)} Song ${index + 1}',
        'artist': 'Artist ${index + 1}',
      };
    });

    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        title: Text(tr(widget.categoryKey)),
        backgroundColor: kBackground,
        elevation: 0,
      ),
      body: Stack(
        children: [
          ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              final song = songs[index];
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'https://picsum.photos/60?random=$index',
                    width: 55,
                    height: 55,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  song['title']!,
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  song['artist']!,
                  style: const TextStyle(color: Colors.white70),
                ),
                trailing: const Icon(Icons.play_arrow, color: kAccentGreen),
                onTap: () {
                  setState(() {
                    _currentSongTitle = song['title']!;
                    _currentSongArtist = song['artist']!;
                    _showMiniPlayer = true;
                  });
                },
              );
            },
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemCount: songs.length,
          ),

          // MiniPlayer
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
    );
  }
}
