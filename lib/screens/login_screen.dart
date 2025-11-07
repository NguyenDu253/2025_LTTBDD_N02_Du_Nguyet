import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../widgets/bottom_nav_bar.dart';

const kBackground = Color(0xFF121212);
const kAccentGreen = Color(0xFF1DB954);

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        title: Text('music_title'.tr()), // 🎵 Music / Nhạc
        backgroundColor: kBackground,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              const Icon(Icons.music_note, size: 80, color: Colors.white),
              const SizedBox(height: 16),
              Text(
                'login_title'.tr(), //  Đăng nhập vào Music / Log in to Music
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              _bigButton(
                context,
                Icons.email_outlined,
                'continue_email'.tr(),
                kAccentGreen,
                Colors.black,
              ),
              const SizedBox(height: 12),
              _outlineButton(
                context,
                Icons.phone_iphone,
                'continue_phone'.tr(),
              ),
              const SizedBox(height: 12),
              _outlineButton(
                context,
                Icons.g_mobiledata,
                'continue_google'.tr(),
              ),
              const SizedBox(height: 12),
              _outlineButton(context, Icons.apple, 'continue_apple'.tr()),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const BottomNavBar()),
                  );
                },
                child: Text(
                  'back_home'.tr(), //  Quay lại trang chính / Back to home
                  style: const TextStyle(color: Colors.white70),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bigButton(
    BuildContext c,
    IconData icon,
    String text,
    Color bg,
    Color fg,
  ) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton.icon(
        onPressed: () => Navigator.pushReplacement(
          c,
          MaterialPageRoute(builder: (_) => const BottomNavBar()),
        ),
        icon: Icon(icon, color: fg),
        label: Text(text, style: TextStyle(color: fg)),
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
      ),
    );
  }

  Widget _outlineButton(BuildContext c, IconData icon, String text) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: Icon(icon, color: Colors.white),
        label: Text(text, style: const TextStyle(color: Colors.white)),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.white12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
      ),
    );
  }
}
