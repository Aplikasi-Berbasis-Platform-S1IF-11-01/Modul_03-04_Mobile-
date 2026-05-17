import 'package:flutter/material.dart';

void main() {
  runApp(const EduKidsApp());
}

class EduKidsApp extends StatelessWidget {
  const EduKidsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Film Edukasi Anak',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[50],
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Data array untuk ListView.builder
  final List<Map<String, String>> filmList = [
    {'title': 'Petualangan Luar Angkasa', 'subtitle': 'Belajar Tata Surya'},
    {'title': 'Mengenal Dinosaurus', 'subtitle': 'Sejarah Hewan Purba'},
    {'title': 'Mari Berhitung', 'subtitle': 'Matematika Dasar'},
    {'title': 'Dunia Bawah Laut', 'subtitle': 'Ikan dan Terumbu Karang'},
  ];

  // Data array untuk ListView.separated
  final List<String> ageCategories = [
    'PAUD (3-5 Tahun)',
    'TK (5-6 Tahun)',
    'SD (7-12 Tahun)',
  ];

  // Data array untuk GridView (Minimal 6 Item)
  final List<Map<String, dynamic>> categories = [
    {'title': 'Sains', 'icon': Icons.science, 'color': Colors.blue[100]},
    {'title': 'Berhitung', 'icon': Icons.calculate, 'color': Colors.orange[100]},
    {'title': 'Hewan', 'icon': Icons.pets, 'color': Colors.green[100]},
    {'title': 'Bahasa', 'icon': Icons.abc, 'color': Colors.red[100]},
    {'title': 'Sejarah', 'icon': Icons.account_balance, 'color': Colors.purple[100]},
    {'title': 'Seni', 'icon': Icons.palette, 'color': Colors.pink[100]},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EduKids - Film Edukasi', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.indigo,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==========================================
            // 6. STACK (Tampilan Bertumpuk)
            // ==========================================
            const SectionTitle(title: 'Film Pilihan Hari Ini (Stack)'),
            SizedBox(
              width: double.infinity,
              height: 180,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: [Colors.indigo[400]!, Colors.purple[400]!],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                  Positioned(
                    right: -20,
                    top: -20,
                    child: Icon(Icons.play_circle_filled, size: 120, color: Colors.white.withOpacity(0.2)),
                  ),
                  const Positioned(
                    bottom: 20,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mengenal Tata Surya',
                          style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Episode 1 - Matahari',
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text('BARU', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ==========================================
            // 1. CONTAINER (Kotak Berwarna)
            // ==========================================
            const SectionTitle(title: 'Info Menarik (Container)'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.teal[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.teal[200]!),
              ),
              child: Row(
                children: [
                  Icon(Icons.lightbulb, color: Colors.teal[700]),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Tonton 3 film hari ini untuk mendapatkan Lencana Pintar!',
                      style: TextStyle(color: Colors.teal[800], fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ==========================================
            // 2. GRIDVIEW (Minimal 6 Item)
            // ==========================================
            const SectionTitle(title: 'Kategori Belajar (GridView)'),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.1,
              children: List.generate(categories.length, (index) {
                return Container(
                  decoration: BoxDecoration(
                    color: categories[index]['color'],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(categories[index]['icon'], size: 32, color: Colors.black54),
                      const SizedBox(height: 8),
                      Text(
                        categories[index]['title'],
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                    ],
                  ),
                );
              }),
            ),
            const SizedBox(height: 24),

            // ==========================================
            // 3. LISTVIEW (3 Item - A, B, C)
            // ==========================================
            const SectionTitle(title: 'Sedang Populer (ListView 3 Item)'),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildPopularCard('Belajar Huruf', Colors.red[100]!, Icons.abc),
                  _buildPopularCard('Angka 1-10', Colors.blue[100]!, Icons.onetwothree),
                  _buildPopularCard('Warna Warni', Colors.green[100]!, Icons.color_lens),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ==========================================
            // 4. LISTVIEW.BUILDER (List dari data array)
            // ==========================================
            const SectionTitle(title: 'Rekomendasi Film (ListView.builder)'),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filmList.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.grey[200]!)
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.indigo[50],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Icons.movie, color: Colors.indigo[300]),
                    ),
                    title: Text(filmList[index]['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(filmList[index]['subtitle']!),
                    trailing: Icon(Icons.play_arrow, color: Colors.indigo[400]),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),

            // ==========================================
            // 5. LISTVIEW.SEPARATED (List + Garis pembatas)
            // ==========================================
            const SectionTitle(title: 'Berdasarkan Umur (ListView.separated)'),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: ageCategories.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.face, color: Colors.orange),
                    title: Text(ageCategories[index], style: const TextStyle(fontWeight: FontWeight.w500)),
                    trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(height: 1, indent: 16, endIndent: 16);
                },
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Widget custom untuk dipakai di nomor 3 (ListView)
  Widget _buildPopularCard(String title, Color color, IconData icon) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: Colors.black54, size: 30),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}

// Widget untuk judul setiap bagian
class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey[700]),
      ),
    );
  }
}