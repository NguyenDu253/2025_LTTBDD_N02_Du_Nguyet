import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

const kBackground = Color(0xFF121212);

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> playlistColors = [
      Colors.deepPurpleAccent,
      Colors.teal,
      Colors.orangeAccent,
      Colors.indigo,
      Colors.pinkAccent,
      Colors.blueAccent,
      Colors.redAccent,
      Colors.greenAccent,
    ];

    // Dữ liệu giả lập cho danh sách playlist
    final List<List<Map<String, String>>> playlistSongs = [
      [
        {"title": "Night Drive", "artist": "Dreamwave"},
        {"title": "Electric Heart", "artist": "Nova Lights"},
        {"title": "City Skyline", "artist": "Midnight Air"},
      ],
      [
        {"title": "Ocean Breeze", "artist": "Blue Horizon"},
        {"title": "Lost in Waves", "artist": "Deep Flow"},
      ],
      [
        {"title": "Golden Hour", "artist": "Sundaze"},
        {"title": "Shimmer", "artist": "Radiant Tone"},
        {"title": "Horizon Lines", "artist": "Neon Glow"},
      ],
      [
        {"title": "Coffee Break", "artist": "LoFi Soul"},
        {"title": "Rainy Chill", "artist": "Soft Beats"},
      ],
      [
        {"title": "Thunder Run", "artist": "Powerline"},
        {"title": "Edge of Tomorrow", "artist": "Cyberstep"},
      ],
      [
        {"title": "Summer Vibes", "artist": "Lazy Days"},
        {"title": "Sunset Dream", "artist": "Golden Hour"},
      ],
      [
        {"title": "Midnight Pulse", "artist": "Echo Flow"},
        {"title": "Dark Alley", "artist": "Neon Noir"},
      ],
      [
        {"title": "Uplift", "artist": "Bright Morning"},
        {"title": "Feel Good", "artist": "Positive Beat"},
      ],
    ];

    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        title: Text(
          'music_title'.tr(), // Music / Nhạc
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: kBackground,
        elevation: 0,
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
          child: Column(
            children: [
              Card(
                color: Colors.grey[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: const Icon(
                    Icons.playlist_add_check,
                    color: Colors.white,
                  ),
                  title: Text(
                    'create_playlist'.tr(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: Colors.white70,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final color = playlistColors[index % playlistColors.length];
                    final playlistName = '${'playlist'.tr()} ${index + 1}';
                    final songs = playlistSongs[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => PlaylistDetailScreen(
                              playlistName: playlistName,
                              color: color,
                              songs: songs,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.music_note,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          title: Text(
                            playlistName,
                            style: const TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            'free_label'.tr(),
                            style: const TextStyle(color: Colors.white70),
                          ),
                          trailing: const Icon(
                            Icons.more_vert,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) =>
                      const Divider(color: Colors.white12),
                  itemCount: playlistSongs.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlaylistDetailScreen extends StatelessWidget {
  final String playlistName;
  final Color color;
  final List<Map<String, String>> songs;

  const PlaylistDetailScreen({
    super.key,
    required this.playlistName,
    required this.color,
    required this.songs,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        title: Text(
          playlistName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: kBackground,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: songs.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            // Header Playlist
            return Column(
              children: [
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.music_note,
                    color: Colors.white,
                    size: 72,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  playlistName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            );
          }

          final song = songs[index - 1];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: color.withOpacity(0.8),
              child: const Icon(Icons.play_arrow, color: Colors.white),
            ),
            title: Text(
              song["title"]!,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              song["artist"]!,
              style: const TextStyle(color: Colors.white70),
            ),
            trailing: const Icon(Icons.more_vert, color: Colors.white70),
          );
        },
      ),
    );
  }
}
