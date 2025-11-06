// lib/screens/now_playing_screen.dart
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class NowPlayingScreen extends StatefulWidget {
  final String songTitle;
  final String artist;
  final String imagePath;

  const NowPlayingScreen({
    super.key,
    required this.songTitle,
    required this.artist,
    required this.imagePath,
  });

  @override
  State<NowPlayingScreen> createState() => _NowPlayingScreenState();
}

class _NowPlayingScreenState extends State<NowPlayingScreen> {
  bool _isPlaying = true;
  double _currentPosition = 10; // ví dụ
  double _duration = 217; // ví dụ: 3:37

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B1C1E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          tr('now_playing'),
          style: const TextStyle(color: Colors.white70),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          children: [
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: _buildCover(widget.imagePath),
            ),
            const SizedBox(height: 30),

            // 🔹 Tiêu đề bài hát + nút hành động
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.songTitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.artist,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.white70,
                      ),
                      tooltip: tr('add_to_playlist'),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white70),
                      tooltip: tr('close'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 12),

            // 🔹 Thanh tiến trình
            Slider(
              value: _currentPosition,
              min: 0,
              max: _duration,
              onChanged: (v) => setState(() => _currentPosition = v),
              activeColor: Colors.white,
              inactiveColor: Colors.white24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatTime(_currentPosition.toInt()),
                  style: const TextStyle(color: Colors.white54),
                ),
                Text(
                  "-${_formatTime((_duration - _currentPosition).toInt())}",
                  style: const TextStyle(color: Colors.white54),
                ),
              ],
            ),
            const Spacer(),

            // 🔹 Bộ điều khiển phát nhạc
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.shuffle, color: Colors.green),
                  tooltip: tr('shuffle'),
                  onPressed: () {},
                ),
                const SizedBox(width: 18),
                IconButton(
                  icon: const Icon(
                    Icons.skip_previous,
                    color: Colors.white,
                    size: 32,
                  ),
                  tooltip: tr('previous'),
                  onPressed: () {},
                ),
                const SizedBox(width: 6),
                IconButton(
                  iconSize: 72,
                  icon: Icon(
                    _isPlaying ? Icons.pause_circle_filled : Icons.play_circle,
                    color: Colors.white,
                  ),
                  tooltip: _isPlaying ? tr('pause') : tr('play'),
                  onPressed: () => setState(() => _isPlaying = !_isPlaying),
                ),
                const SizedBox(width: 6),
                IconButton(
                  icon: const Icon(
                    Icons.skip_next,
                    color: Colors.white,
                    size: 32,
                  ),
                  tooltip: tr('next'),
                  onPressed: () {},
                ),
                const SizedBox(width: 18),
                IconButton(
                  icon: const Icon(Icons.timer_outlined, color: Colors.white70),
                  tooltip: tr('sleep_timer'),
                  onPressed: () {},
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildCover(String path) {
    if (path.startsWith('http')) {
      return Image.network(
        path,
        width: double.infinity,
        height: 320,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        path,
        width: double.infinity,
        height: 320,
        fit: BoxFit.cover,
      );
    }
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return "${minutes.toString().padLeft(1, '0')}:${secs.toString().padLeft(2, '0')}";
  }
}
