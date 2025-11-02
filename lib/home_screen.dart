import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';

const kBackground = Color(0xFF121212);
const kAccentGreen = Color(0xFF1DB954);

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget _sectionTitle(String text) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
    child: Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

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
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            bottom: 90,
          ), // để mini-player+nav ko che nội dung
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // chips
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    _chip('Tất cả', active: true),
                    const SizedBox(width: 8),
                    _chip('Âm nhạc'),
                    const SizedBox(width: 8),
                    _chip('Podcast'),
                  ],
                ),
              ),

              _sectionTitle('Radio phổ biến'),
              SizedBox(
                height: 150,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (c, i) => _radioCard(i),
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemCount: 6,
                ),
              ),

              _sectionTitle('Album và đĩa đơn nổi tiếng'),
              SizedBox(
                height: 220,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (c, i) => _albumCard(i),
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemCount: 6,
                ),
              ),

              _sectionTitle('Nghệ sĩ phổ biến'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 120,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (c, i) => _artistCircle(i),
                    separatorBuilder: (_, __) => const SizedBox(width: 14),
                    itemCount: 6,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _chip(String title, {bool active = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: active ? kAccentGreen : Colors.white12,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: TextStyle(color: active ? Colors.black : Colors.white),
      ),
    );
  }

  Widget _radioCard(int i) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: Colors.primaries[i % Colors.primaries.length].shade700,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 36,
            backgroundColor: Colors.black26,
            child: const Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            'Radio $i',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _albumCard(int i) {
    return SizedBox(
      width: 150,
      child: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Tên album',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text('Nghệ sĩ', style: TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }

  Widget _artistCircle(int i) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey[800],
          child: const Icon(Icons.person, color: Colors.white),
        ),
        const SizedBox(height: 8),
        const Text('Artist', style: TextStyle(color: Colors.white)),
      ],
    );
  }
}
