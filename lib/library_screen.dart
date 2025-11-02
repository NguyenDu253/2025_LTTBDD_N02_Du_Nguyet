import 'package:flutter/material.dart';

const kBackground = Color(0xFF121212);

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        title: const Text(
          'Music',
          style: TextStyle(fontWeight: FontWeight.bold),
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
                  title: const Text(
                    'Tạo danh sách phát',
                    style: TextStyle(color: Colors.white),
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
                  itemBuilder: (c, i) => ListTile(
                    leading: Container(
                      width: 56,
                      height: 56,
                      color: Colors.grey[800],
                    ),
                    title: Text(
                      // ✅ bỏ const ở đây
                      'Playlist $i',
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: const Text(
                      'Miễn phí',
                      style: TextStyle(color: Colors.white70),
                    ),
                    trailing: const Icon(
                      Icons.more_vert,
                      color: Colors.white70,
                    ),
                  ),
                  separatorBuilder: (_, __) =>
                      const Divider(color: Colors.white12),
                  itemCount: 8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
