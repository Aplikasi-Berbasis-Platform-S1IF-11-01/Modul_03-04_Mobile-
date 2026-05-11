import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Showcase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C63FF),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const WidgetShowcasePage(),
    );
  }
}

// ─────────────────────────────────────────────
//  Data untuk ListView.builder
// ─────────────────────────────────────────────
final List<Map<String, dynamic>> buahList = [
  {'nama': 'Apel', 'emoji': '🍎', 'warna': Color(0xFFFF6B6B)},
  {'nama': 'Pisang', 'emoji': '🍌', 'warna': Color(0xFFFFD93D)},
  {'nama': 'Mangga', 'emoji': '🥭', 'warna': Color(0xFFFF8C00)},
  {'nama': 'Anggur', 'emoji': '🍇', 'warna': Color(0xFF9B59B6)},
  {'nama': 'Stroberi', 'emoji': '🍓', 'warna': Color(0xFFE91E63)},
];

// ─────────────────────────────────────────────
//  Halaman Utama
// ─────────────────────────────────────────────
class WidgetShowcasePage extends StatelessWidget {
  const WidgetShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A2E),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          ' Widget Showcase',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2),
          child: Container(
            height: 2,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF6C63FF), Color(0xFFFF6584)],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── 1. CONTAINER ──────────────────────────────
            _SectionHeader(title: '1. Container', emoji: '📦'),
            const SizedBox(height: 10),
            _ContainerSection(),
            const SizedBox(height: 24),

            // ── 2. GRIDVIEW ───────────────────────────────
            _SectionHeader(title: '2. GridView', emoji: '🔲'),
            const SizedBox(height: 10),
            _GridViewSection(),
            const SizedBox(height: 24),

            // ── 3. LISTVIEW ───────────────────────────────
            _SectionHeader(title: '3. ListView', emoji: '📋'),
            const SizedBox(height: 10),
            _ListViewSection(),
            const SizedBox(height: 24),

            // ── 4. LISTVIEW.BUILDER ───────────────────────
            _SectionHeader(title: '4. ListView.builder', emoji: '🔨'),
            const SizedBox(height: 10),
            _ListViewBuilderSection(),
            const SizedBox(height: 24),

            // ── 5. LISTVIEW.SEPARATED ─────────────────────
            _SectionHeader(title: '5. ListView.separated', emoji: '📏'),
            const SizedBox(height: 10),
            _ListViewSeparatedSection(),
            const SizedBox(height: 24),

            // ── 6. STACK ──────────────────────────────────
            _SectionHeader(title: '6. Stack', emoji: '🗂️'),
            const SizedBox(height: 10),
            _StackSection(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  Helper: Section Header
// ─────────────────────────────────────────────
class _SectionHeader extends StatelessWidget {
  final String title;
  final String emoji;
  const _SectionHeader({required this.title, required this.emoji});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 18)),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF6C63FF),
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            height: 1,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF6C63FF), Colors.transparent],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
//  1. CONTAINER
// ─────────────────────────────────────────────
class _ContainerSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Kotak berwarna biasa
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            color: const Color(0xFF6C63FF),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF6C63FF).withOpacity(0.4),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Center(
            child: Text(
              'Ungu',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        // Kotak dengan gradient
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFFF6584), Color(0xFFFF8C00)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFF6584).withOpacity(0.4),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Center(
            child: Text(
              'Gradient',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        // Kotak dengan border
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF43E97B), width: 3),
          ),
          child: const Center(
            child: Text(
              'Border',
              style: TextStyle(
                color: Color(0xFF43E97B),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
//  2. GRIDVIEW
// ─────────────────────────────────────────────
class _GridViewSection extends StatelessWidget {
  final List<Map<String, dynamic>> gridItems = const [
    {'icon': Icons.home_rounded, 'label': 'Home', 'color': Color(0xFF6C63FF)},
    {'icon': Icons.favorite_rounded, 'label': 'Favorit', 'color': Color(0xFFFF6584)},
    {'icon': Icons.star_rounded, 'label': 'Bintang', 'color': Color(0xFFFFD93D)},
    {'icon': Icons.music_note_rounded, 'label': 'Musik', 'color': Color(0xFF43E97B)},
    {'icon': Icons.camera_alt_rounded, 'label': 'Kamera', 'color': Color(0xFF38B2FC)},
    {'icon': Icons.settings_rounded, 'label': 'Setelan', 'color': Color(0xFFFF8C00)},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      children: gridItems.map((item) {
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A2E),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: (item['color'] as Color).withOpacity(0.3),
              width: 1.5,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                item['icon'] as IconData,
                color: item['color'] as Color,
                size: 36,
              ),
              const SizedBox(height: 8),
              Text(
                item['label'] as String,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

// ─────────────────────────────────────────────
//  3. LISTVIEW (3 item: A, B, C)
// ─────────────────────────────────────────────
class _ListViewSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = [
      {'label': 'A', 'subtitle': 'Item Pertama', 'color': const Color(0xFF6C63FF)},
      {'label': 'B', 'subtitle': 'Item Kedua', 'color': const Color(0xFFFF6584)},
      {'label': 'C', 'subtitle': 'Item Ketiga', 'color': const Color(0xFF43E97B)},
    ];

    return SizedBox(
      height: 180,
      child: ListView(
        children: items.map((item) {
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A2E),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: (item['color'] as Color).withOpacity(0.4),
              ),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: item['color'] as Color,
                child: Text(
                  item['label'] as String,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              title: Text(
                'Item ${item['label']}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                item['subtitle'] as String,
                style: const TextStyle(color: Colors.white54),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: item['color'] as Color,
                size: 16,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  4. LISTVIEW.BUILDER
// ─────────────────────────────────────────────
class _ListViewBuilderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        itemCount: buahList.length,
        itemBuilder: (context, index) {
          final buah = buahList[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A2E),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: (buah['warna'] as Color).withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    buah['emoji'] as String,
                    style: const TextStyle(fontSize: 22),
                  ),
                ),
              ),
              title: Text(
                buah['nama'] as String,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                'Item ke-${index + 1} dari array',
                style: const TextStyle(color: Colors.white54, fontSize: 12),
              ),
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: (buah['warna'] as Color).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: (buah['warna'] as Color).withOpacity(0.6),
                  ),
                ),
                child: Text(
                  '#${index + 1}',
                  style: TextStyle(
                    color: buah['warna'] as Color,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  5. LISTVIEW.SEPARATED
// ─────────────────────────────────────────────
class _ListViewSeparatedSection extends StatelessWidget {
  final List<String> kota = ['Jakarta', 'Bandung', 'Surabaya', 'Medan'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.separated(
        itemCount: kota.length,
        separatorBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          height: 1,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Color(0xFF6C63FF),
                Colors.transparent,
              ],
            ),
          ),
        ),
        itemBuilder: (context, index) {
          return Container(
            color: Colors.transparent,
            child: ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF6C63FF), Color(0xFFFF6584)],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              title: Text(
                kota[index],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                'Kota ke-${index + 1} di Indonesia',
                style: const TextStyle(color: Colors.white54, fontSize: 12),
              ),
              trailing: const Icon(
                Icons.location_on_rounded,
                color: Color(0xFFFF6584),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  6. STACK
// ─────────────────────────────────────────────
class _StackSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          // Layer 1: Background kotak besar
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF1A1A2E), Color(0xFF16213E)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xFF6C63FF).withOpacity(0.3),
              ),
            ),
          ),

          // Layer 2: Kotak dekoratif kiri atas
          Positioned(
            top: -20,
            left: -20,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xFF6C63FF).withOpacity(0.2),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Layer 3: Kotak dekoratif kanan bawah
          Positioned(
            bottom: -20,
            right: -20,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xFFFF6584).withOpacity(0.15),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Layer 4: Badge pojok kanan atas
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFF6584), Color(0xFFFF8C00)],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                '🔥 Hot',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Layer 5: Konten utama di tengah
          Positioned.fill(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.layers_rounded,
                    color: Color(0xFF6C63FF),
                    size: 40,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Stack Widget',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Widget ditumpuk satu di atas yang lain',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Layer 6: Label pojok kiri bawah
          Positioned(
            bottom: 12,
            left: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0xFF43E97B).withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0xFF43E97B).withOpacity(0.5),
                ),
              ),
              child: const Text(
                '6 Layers',
                style: TextStyle(
                  color: Color(0xFF43E97B),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
