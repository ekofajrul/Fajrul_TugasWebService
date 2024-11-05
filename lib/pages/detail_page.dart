import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Saya', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal[600],
        centerTitle: true,
      ),
      body: Container(
        color: Colors.lightGreen[50], // Latar belakang lebih lembut
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'Eko Fajrul Falah',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[800],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Mahasiswa Informatika | Semester 5',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.teal[600],
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Gambar profil dengan shadow dan animasi hover kecil
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                        image: const DecorationImage(
                          image: AssetImage('assets/images/Gambar WhatsApp 2024-10-29 pukul 15.36.28_e58671d1.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.white,
                    child: const Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: const Text(
                        'Saya merupakan mahasiswa informatika semester 5 yang bercita-cita menjadi programmer. Saya tertarik dengan dunia pengembangan aplikasi mobile dan web serta senang belajar hal baru dalam teknologi.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Bagian hobi dengan judul dan ListView statis
                  Text(
                    'Hobi Saya:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[700],
                    ),
                  ),
                  const SizedBox(height: 10),

                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      List<String> hobbies = [
                        'Belajar pemrograman',
                        'Membaca artikel teknologi',
                        'Bermain game strategi',
                      ];

                      List<IconData> hobbyIcons = [
                        Icons.code,
                        Icons.article,
                        Icons.videogame_asset,
                      ];

                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          leading: Icon(hobbyIcons[index], color: Colors.teal[700]),
                          title: Text(
                            hobbies[index],
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Hubungi Saya'),
                          content: const Text('Email: ekofajrul06@gmail.com\nTelp: +62 858-8645-8031'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Tutup'),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(Icons.contact_mail),
                    label: const Text('Hubungi Saya'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[600],
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
