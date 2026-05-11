import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Praktikum 4 - Bayu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Tema Hutan (Forest Palette)
        scaffoldBackgroundColor: const Color(0xFFF4F1EA), // Warna krem kayu pucat
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E7D32), // Hijau hutan tua
          primary: const Color(0xFF2E7D32),
          secondary: const Color(0xFF5D4037), // Cokelat kayu
        ),
        useMaterial3: true,
        fontFamily: 'Roboto', // Bisa diganti jika punya font custom
      ),
      home: const PraktikumPage(),
    );
  }
}

class PraktikumPage extends StatelessWidget {
  const PraktikumPage({super.key});

  // Data untuk ListView.builder (Disesuaikan sedikit dengan tema alam)
  final List<String> floraList = const [
    'Pohon Pinus',
    'Bunga Anggrek',
    'Pohon Jati',
    'Bambu Kuning',
    'Pakis Hutan',
  ];

  // Data untuk ListView.separated
  final List<String> faunaList = const [
    'Rusa Hutan',
    'Burung Hantu',
    'Tupai Terbang',
    'Harimau Sumatera',
    'Monyet Ekor Panjang',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dibuat transparan menyatu dengan background
      appBar: AppBar(
        title: const Text(
          'Praktikum Modul 4',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF2E7D32),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─────────────────────────────────────────
            // HEADER: IDENTITAS DIRI (KARTU PROFIL)
            // ─────────────────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF2E7D32), Color(0xFF4CAF50)], // Gradasi hijau
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white24,
                        child: Icon(Icons.person, size: 35, color: Colors.white),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Bayu Kuncoro Adi',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'NIM: 2311102031',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white70,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Divider(color: Colors.white30, height: 1),
                  ),
                  Row(
                    children: const [
                      Icon(Icons.school, color: Colors.white70, size: 18),
                      SizedBox(width: 8),
                      Text(
                        'S1 Teknik Informatika - Telkom Purwokerto',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // ─────────────────────────────────────────
            // 1. STACK & CONTAINER (TEMA KAYU & DAUN)
            // ─────────────────────────────────────────
            _sectionTitle('1. Stack (Tampilan Bertumpuk)', Icons.layers),
            const SizedBox(height: 12),
            SizedBox(
              height: 180,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Background Kayu
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      color: const Color(0xFF5D4037), // Cokelat Kayu
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 5))
                      ],
                    ),
                  ),
                  // Dekorasi Daun Kiri (Bertumpuk)
                  Positioned(
                    top: 0,
                    left: 20,
                    child: Container(
                      width: 60,
                      height: 80,
                      decoration: const BoxDecoration(
                        color: Color(0xFF81C784),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                      ),
                      child: const Icon(Icons.energy_savings_leaf, color: Colors.white),
                    ),
                  ),
                  // Kartu Info Tengah (Bertumpuk di atas kayu)
                  Positioned(
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: const Color(0xFF5D4037), width: 2),
                      ),
                      child: const Text(
                        'Widget Stack Berhasil!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5D4037),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 35),

            // ─────────────────────────────────────────
            // 2. GRIDVIEW (TEMA KOTAK ALAM)
            // ─────────────────────────────────────────
            _sectionTitle('2. GridView (Elemen Hutan)', Icons.grid_view_rounded),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.9, // Dibuat agak memanjang ke bawah
              children: List.generate(6, (index) {
                final colors = [
                  const Color(0xFF4CAF50), // Hijau
                  const Color(0xFF8BC34A), // Light Green
                  const Color(0xFFFF9800), // Orange Daun Kering
                  const Color(0xFF795548), // Cokelat
                  const Color(0xFF009688), // Teal Air Danau
                  const Color(0xFFCDDC39), // Lime
                ];
                final icons = [
                  Icons.park,
                  Icons.grass,
                  Icons.eco,
                  Icons.terrain,
                  Icons.water,
                  Icons.sunny,
                ];
                return Container(
                  decoration: BoxDecoration(
                    color: colors[index].withOpacity(0.15),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: colors[index].withOpacity(0.5), width: 2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(icons[index], color: colors[index], size: 36),
                      const SizedBox(height: 8),
                      Text(
                        'Item ${index + 1}',
                        style: TextStyle(
                          color: colors[index],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),

            const SizedBox(height: 35),

            // ─────────────────────────────────────────
            // 3. LISTVIEW BASIC (KARTU CUSTOM)
            // ─────────────────────────────────────────
            _sectionTitle('3. ListView (Statis)', Icons.view_list_rounded),
            const SizedBox(height: 12),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _customListCard('Zona A', 'Area Hutan Lindung', Icons.map, const Color(0xFF388E3C)),
                const SizedBox(height: 10),
                _customListCard('Zona B', 'Area Perkemahan', Icons.holiday_village, const Color(0xFFF57C00)),
                const SizedBox(height: 10),
                _customListCard('Zona C', 'Danau Tropis', Icons.sailing, const Color(0xFF0288D1)),
              ],
            ),

            const SizedBox(height: 35),

            // ─────────────────────────────────────────
            // 4. LISTVIEW.BUILDER (DATA ARRAY FLORA)
            // ─────────────────────────────────────────
            _sectionTitle('4. ListView.builder (Data Flora)', Icons.format_list_bulleted),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
              ),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: floraList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8F5E9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.local_florist, color: Color(0xFF2E7D32)),
                    ),
                    title: Text(
                      floraList[index],
                      style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF4E342E)),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
                  );
                },
              ),
            ),

            const SizedBox(height: 35),

            // ─────────────────────────────────────────
            // 5. LISTVIEW.SEPARATED (PEMBATAS CUSTOM)
            // ─────────────────────────────────────────
            _sectionTitle('5. ListView.separated (Data Fauna)', Icons.pets),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFFF3E0), // Latar belakang krem hangat
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFFFB74D)),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: faunaList.length,
                // Pembatas berupa Icon Daun di tengah Garis
                separatorBuilder: (context, index) => Row(
                  children: [
                    const Expanded(child: Divider(color: Color(0xFFFFB74D), indent: 20)),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(Icons.eco, size: 16, color: Color(0xFFFFB74D)),
                    ),
                    const Expanded(child: Divider(color: Color(0xFFFFB74D), endIndent: 20)),
                  ],
                ),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xFFFF9800),
                      child: Icon(Icons.cruelty_free, color: Colors.white),
                    ),
                    title: Text(
                      faunaList[index],
                      style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF5D4037)),
                    ),
                    subtitle: Text('Spesies ke-${index + 1}'),
                  );
                },
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // ===========================================================================
  // WIDGET HELPER BAWAHAN
  // ===========================================================================

  /// Helper untuk Judul Section agar seragam
  Widget _sectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF2E7D32), size: 24),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3E2723), // Cokelat sangat tua
          ),
        ),
      ],
    );
  }

  /// Helper untuk ListView Statis (Desain Border Kiri)
  Widget _customListCard(String title, String subtitle, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            border: Border(left: BorderSide(color: color, width: 6)),
          ),
          child: ListTile(
            leading: Icon(icon, color: color, size: 30),
            title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(subtitle),
            trailing: const Icon(Icons.chevron_right, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}