import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modul 4 - Flutter Widgets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4F46E5)),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const HomePage(),
    );
  }
}

// ─── Data untuk ListView.builder ───────────────────────────────────────────────
final List<Map<String, dynamic>> buahList = [
  {'nama': 'Mangga', 'emoji': '🥭', 'warna': Color(0xFFFFF3CD)},
  {'nama': 'Apel', 'emoji': '🍎', 'warna': Color(0xFFFFE0E0)},
  {'nama': 'Pisang', 'emoji': '🍌', 'warna': Color(0xFFFFFDE7)},
  {'nama': 'Jeruk', 'emoji': '🍊', 'warna': Color(0xFFFFECB3)},
  {'nama': 'Anggur', 'emoji': '🍇', 'warna': Color(0xFFEDE7F6)},
];

// ─── Home Page (Navigator) ──────────────────────────────────────────────────
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    DashboardPage(),
    ListViewPage(),
    StackPage(),
  ];

  final List<String> _titles = [
    'Container & GridView',
    'ListView Variants',
    'Stack Widget',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4F46E5),
        foregroundColor: Colors.white,
        title: Text(
          _titles[_selectedIndex],
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: Container(
            height: 4,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF818CF8), Color(0xFFA78BFA)],
              ),
            ),
          ),
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (i) => setState(() => _selectedIndex = i),
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFE0E7FF),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard, color: Color(0xFF4F46E5)),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.list_outlined),
            selectedIcon: Icon(Icons.list, color: Color(0xFF4F46E5)),
            label: 'ListView',
          ),
          NavigationDestination(
            icon: Icon(Icons.layers_outlined),
            selectedIcon: Icon(Icons.layers, color: Color(0xFF4F46E5)),
            label: 'Stack',
          ),
        ],
      ),
    );
  }
}

// ─── PAGE 1: Container + GridView ──────────────────────────────────────────────
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── CONTAINER SECTION ──────────────────────────────────────────
          _SectionHeader(
            title: '📦 Container',
            subtitle: 'Kotak berwarna dengan dekorasi',
          ),
          const SizedBox(height: 12),

          // Container 1 - Basic berwarna
          Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFF4F46E5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Text(
                'Container Biru',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Container 2 - Gradient
          Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFEC4899), Color(0xFFF97316)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFEC4899).withOpacity(0.4),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: const Center(
              child: Text(
                'Container Gradient',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Container 3 - Border + padding
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFF4F46E5), width: 2),
            ),
            child: const Row(
              children: [
                Icon(Icons.info_outline, color: Color(0xFF4F46E5)),
                SizedBox(width: 10),
                Text(
                  'Container dengan Border',
                  style: TextStyle(
                    color: Color(0xFF4F46E5),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // ── GRIDVIEW SECTION ───────────────────────────────────────────
          _SectionHeader(
            title: '🔲 GridView',
            subtitle: 'Minimal 6 item dalam grid',
          ),
          const SizedBox(height: 12),

          GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              _GridItem(emoji: '🔴', label: 'Merah', color: Color(0xFFFFE0E0)),
              _GridItem(emoji: '🟠', label: 'Oranye', color: Color(0xFFFFECB3)),
              _GridItem(emoji: '🟡', label: 'Kuning', color: Color(0xFFFFFDE7)),
              _GridItem(emoji: '🟢', label: 'Hijau', color: Color(0xFFE8F5E9)),
              _GridItem(emoji: '🔵', label: 'Biru', color: Color(0xFFE3F2FD)),
              _GridItem(emoji: '🟣', label: 'Ungu', color: Color(0xFFEDE7F6)),
            ],
          ),
        ],
      ),
    );
  }
}

class _GridItem extends StatelessWidget {
  final String emoji;
  final String label;
  final Color color;

  const _GridItem({
    required this.emoji,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 28)),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF374151),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── PAGE 2: ListView Variants ──────────────────────────────────────────────────
