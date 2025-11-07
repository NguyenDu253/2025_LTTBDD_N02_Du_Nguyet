import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

const kBackground = Color(0xFF121212);
const kAccentGreen = Color(0xFF1DB954);

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        title: Text(
          tr('music_title'), //Đa ngôn ngữ
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: kBackground,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 100),
          child: Column(
            children: [
              Container(
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    tr('premium_banner'), //Premium banner
                    style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                tr('premium_description'), // Mô tả Premium
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                tr('premium_reason'), //Lý do nên dùng
                style: const TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: kAccentGreen,
                  minimumSize: const Size.fromHeight(48),
                ),
                child: Text(
                  tr('upgrade_now'), // Nâng cấp ngay
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
