import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // nền đen
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            children: [
              // back button (trong hình có mũi tên)
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    // Có thể pop nếu tới từ màn hình khác, ở root sẽ không làm gì
                    Navigator.maybePop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                ),
              ),

              const Spacer(),

              // logo
              const Icon(
                FontAwesomeIcons.spotify,
                color: Colors.white,
                size: 60,
              ),
              const SizedBox(height: 18),

              // title
              const Text(
                'Đăng nhập vào Spotify',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 26),

              // Buttons list
              _buildPrimaryButton(
                context,
                icon: Icons.email_outlined,
                label: 'Tiếp tục bằng email',
                backgroundColor: const Color(0xFF1DB954),
                onTap: () {
                  // chuyển tới Add Account (thêm tài khoản)
                  Navigator.pushNamed(context, '/add_account');
                },
              ),
              const SizedBox(height: 12),

              _buildOutlineButton(
                context,
                icon: Icons.phone_iphone,
                label: 'Tiếp tục bằng số điện thoại',
                onTap: () {
                  // placeholder action
                  _showSnack(context, 'Tiếp tục bằng số điện thoại');
                },
              ),
              const SizedBox(height: 12),

              _buildOutlineButton(
                context,
                iconData: FontAwesomeIcons.google,
                label: 'Tiếp tục bằng Google',
                onTap: () => _showSnack(context, 'Tiếp tục bằng Google'),
              ),
              const SizedBox(height: 12),

              _buildOutlineButton(
                context,
                iconData: FontAwesomeIcons.facebook,
                label: 'Tiếp tục bằng Facebook',
                onTap: () => _showSnack(context, 'Tiếp tục bằng Facebook'),
              ),
              const SizedBox(height: 12),

              _buildOutlineButton(
                context,
                iconData: FontAwesomeIcons.apple,
                label: 'Tiếp tục bằng Apple',
                onTap: () => _showSnack(context, 'Tiếp tục bằng Apple'),
              ),

              const Spacer(),

              // bottom text: "Bạn chưa có tài khoản? Đăng ký"
              Column(
                children: [
                  const Text(
                    'Bạn chưa có tài khoản?',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      // chuyển đến promo page (màn hình tạo tài khoản / quảng bá)
                      Navigator.pushNamed(context, '/promo');
                    },
                    child: const Text(
                      'Đăng ký',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  // nút màu xanh lớn
  Widget _buildPrimaryButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color backgroundColor,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, color: Colors.black),
        label: Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  // nút outline (transparent) với viền trắng
  Widget _buildOutlineButton(
    BuildContext context, {
    IconData? icon,
    IconData? iconData,
    required String label,
    required VoidCallback onTap,
  }) {
    final showIcon = icon ?? iconData ?? Icons.circle;
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: OutlinedButton.icon(
        onPressed: onTap,
        icon: Icon(showIcon, color: Colors.white),
        label: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.white38, width: 1.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }

  void _showSnack(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
