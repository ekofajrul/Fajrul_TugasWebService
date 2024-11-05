import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/images/Gambar WhatsApp 2023-11-01 pukul 15.14.21_1adac7a9.jpg',
    'assets/images/Gambar WhatsApp 2024-10-29 pukul 15.32.58_68e30431.jpg',
    'assets/images/agil2.jpg',
    'assets/images/agil3.jpg',
    'assets/images/Gambar WhatsApp 2024-10-29 pukul 15.36.28_5bc90252.jpg',
    'assets/images/Gambar WhatsApp 2024-10-29 pukul 15.36.28_e58671d1.jpg',
    'assets/images/agil6.jpg',
    'assets/images/Gambar WhatsApp 2024-10-29 pukul 15.36.28_9f28dfab.jpg',
    // Tambahkan lebih banyak gambar jika diperlukan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeri Foto', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal[600],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = constraints.maxWidth < 600 ? 2 : 4; // Responsif: 2 kolom di layar kecil, 4 kolom di besar
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: imagePaths.length,
              itemBuilder: (context, index) {
                return _buildGridItem(context, imagePaths[index]);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, String imagePath) {
    return GestureDetector(
      onTap: () => _showImagePreview(context, imagePath), // Menampilkan dialog saat gambar diklik
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(imagePath, fit: BoxFit.cover, cacheHeight: 300), // Lazy load dengan cache size
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showImagePreview(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              Image.asset(imagePath, fit: BoxFit.contain),
              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
