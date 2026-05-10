import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modul 03 04 Mobile_2311102138_Rico Ade Pratama',
      debugShowCheckedModeBanner: false,
      // Menggunakan tema gelap (Dark Mode) agar lebih sporty dan modern
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: Colors.amberAccent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E2C),
          elevation: 0,
          centerTitle: true,
        ),
      ),
      home: const HomePage(),
    );
  }
}

// ─────────────────────────────────────────
// Data untuk ListView.builder (Tema Klub Sepak Bola)
// ─────────────────────────────────────────
final List<Map<String, dynamic>> clubList = [
  {
    'nama': 'Real Madrid',
    'logo': '👑',
    'warna': Colors.amber,
    'liga': 'La Liga',
  },
  {
    'nama': 'Liverpool',
    'logo': '🦅',
    'warna': Colors.redAccent,
    'liga': 'Premier League',
  },
  {
    'nama': 'Barcelona',
    'logo': '🔴',
    'warna': Colors.blueAccent,
    'liga': 'La Liga',
  },
  {
    'nama': 'Man City',
    'logo': '🌊',
    'warna': Colors.lightBlue,
    'liga': 'Premier League',
  },
  {
    'nama': 'Bayern Munich',
    'logo': '⭐',
    'warna': Colors.red,
    'liga': 'Bundesliga',
  },
  {
    'nama': 'AC Milan',
    'logo': '👹',
    'warna': Colors.red.shade900,
    'liga': 'Serie A',
  },
];

// ─────────────────────────────────────────
// HomePage — semua widget di satu halaman
// ─────────────────────────────────────────
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '⚽ Football FC App Rico',
          style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.2),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ══════════════════════════════
            // 1. CONTAINER (Statistik Pemain)
            // ══════════════════════════════
            _sectionTitle('1. Container (Player Stats)'),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatContainer('Pace', '92', Colors.blue),
                _buildStatContainer('Shoot', '88', Colors.red),
                _buildStatContainer('Pass', '90', Colors.green),
              ],
            ),

            const SizedBox(height: 32),

            // ══════════════════════════════
            // 2. GRIDVIEW (Menu Aplikasi Sepak Bola)
            // ══════════════════════════════
            _sectionTitle('2. GridView (6 Menu Fanbase)'),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.0,
              children: [
                _gridItem('🏆', 'Trophies', Colors.amber),
                _gridItem('🏟️', 'Stadium', Colors.green),
                _gridItem('👕', 'Kits', Colors.blue),
                _gridItem('👟', 'Boots', Colors.orange),
                _gridItem('📺', 'Live', Colors.red),
                _gridItem('📰', 'News', Colors.purple),
              ],
            ),

            const SizedBox(height: 32),

            // ══════════════════════════════
            // 3. LISTVIEW (3 item statis: Match Ikonik)
            // ══════════════════════════════
            _sectionTitle('3. ListView (Derby Matches)'),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E2C),
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  ListTile(
                    leading: Icon(Icons.whatshot, color: Colors.orange),
                    title: Text(
                      'El Clásico',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Real Madrid vs Barcelona'),
                  ),
                  Divider(height: 1, color: Colors.white10),
                  ListTile(
                    leading: Icon(Icons.whatshot, color: Colors.red),
                    title: Text(
                      'North West Derby',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Liverpool vs Man United'),
                  ),
                  Divider(height: 1, color: Colors.white10),
                  ListTile(
                    leading: Icon(Icons.whatshot, color: Colors.blue),
                    title: Text(
                      'Milan Derby',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('AC Milan vs Inter Milan'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // ══════════════════════════════
            // 4. LISTVIEW.BUILDER (Daftar Klub)
            // ══════════════════════════════
            _sectionTitle('4. ListView.builder (Top Clubs)'),
            const SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: clubList.length,
              itemBuilder: (context, index) {
                final club = clubList[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1E2C),
                    borderRadius: BorderRadius.circular(12),
                    border: Border(
                      left: BorderSide(color: club['warna'], width: 6),
                    ),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    leading: CircleAvatar(
                      backgroundColor: (club['warna'] as Color).withOpacity(
                        0.2,
                      ),
                      child: Text(
                        club['logo'],
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    title: Text(
                      club['nama'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      club['liga'],
                      style: const TextStyle(color: Colors.white60),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.white30,
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            // ══════════════════════════════
            // 5. LISTVIEW.SEPARATED (Jadwal Liga)
            // ══════════════════════════════
            _sectionTitle('5. ListView.separated (Match Schedule)'),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E2C),
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                separatorBuilder: (context, index) => const Divider(
                  color: Colors.white10,
                  thickness: 1,
                  indent: 16,
                  endIndent: 16,
                ),
                itemBuilder: (context, index) {
                  final days = [
                    'Sabtu, 20:00',
                    'Minggu, 15:00',
                    'Minggu, 22:30',
                    'Rabu, 02:45',
                  ];
                  final teams = [
                    'LIVERPOOL vs MANCHESTER UNITED',
                    'REAL MADRID vs BARCELONA',
                    'MANCHESTER CITY vs ARSENAL',
                    'BAYERN MUNICH vs DORTMUND',
                  ];
                  return ListTile(
                    leading: const Icon(
                      Icons.sports_soccer,
                      color: Colors.amber,
                    ),
                    title: Text(
                      teams[index],
                      style: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                    subtitle: Text(
                      days[index],
                      style: const TextStyle(color: Colors.amberAccent),
                    ),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Live',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 32),

            // ══════════════════════════════
            // 6. STACK (Tiket VIP Pertandingan)
            // ══════════════════════════════
            _sectionTitle('6. Stack (VIP Match Ticket)'),
            const SizedBox(height: 12),
            Center(
              child: SizedBox(
                width: double.infinity,
                height: 220,
                child: Stack(
                  children: [
                    // Layer 1: Background Gradient Card
                    Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFB8860B),
                            Color(0xFFFFD700),
                          ], // Warna Gold
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.amber.withOpacity(0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                    ),
                    // Layer 2: Ornamen Abstrak (Lingkaran)
                    Positioned(
                      right: -30,
                      top: -30,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    // Layer 3: Watermark Bola Besar
                    Positioned(
                      left: -20,
                      bottom: -20,
                      child: Icon(
                        Icons.sports_soccer,
                        size: 140,
                        color: Colors.black.withOpacity(0.05),
                      ),
                    ),
                    // Layer 4: Konten Teks
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'CHAMPIONS LEAGUE',
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'MATCH OF THE DAY',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              const Icon(
                                Icons.stadium,
                                color: Colors.black87,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'Anfield Stadium',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Layer 5: Badge VIP di pojok kanan atas
                    Positioned(
                      top: 16,
                      right: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'VIP PASS',
                          style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────
  // Helper Widgets
  // ─────────────────────────────────────────

  // Helper untuk Judul Section
  Widget _sectionTitle(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(8),
        border: const Border(left: BorderSide(color: Colors.amber, width: 4)),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  // Helper untuk Container Statistik
  Widget _buildStatContainer(String label, String value, Color color) {
    return Container(
      width: 105,
      height: 105,
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E2C),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.5), width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 28,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Helper untuk Item GridView
  Widget _gridItem(String emoji, String label, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E2C),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 32)),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w800,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
