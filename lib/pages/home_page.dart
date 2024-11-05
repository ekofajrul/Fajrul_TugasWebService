import 'package:flutter/material.dart';
import 'dart:ui'; // Impor untuk ImageFilter dan efek blur
import 'detail_page.dart';
import 'gallery_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background dengan efek blur
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Efek blur
              child: Container(color: Colors.black.withOpacity(0.3)),
            ),
          ),
          // Konten utama di atas background
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Judul Halaman
                Text(
                  'Welcome To My Profile',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                    shadows: <Shadow>[
                      Shadow(
                        offset: const Offset(3.0, 3.0),
                        blurRadius: 6.0,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),

                // Tombol Menu: Detail
                _buildMenuCard(
                  context,
                  icon: Icons.info,
                  title: 'Lihat Detail Tentang Saya',
                  color: Colors.blue,
                  destination: DetailPage(),
                ),
                const SizedBox(height: 20),

                // Tombol Menu: Galeri
                _buildMenuCard(
                  context,
                  icon: Icons.photo_album,
                  title: 'Lihat Galeri Foto',
                  color: Colors.green,
                  destination: GalleryPage(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget pembangun kartu menu
  Widget _buildMenuCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Color color,
    required Widget destination,
  }) {
    return Card(
      elevation: 12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Icon(icon, color: color, size: 32),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => destination,
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.ease;

                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
