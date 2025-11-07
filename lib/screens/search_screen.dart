import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'category_songs_screen.dart';

const kBackground = Color(0xFF121212);
const kAccentGreen = Color(0xFF1DB954);

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  //Card có GestureDetector
  Widget _card(BuildContext context, String titleKey, Color color) {
    return GestureDetector(
      onTap: () {
        // Chuyển sang trang CategorySongsScreen khi bấm
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CategorySongsScreen(categoryKey: titleKey),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(12),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            tr(titleKey), // Dịch key
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
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
        title: Text(
          tr('music_title'),
          style: const TextStyle(fontWeight: FontWeight.bold),
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
                  hintText: tr('search_hint'),
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
                child: Text(
                  tr('browse_all'),
                  style: const TextStyle(
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
                    _card(context, 'category_music', Colors.pinkAccent),
                    _card(context, 'category_podcast', Colors.teal),
                    _card(context, 'category_live_event', Colors.purple),
                    _card(context, 'category_for_you', Colors.deepPurple),
                    _card(context, 'category_vietnamese', Colors.blueGrey),
                    _card(context, 'category_pop', Colors.lightBlue),
                    _card(context, 'category_kpop', Colors.redAccent),
                    _card(context, 'category_hiphop', Colors.orange),
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
