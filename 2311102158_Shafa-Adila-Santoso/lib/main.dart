import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shafa-Adila-Santoso - 2311102158',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2196F3)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Data untuk ListView.builder
  static const List<Map<String, String>> mahasiswaList = [
    {'nama': 'Shafa', 'nim': '2311102158'},
    {'nama': 'Adila', 'nim': '2311102158'},
    {'nama': 'Santoso', 'nim': '2311102158'},
  ];

  // Data untuk ListView.separated (menggunakan 3 data dari atas)
  static const List<String> menuList = ['Shafa', 'Adila', 'Santoso'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2196F3),
        foregroundColor: Colors.white,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shafa Adila Santoso — 2311102158',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'Praktikum Flutter — Modul 3 & 4',
              style: TextStyle(fontSize: 11, color: Colors.white70),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─────────────────────────────────────
            // 1. CONTAINER
            // ─────────────────────────────────────
            const SectionHeader(number: '1', title: 'Container'),
            const SizedBox(height: 10),

            Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: const Color(0xFF2196F3),
                borderRadius: BorderRadius.circular(14),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Container',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 28),

            // ─────────────────────────────────────
            // 2. GRIDVIEW
            // ─────────────────────────────────────
            const SectionHeader(number: '2', title: 'GridView'),
            const SizedBox(height: 10),

            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _gridItem('Item 1', Icons.star, const Color(0xFF2196F3)),
                _gridItem('Item 2', Icons.favorite, const Color(0xFF2196F3)),
                _gridItem('Item 3', Icons.bolt, const Color(0xFF2196F3)),
                _gridItem('Item 4', Icons.cloud, const Color(0xFF2196F3)),
                _gridItem('Item 5', Icons.music_note, const Color(0xFF2196F3)),
                _gridItem(
                  'Item 6',
                  Icons.rocket_launch,
                  const Color(0xFF2196F3),
                ),
              ],
            ),

            const SizedBox(height: 28),

            // ─────────────────────────────────────
            // 3. LISTVIEW (statis A, B, C)
            // ─────────────────────────────────────
            const SectionHeader(number: '3', title: 'ListView (Statis)'),
            const SizedBox(height: 10),

            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _listStaticItem('A', 'Item A', const Color(0xFF2196F3)),
                const SizedBox(height: 8),
                _listStaticItem('B', 'Item B', const Color(0xFF2196F3)),
                const SizedBox(height: 8),
                _listStaticItem('C', 'Item C', const Color(0xFF2196F3)),
              ],
            ),

            const SizedBox(height: 28),

            // ─────────────────────────────────────
            // 4. LISTVIEW.BUILDER
            // ─────────────────────────────────────
            const SectionHeader(number: '4', title: 'ListView.builder'),
            const SizedBox(height: 10),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: mahasiswaList.length,
              itemBuilder: (context, index) {
                final color = const Color(0xFF2196F3);
                final data = mahasiswaList[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: color.withOpacity(0.3)),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: color,
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(
                      data['nama']!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                    subtitle: Text(
                      'NIM: ${data['nim']}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 28),

            // ─────────────────────────────────────
            // 5. LISTVIEW.SEPARATED
            // ─────────────────────────────────────
            const SectionHeader(number: '5', title: 'ListView.separated'),
            const SizedBox(height: 10),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: menuList.length,
                separatorBuilder: (context, index) => Divider(
                  height: 1,
                  color: const Color(0xFF2196F3).withOpacity(0.15),
                  indent: 56,
                ),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2196F3).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2196F3),
                        ),
                      ),
                    ),
                    title: Text(
                      menuList[index],
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 28),

            // ─────────────────────────────────────
            // 6. STACK
            // ─────────────────────────────────────
            const SectionHeader(number: '6', title: 'Stack'),
            const SizedBox(height: 10),

            // Stack 2: Kotak bertumpuk
            Center(
              child: SizedBox(
                width: 220,
                height: 180,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 210,
                      height: 170,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2196F3).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 120,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2196F3).withOpacity(0.45),
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    Container(
                      width: 90,
                      height: 70,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2196F3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const Text(
                      'STACK',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        letterSpacing: 3,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // ── Helper: Grid Item ──
  Widget _gridItem(String label, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withOpacity(0.35)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  // ── Helper: ListView Statis Item ──
  Widget _listStaticItem(String letter, String title, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Text(
              letter,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────
// Reusable Section Header
// ─────────────────────────────────────
class SectionHeader extends StatelessWidget {
  final String number;
  final String title;

  const SectionHeader({super.key, required this.number, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: const BoxDecoration(
            color: Color(0xFF2196F3),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            number,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2D2D2D),
          ),
        ),
        const SizedBox(width: 10),
        const Expanded(child: Divider(color: Color(0xFFDDDDDD), thickness: 1)),
      ],
    );
  }
}
