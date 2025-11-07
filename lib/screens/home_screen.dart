import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../screens/artist_detail_screen.dart';
import 'dart:ui';

const kBackground = Color(0xFF121212);
const kAccentGreen = Color(0xFF1DB954);

class HomeScreen extends StatefulWidget {
  final void Function(String title, String artist)? onSongSelected;

  const HomeScreen({Key? key, this.onSongSelected}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String activeTab = 'all'; // Theo dõi tab đang chọn

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 90),
          children: [
            // 🔹 Tabs (All / Music / Podcast)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => setState(() => activeTab = 'all'),
                    child: _chip('all', active: activeTab == 'all'),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () => setState(() => activeTab = 'music_tab'),
                    child: _chip('music_tab', active: activeTab == 'music_tab'),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () => setState(() => activeTab = 'podcast'),
                    child: _chip('podcast', active: activeTab == 'podcast'),
                  ),
                ],
              ),
            ),

            // 🔹 Nội dung thay đổi theo tab
            if (activeTab == 'all') _buildAllTab(context, screenWidth),
            if (activeTab == 'music_tab') _buildMusicTab(context),
            if (activeTab == 'podcast') _buildPodcastTab(context),
          ],
        ),
      ),
    );
  }

  //Tab All - Trang chủ
  Widget _buildAllTab(BuildContext context, double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('popular_radio'),
        SizedBox(
          height: 150,
          child: ScrollConfiguration(
            behavior: MyCustomScrollBehavior(),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (c, i) =>
                  SizedBox(width: screenWidth * 0.4, child: _radioCard(i)),
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemCount: 6,
            ),
          ),
        ),

        _sectionTitle('famous_album'),
        SizedBox(
          height: 230,
          child: ScrollConfiguration(
            behavior: MyCustomScrollBehavior(),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (c, i) =>
                  SizedBox(width: screenWidth * 0.5, child: _albumCard(i)),
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemCount: 6,
            ),
          ),
        ),

        _sectionTitle('popular_artist'),
        SizedBox(
          height: 140,
          child: ScrollConfiguration(
            behavior: MyCustomScrollBehavior(),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (c, i) => SizedBox(
                width: screenWidth * 0.33,
                child: _artistCircle(context, i),
              ),
              separatorBuilder: (_, __) => const SizedBox(width: 14),
              itemCount: 6,
            ),
          ),
        ),

        _sectionTitle('Top Songs'),
        _topSongsList(context),
      ],
    );
  }

  // Tab Music
  Widget _buildMusicTab(BuildContext context) {
    final songs = [
      {'title': 'Nàng thơ', 'artist': 'Hoàng Dũng'},
      {'title': '3107-3', 'artist': 'W/n ft. Nâu, Duongg'},
      {'title': 'Em của ngày hôm qua', 'artist': 'Sơn Tùng M-TP'},
      {'title': 'Hẹn em ở lần yêu thứ 2', 'artist': 'Nguyên Hà'},
      {'title': 'Chạy ngay đi', 'artist': 'Sơn Tùng M-TP'},
      {'title': 'Bùa yêu', 'artist': 'Bích Phương'},
      {'title': 'Cơn mưa ngang qua', 'artist': 'Sơn Tùng M-TP'},
      {'title': 'Đừng hỏi em', 'artist': 'Sơn Tùng M-TP'},
      {'title': 'Lạc trôi', 'artist': 'Sơn Tùng M-TP'},
      {'title': 'Nơi này có anh', 'artist': 'Sơn Tùng M-TP'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('List of Songs'),
        ...songs.map((song) {
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://picsum.photos/60?random=${song['title']}',
                width: 55,
                height: 55,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              song['title']!,
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              song['artist']!,
              style: const TextStyle(color: Colors.white70),
            ),
            trailing: const Icon(
              Icons.play_circle_fill,
              color: kAccentGreen,
              size: 36,
            ),
            onTap: () {
              if (widget.onSongSelected != null) {
                widget.onSongSelected!(song['title']!, song['artist']!);
              }
            },
          );
        }),
      ],
    );
  }

  // Tab Podcast
  Widget _buildPodcastTab(BuildContext context) {
    final podcasts = [
      {'title': 'Tâm sự tuổi 20', 'host': 'Podcast Việt'},
      {'title': 'Học cách hạnh phúc', 'host': 'Radio Online'},
      {'title': 'Cà phê sáng', 'host': 'Nguyễn Văn A'},
      {'title': 'Cuộc sống và công việc', 'host': 'WorkLife Podcast'},
      {'title': 'Chuyện phiếm cuối tuần', 'host': 'Talk Show'},
      {'title': 'Âm nhạc và cuộc sống', 'host': 'Music Pod'},
      {'title': 'Khám phá bản thân', 'host': 'Self Discovery'},
      {'title': 'Kỹ năng sống', 'host': 'Life Skills'},
      {'title': 'Du lịch và ẩm thực', 'host': 'Travel & Food'},
      {'title': 'Công nghệ mỗi ngày', 'host': 'Tech Daily'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('List of Podcasts'),
        ...podcasts.map((podcast) {
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://picsum.photos/60?random=${podcast['title']}',
                width: 55,
                height: 55,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              podcast['title']!,
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              podcast['host']!,
              style: const TextStyle(color: Colors.white70),
            ),
            trailing: const Icon(Icons.podcasts, color: kAccentGreen, size: 36),
          );
        }),
      ],
    );
  }

  Widget _sectionTitle(String text) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
    child: Text(
      text.tr(),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  Widget _chip(String key, {bool active = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: active ? kAccentGreen : Colors.white12,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        key.tr(),
        style: TextStyle(color: active ? Colors.black : Colors.white),
      ),
    );
  }

  Widget _radioCard(int i) {
    final List<String> images = [
      'https://tse1.mm.bing.net/th/id/OIP.q2YsgHsjuMWvKbVbnp-aJwHaHa?rs=1&pid=ImgDetMain&o=7&rm=3',
      'https://th.bing.com/th/id/OIP.d_9kwlT2LsmSadbD5HGwuAHaJQ?o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3',
      'https://th.bing.com/th/id/OIP.-R-2wjzFr6Hvl0EkgqhpOgHaNJ?&rs=1&pid=ImgDetMain&o=7&rm=3',
      'https://i.pinimg.com/originals/ae/71/87/ae71874a19700a7e9480d23a3f10e24b.jpg',
      'https://images.saatchiart.com/saatchi/1187147/art/9281283/8344391-PKLONXAY-7.jpg',
      'https://i1.sndcdn.com/avatars-000184193905-uxl3jy-t500x500.jpg',
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 36,
            backgroundImage: NetworkImage(images[i % images.length]),
          ),
          const SizedBox(height: 8),
          Text(
            'Radio ${i + 1}',
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
    return Column(
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage('https://picsum.photos/200?random=$i'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Tên album',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const Text('Nghệ sĩ', style: TextStyle(color: Colors.white70)),
      ],
    );
  }

  Widget _artistCircle(BuildContext context, int i) {
    // Dữ liệu nghệ sĩ: gồm tên + link ảnh (dễ thay đổi hoặc cập nhật sau này)
    final List<Map<String, String>> artists = [
      {
        'name': 'Sơn Tùng M-TP',
        'imageUrl':
            'https://media-cdn-v2.laodong.vn/Storage/NewsPortal/2021/1/26/874469/Son-Tung-Dep-Trai-5..jpg',
      },
      {
        'name': 'Đen Vâu',
        'imageUrl':
            'https://tse2.mm.bing.net/th/id/OIP.ftMcPMs6YwF9UaY78bonkwHaE7?rs=1&pid=ImgDetMain&o=7&rm=3',
      },
      {
        'name': 'Hoàng Thùy Linh',
        'imageUrl':
            'https://th.bing.com/th/id/R.58e533f8cbdd116425a96a2562a204d1?rik=vJ9pnHzq3qeGtQ&pid=ImgRaw&r=0',
      },
      {
        'name': 'Mono',
        'imageUrl':
            'https://tse2.mm.bing.net/th/id/OIP.t2ZUTv0So2I8rZJVMrYBPQHaEt?rs=1&pid=ImgDetMain&o=7&rm=3',
      },
      {
        'name': 'AMEE',
        'imageUrl':
            'https://channel.mediacdn.vn/428462621602512896/2024/6/12/photo-1-17181659261151173162103.jpg',
      },
      {
        'name': 'Vũ',
        'imageUrl':
            'https://nld.mediacdn.vn/291774122806476800/2022/9/17/anh-chup-man-hinh-2022-09-17-luc-141150-1663399106583640943036.png',
      },
    ];

    // Lấy nghệ sĩ hiện tại (dựa vào chỉ số i)
    final artist = artists[i % artists.length];

    // Khi bấm vào ảnh thì chuyển sang màn hình chi tiết nghệ sĩ
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ArtistDetailScreen(
              artistName: artist['name']!,
              imageUrl: artist['imageUrl']!,
            ),
          ),
        );
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(artist['imageUrl']!),
          ),
          const SizedBox(height: 8),
          Text(artist['name']!, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _topSongsList(BuildContext context) {
    final songs = [
      {'title': 'Bật nó lên', 'artist': 'SOOBIN'},
      {'title': 'Tháng mấy em nhớ anh', 'artist': 'Hà Anh Tuấn'},
      {'title': 'Waiting For You', 'artist': 'MONO'},
      {'title': 'Lạ lùng', 'artist': 'Vũ'},
      {'title': 'Em không thể', 'artist': 'MIN'},
      {'title': 'Anh nhà ở đâu thế', 'artist': 'AMEE'},
      {'title': 'Nàng thơ', 'artist': 'Hoàng Dũng'},
      {'title': '3107-3', 'artist': 'W/n ft. Nâu, Duongg'},
      {'title': 'Em của ngày hôm qua', 'artist': 'Sơn Tùng M-TP'},
      {'title': 'Hẹn em ở lần yêu thứ 2', 'artist': 'Nguyên Hà'},
    ];

    return Column(
      children: List.generate(songs.length, (index) {
        final song = songs[index];
        return ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              'https://picsum.photos/60?random=$index',
              width: 55,
              height: 55,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            song['title']!,
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            song['artist']!,
            style: const TextStyle(color: Colors.white70),
          ),
          trailing: const Icon(
            Icons.play_circle_fill,
            color: kAccentGreen,
            size: 36,
          ),
          onTap: () {
            if (widget.onSongSelected != null) {
              widget.onSongSelected!(song['title']!, song['artist']!);
            }
          },
        );
      }),
    );
  }
}

///Cho phép kéo ngang trên mobile & web
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
