import 'package:flutter/material.dart';

class ArtistDetailScreen extends StatelessWidget {
  final String artistName;
  final String imageUrl;

  const ArtistDetailScreen({
    Key? key,
    required this.artistName,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final songs = [
      'Bài hát 1 của $artistName',
      'Bài hát 2 của $artistName',
      'Bài hát 3 của $artistName',
      'Bài hát 4 của $artistName',
      'Bài hát 5 của $artistName',
      'Bài hát 6 của $artistName',
      'Bài hát 7 của $artistName',
      'Bài hát 8 của $artistName',
      'Bài hát 9 của $artistName',
      'Bài hát 10 của $artistName',
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(title: Text(artistName), backgroundColor: Colors.black),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Column(
              children: [
                ClipOval(
                  child: Image.network(
                    imageUrl,
                    width: 140,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  artistName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          const Divider(color: Colors.white24),
          const SizedBox(height: 10),
          const Text(
            "Bài hát nổi bật",
            style: TextStyle(color: Colors.white70, fontSize: 18),
          ),
          const SizedBox(height: 10),
          ...songs.map(
            (title) => ListTile(
              title: Text(title, style: const TextStyle(color: Colors.white)),
              trailing: const Icon(Icons.play_arrow, color: Colors.white),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
