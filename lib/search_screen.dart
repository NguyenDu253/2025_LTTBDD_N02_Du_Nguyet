import 'package:flutter/material.dart';

const kBackground = Color(0xFF121212);
const kAccentGreen = Color(0xFF1DB954);

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  Widget _card(String title, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

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
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
          child: Column(
            children: [
              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  fillColor: Colors.white12,
                  filled: true,
                  hintText: 'Bạn muốn nghe gì?',
                  hintStyle: const TextStyle(color: Colors.white60),
                  prefixIcon: const Icon(Icons.search, color: Colors.white60),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Duyệt tìm tất cả',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 3 / 2,
                  children: [
                    _card('Nhạc', Colors.pinkAccent),
                    _card('Podcast', Colors.teal),
                    _card('Sự kiện trực tiếp', Colors.purple),
                    _card('Dành Cho Bạn', Colors.deepPurple),
                    _card('Nhạc Việt', Colors.blueGrey),
                    _card('Pop', Colors.lightBlue),
                    _card('K-Pop', Colors.redAccent),
                    _card('Hip-Hop', Colors.orange),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