class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── LISTVIEW (3 item A, B, C) ──────────────────────────────────
          _SectionHeader(
            title: '📋 ListView',
            subtitle: '3 item statis (A, B, C)',
          ),
          const SizedBox(height: 12),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 10,
                ),
              ],
            ),
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                _StaticListTile(
                  label: 'A',
                  title: 'Item A',
                  subtitle: 'Ini adalah item pertama',
                ),
                Divider(height: 1, indent: 56),
                _StaticListTile(
                  label: 'B',
                  title: 'Item B',
                  subtitle: 'Ini adalah item kedua',
                ),
                Divider(height: 1, indent: 56),
                _StaticListTile(
                  label: 'C',
                  title: 'Item C',
                  subtitle: 'Ini adalah item ketiga',
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // ── LISTVIEW.BUILDER ────────────────────────────────────────────
          _SectionHeader(
            title: '🔨 ListView.builder',
            subtitle: 'List dari data array buah',
          ),
          const SizedBox(height: 12),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 10,
                ),
              ],
            ),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: buahList.length,
              itemBuilder: (context, index) {
                final buah = buahList[index];
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: buah['warna'],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Text(
                      buah['emoji'],
                      style: const TextStyle(fontSize: 28),
                    ),
                    title: Text(
                      buah['nama'],
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text('Index ke-$index'),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '#${index + 1}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4F46E5),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 24),

          // ── LISTVIEW.SEPARATED ──────────────────────────────────────────
          _SectionHeader(
            title: '📏 ListView.separated',
            subtitle: 'List dengan garis pembatas',
          ),
          const SizedBox(height: 12),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 10,
                ),
              ],
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: buahList.length,
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                thickness: 2,
                color: Color(0xFFEEF2FF),
                indent: 16,
                endIndent: 16,
              ),
              itemBuilder: (context, index) {
                final buah = buahList[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  leading: CircleAvatar(
                    backgroundColor: buah['warna'],
                    child: Text(buah['emoji']),
                  ),
                  title: Text(
                    buah['nama'],
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text('ListView.separated item'),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: Color(0xFF4F46E5),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _StaticListTile extends StatelessWidget {
  final String label;
  final String title;
  final String subtitle;

  const _StaticListTile({
    required this.label,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color(0xFF4F46E5),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 14,
        color: Colors.grey,
      ),
    );
  }
}

// ─── PAGE 3: Stack ──────────────────────────────────────────────────────────────
class StackPage extends StatelessWidget {
  const StackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(
            title: '🗂️ Stack Widget',
            subtitle: 'Tampilan widget bertumpuk',
          ),
          const SizedBox(height: 16),

          // ── Stack 1: Kotak bertumpuk ───────────────────────────────────
          const Text(
            'Stack 1 — Kotak Bertumpuk:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF374151),
            ),
          ),
          const SizedBox(height: 10),

          SizedBox(
            height: 200,
            width: double.infinity,
            child: Stack(
              children: [
                // Layer 1 - background
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: const Color(0xFF4F46E5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                // Layer 2 - kotak tengah
                Positioned(
                  top: 30,
                  left: 30,
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      color: const Color(0xFF818CF8).withOpacity(0.7),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                // Layer 3 - kotak kecil
                Positioned(
                  top: 60,
                  left: 60,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.layers,
                      color: Color(0xFF4F46E5),
                      size: 40,
                    ),
                  ),
                ),
                // Layer 4 - teks di atas
                const Positioned(
                  bottom: 20,
                  right: 20,
                  child: Text(
                    'Stack!\n3 Layer',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // ── Stack 2: Card dengan badge ────────────────────────────────
          const Text(
            'Stack 2 — Card dengan Badge:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF374151),
            ),
          ),
          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _BadgeCard(
                emoji: '🍎',
                label: 'Apel',
                badge: '5',
                color: const Color(0xFFFFE0E0),
                badgeColor: const Color(0xFFEF4444),
              ),
              _BadgeCard(
                emoji: '🥭',
                label: 'Mangga',
                badge: '12',
                color: const Color(0xFFFFF3CD),
                badgeColor: const Color(0xFFF97316),
              ),
              _BadgeCard(
                emoji: '🍇',
                label: 'Anggur',
                badge: '3',
                color: const Color(0xFFEDE7F6),
                badgeColor: const Color(0xFF7C3AED),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // ── Stack 3: Profile Card ─────────────────────────────────────
          const Text(
            'Stack 3 — Profile Card:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF374151),
            ),
          ),
          const SizedBox(height: 10),

          SizedBox(
            width: double.infinity,
            height: 180,
            child: Stack(
              children: [
                // Background banner
                Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Profil Mahasiswa',
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                // White card di bawah
                Positioned(
                  bottom: 0,
                  left: 80,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Rizal Dwi Anggoro',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'NIM: 2311102034',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
                // Avatar foto profile (tumpuk di atas keduanya)
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE0E7FF),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 34,
                      color: Color(0xFF4F46E5),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Info widget label
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFEEF2FF),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFC7D2FE)),
            ),
            child: const Row(
              children: [
                Icon(Icons.school, color: Color(0xFF4F46E5)),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Modul 4 Praktikum Flutter\nContainer • GridView • ListView • Stack',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF3730A3),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _BadgeCard extends StatelessWidget {
  final String emoji;
  final String label;
  final String badge;
  final Color color;
  final Color badgeColor;

  const _BadgeCard({
    required this.emoji,
    required this.label,
    required this.badge,
    required this.color,
    required this.badgeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(emoji, style: const TextStyle(fontSize: 32)),
              const SizedBox(height: 4),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        // Badge tumpuk di pojok kanan atas
        Positioned(
          top: -8,
          right: -8,
          child: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: badgeColor,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: Center(
              child: Text(
                badge,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ─── Reusable Section Header ────────────────────────────────────────────────────
class _SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const _SectionHeader({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E1B4B),
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 13, color: Colors.grey),
        ),
      ],
    );
  }
}
