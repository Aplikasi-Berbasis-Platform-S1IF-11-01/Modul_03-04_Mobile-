import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modul 4 – Flutter Widgets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4F46E5),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const HomePage(),
    );
  }
}

// ─────────────────────────────────────────────
// HOME PAGE – TabBar navigator untuk tiap widget
// ─────────────────────────────────────────────
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF4F46E5),
          foregroundColor: Colors.white,
          title: const Text(
            'Modul 4 – Flutter Widgets',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          bottom: const TabBar(
            isScrollable: true,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            indicatorColor: Colors.amber,
            indicatorWeight: 3,
            tabs: [
              Tab(icon: Icon(Icons.square_rounded), text: 'Container'),
              Tab(icon: Icon(Icons.grid_view), text: 'GridView'),
              Tab(icon: Icon(Icons.list), text: 'ListView'),
              Tab(icon: Icon(Icons.format_list_bulleted), text: 'LV.Builder'),
              Tab(icon: Icon(Icons.format_list_numbered), text: 'LV.Separated'),
              Tab(icon: Icon(Icons.layers), text: 'Stack'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ContainerSection(),
            GridViewSection(),
            ListViewSection(),
            ListViewBuilderSection(),
            ListViewSeparatedSection(),
            StackSection(),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// 1. CONTAINER
// ─────────────────────────────────────────────
class ContainerSection extends StatelessWidget {
  const ContainerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(
            title: '1. Container',
            subtitle: 'Widget kotak serbaguna: warna, ukuran, padding, border',
            icon: Icons.square_rounded,
            color: const Color(0xFF4F46E5),
          ),
          const SizedBox(height: 20),

          // Basic colored container
          _Label('Container dasar – warna solid'),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 80,
            color: const Color(0xFF4F46E5),
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
          const SizedBox(height: 16),

          // Container with decoration
          _Label('Container dengan BoxDecoration'),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 90,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFEC4899), Color(0xFFEF4444)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFEC4899).withOpacity(0.4),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Center(
              child: Text(
                'Gradient + Rounded + Shadow',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Container with border
          _Label('Container dengan Border'),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFF10B981), width: 3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                'Border Hijau',
                style: TextStyle(
                  color: Color(0xFF10B981),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Row of small containers
          _Label('Beberapa Container berdampingan'),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _SmallBox('Merah', const Color(0xFFEF4444)),
              _SmallBox('Kuning', const Color(0xFFF59E0B)),
              _SmallBox('Hijau', const Color(0xFF10B981)),
              _SmallBox('Ungu', const Color(0xFF8B5CF6)),
            ],
          ),

          const SizedBox(height: 16),
          // Container with padding & margin
          _Label('Padding & Margin'),
          const SizedBox(height: 8),
          Container(
            color: Colors.grey.shade200,
            padding: const EdgeInsets.all(8),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFF0EA5E9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Inner padding: 24 | Outer padding: 8',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _SmallBox(String label, Color color) {
  return Container(
    width: 70,
    height: 70,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Center(
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

// ─────────────────────────────────────────────
// 2. GRIDVIEW
// ─────────────────────────────────────────────
class GridViewSection extends StatelessWidget {
  const GridViewSection({super.key});

  final List<Map<String, dynamic>> gridItems = const [
    {'icon': Icons.home, 'label': 'Home', 'color': Color(0xFF4F46E5)},
    {'icon': Icons.person, 'label': 'Profil', 'color': Color(0xFFEC4899)},
    {'icon': Icons.settings, 'label': 'Setting', 'color': Color(0xFF10B981)},
    {'icon': Icons.camera_alt, 'label': 'Kamera', 'color': Color(0xFFF59E0B)},
    {'icon': Icons.music_note, 'label': 'Musik', 'color': Color(0xFF8B5CF6)},
    {'icon': Icons.map, 'label': 'Peta', 'color': Color(0xFFEF4444)},
    {'icon': Icons.email, 'label': 'Email', 'color': Color(0xFF0EA5E9)},
    {'icon': Icons.chat, 'label': 'Chat', 'color': Color(0xFF14B8A6)},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: _SectionHeader(
            title: '2. GridView',
            subtitle: 'Menampilkan item dalam tata letak grid (${gridItems.length} item)',
            icon: Icons.grid_view,
            color: const Color(0xFF10B981),
          ),
        ),
        Expanded(
          child: GridView.count(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: gridItems.map((item) {
              return Container(
                decoration: BoxDecoration(
                  color: (item['color'] as Color).withOpacity(0.12),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: (item['color'] as Color).withOpacity(0.3),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: item['color'] as Color,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        item['icon'] as IconData,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      item['label'] as String,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: item['color'] as Color,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// 3. LISTVIEW (statis)
// ─────────────────────────────────────────────
class ListViewSection extends StatelessWidget {
  const ListViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {'label': 'A', 'title': 'Item A', 'subtitle': 'Deskripsi untuk item A', 'color': const Color(0xFF4F46E5)},
      {'label': 'B', 'title': 'Item B', 'subtitle': 'Deskripsi untuk item B', 'color': const Color(0xFFEC4899)},
      {'label': 'C', 'title': 'Item C', 'subtitle': 'Deskripsi untuk item C', 'color': const Color(0xFF10B981)},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: _SectionHeader(
            title: '3. ListView (Statis)',
            subtitle: 'Daftar statis 3 item (A, B, C)',
            icon: Icons.list,
            color: const Color(0xFFEC4899),
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: items.map((item) {
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                  side: BorderSide(
                    color: (item['color'] as Color).withOpacity(0.3),
                  ),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 10,
                  ),
                  leading: CircleAvatar(
                    backgroundColor: item['color'] as Color,
                    radius: 24,
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
                    item['title'] as String,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(item['subtitle'] as String),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: item['color'] as Color,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// 4. LISTVIEW.BUILDER
// ─────────────────────────────────────────────
class ListViewBuilderSection extends StatelessWidget {
  const ListViewBuilderSection({super.key});

  // Data array – sumber list
  static const List<Map<String, String>> mahasiswaList = [
    {'nama': 'Ahmad Fauzi', 'nim': '22001001', 'prodi': 'Teknik Informatika'},
    {'nama': 'Siti Rahayu', 'nim': '22001002', 'prodi': 'Sistem Informasi'},
    {'nama': 'Budi Santoso', 'nim': '22001003', 'prodi': 'Teknik Informatika'},
    {'nama': 'Dewi Lestari', 'nim': '22001004', 'prodi': 'Manajemen Informatika'},
    {'nama': 'Rizky Pratama', 'nim': '22001005', 'prodi': 'Sistem Informasi'},
    {'nama': 'Nurul Hidayah', 'nim': '22001006', 'prodi': 'Teknik Informatika'},
    {'nama': 'Fajar Ramadhan', 'nim': '22001007', 'prodi': 'Manajemen Informatika'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: _SectionHeader(
            title: '4. ListView.builder',
            subtitle: 'List dari data array (${mahasiswaList.length} mahasiswa)',
            icon: Icons.format_list_bulleted,
            color: const Color(0xFFF59E0B),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: mahasiswaList.length,
            itemBuilder: (context, index) {
              final mhs = mahasiswaList[index];
              final colors = [
                const Color(0xFF4F46E5),
                const Color(0xFFEC4899),
                const Color(0xFF10B981),
                const Color(0xFFF59E0B),
                const Color(0xFF8B5CF6),
                const Color(0xFFEF4444),
                const Color(0xFF0EA5E9),
              ];
              final color = colors[index % colors.length];

              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: color.withOpacity(0.25)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            mhs['nama']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'NIM: ${mhs['nim']}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            mhs['prodi']!,
                            style: TextStyle(
                              fontSize: 12,
                              color: color,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// 5. LISTVIEW.SEPARATED
// ─────────────────────────────────────────────
class ListViewSeparatedSection extends StatelessWidget {
  const ListViewSeparatedSection({super.key});

  static const List<Map<String, dynamic>> menuList = [
    {'icon': Icons.dashboard, 'title': 'Dashboard', 'sub': 'Halaman utama aplikasi'},
    {'icon': Icons.bar_chart, 'title': 'Laporan', 'sub': 'Lihat semua laporan'},
    {'icon': Icons.people, 'title': 'Pengguna', 'sub': 'Kelola data pengguna'},
    {'icon': Icons.inventory, 'title': 'Produk', 'sub': 'Manajemen produk'},
    {'icon': Icons.receipt_long, 'title': 'Transaksi', 'sub': 'Riwayat transaksi'},
    {'icon': Icons.notifications, 'title': 'Notifikasi', 'sub': 'Atur notifikasi'},
    {'icon': Icons.lock, 'title': 'Keamanan', 'sub': 'Pengaturan keamanan'},
    {'icon': Icons.help_outline, 'title': 'Bantuan', 'sub': 'Pusat bantuan & FAQ'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: _SectionHeader(
            title: '5. ListView.separated',
            subtitle: 'List dengan garis pembatas (separator) antar item',
            icon: Icons.format_list_numbered,
            color: const Color(0xFF8B5CF6),
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: menuList.length,
            separatorBuilder: (context, index) => Divider(
              color: const Color(0xFF8B5CF6).withOpacity(0.2),
              thickness: 1.5,
              height: 1,
            ),
            itemBuilder: (context, index) {
              final item = menuList[index];
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 8, horizontal: 4,
                ),
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF8B5CF6).withOpacity(0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    item['icon'] as IconData,
                    color: const Color(0xFF8B5CF6),
                    size: 22,
                  ),
                ),
                title: Text(
                  item['title'] as String,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                subtitle: Text(
                  item['sub'] as String,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                  ),
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                  color: Color(0xFF8B5CF6),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// 6. STACK
// ─────────────────────────────────────────────
class StackSection extends StatelessWidget {
  const StackSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(
            title: '6. Stack',
            subtitle: 'Widget yang ditumpuk (z-axis overlapping)',
            icon: Icons.layers,
            color: const Color(0xFFEF4444),
          ),
          const SizedBox(height: 20),

          // Stack 1 – Kotak bertumpuk
          _Label('Stack 1 – Kotak bertumpuk'),
          const SizedBox(height: 8),
          SizedBox(
            height: 160,
            child: Stack(
              children: [
                // Layer 1 – paling bawah
                Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    color: const Color(0xFF4F46E5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                // Layer 2
                Positioned(
                  left: 30,
                  top: 30,
                  child: Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEC4899),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                // Layer 3 – paling atas
                Positioned(
                  left: 60,
                  top: 60,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF59E0B),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Text(
                        'ATAS',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Stack 2 – Card dengan badge
          _Label('Stack 2 – Card dengan Badge Notifikasi'),
          const SizedBox(height: 8),
          SizedBox(
            height: 100,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xFF4F46E5),
                        child: Icon(Icons.notifications, color: Colors.white, size: 28),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Notifikasi', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          Text('Anda memiliki 3 pesan baru', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                ),
                // Badge merah
                Positioned(
                  top: 8,
                  left: 50,
                  child: Container(
                    width: 22,
                    height: 22,
                    decoration: const BoxDecoration(
                      color: Color(0xFFEF4444),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        '3',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Stack 3 – Banner dengan teks di atas gambar
          _Label('Stack 3 – Teks di atas background'),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            height: 150,
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Background gradient
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF0F172A), Color(0xFF334155)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                // Pattern dots (dekoratif)
                Positioned(
                  right: -20,
                  top: -20,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withOpacity(0.08),
                        width: 40,
                      ),
                    ),
                  ),
                ),
                // Teks utama
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Widget Stack',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Teks ini berada di atas\nlayer background gelap',
                        style: TextStyle(color: Colors.white60, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                // Badge pojok kanan bawah
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF59E0B),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Layer 3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// HELPER WIDGETS
// ─────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  const _SectionHeader({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.10),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withOpacity(0.25)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.white, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: color.withOpacity(0.7),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Label extends StatelessWidget {
  final String text;
  const _Label(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: Colors.black54,
      ),
    );
  }
}