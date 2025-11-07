import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../screens/welcome_screen.dart';
import '../screens/settings_screen.dart';

const kBackground = Color(0xFF121212);
const kAccentGreen = Color(0xFF1DB954);

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        title: Text(
          'music'.tr(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: kBackground,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 100),
          child: Column(
            children: [
              Row(
                children: const [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.brown,
                    child: Text('N'),
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Nguyendu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.person_add, color: Colors.white),
                title: Text(
                  'add_account'.tr(),
                  style: const TextStyle(color: Colors.white),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.flash_on, color: Colors.white),
                title: Text(
                  'new_content'.tr(),
                  style: const TextStyle(color: Colors.white),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.access_time, color: Colors.white),
                title: Text(
                  'recent'.tr(),
                  style: const TextStyle(color: Colors.white),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.group, color: Colors.white),
                title: const Text(
                  'Thông tin nhóm',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const TeamInfoScreen()),
                  );
                },
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kAccentGreen,
                  minimumSize: const Size.fromHeight(48),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const WelcomeScreen()),
                    (route) => false,
                  );
                },
                child: Text(
                  'logout'.tr(),
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

// Màn hình hiển thị thông tin nhóm
class TeamInfoScreen extends StatelessWidget {
  const TeamInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        title: const Text('Thông tin nhóm'),
        backgroundColor: kBackground,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Nhóm phát triển app:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '1. Nguyễn Tiến Dự - 22012277 \n'
              '2. Nguyễn Thị Ánh Nguyệt - 22010473\n',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
