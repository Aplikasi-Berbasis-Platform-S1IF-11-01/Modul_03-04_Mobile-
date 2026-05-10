import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modul 4',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: true,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Data untuk ListView.builder dan ListView.separated
  final List<Map<String, dynamic>> itemList = const [
    {'title': 'Item 1', 'subtitle': 'Deskripsi item pertama', 'icon': Icons.star},
    {'title': 'Item 2', 'subtitle': 'Deskripsi item kedua', 'icon': Icons.favorite},
    {'title': 'Item 3', 'subtitle': 'Deskripsi item ketiga', 'icon': Icons.thumb_up},
    {'title': 'Item 4', 'subtitle': 'Deskripsi item keempat', 'icon': Icons.face},
    {'title': 'Item 5', 'subtitle': 'Deskripsi item kelima', 'icon': Icons.lightbulb},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter UI Widgets'),
        centerTitle: true,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ============================================
            // 1. CONTAINER - Kotak Berwarna
            // ============================================
            _buildSectionTitle('1. Container'),
            _buildContainerDemo(),
            const SizedBox(height: 24),

            // ============================================
            // 2. GRIDVIEW - Minimal 6 Item
            // ============================================
            _buildSectionTitle('2. GridView'),
            _buildGridViewDemo(),
            const SizedBox(height: 24),

            // ============================================
            // 3. LISTVIEW - 3 Item (A, B, C)
            // ============================================
            _buildSectionTitle('3. ListView'),
            _buildListViewDemo(),
            const SizedBox(height: 24),

            // ============================================
            // 4. LISTVIEW.BUILDER - Dari Data Array
            // ============================================
            _buildSectionTitle('4. ListView.builder'),
            _buildListViewBuilderDemo(),
            const SizedBox(height: 24),

            // ============================================
            // 5. LISTVIEW.SEPARATED - List + Garis Pembatas
            // ============================================
            _buildSectionTitle('5. ListView.separated'),
            _buildListViewSeparatedDemo(),
            const SizedBox(height: 24),

            // ============================================
            // 6. STACK - Tampilan Bertumpuk
            // ============================================
            _buildSectionTitle('6. Stack'),
            _buildStackDemo(),
          ],
        ),
      ),
    );
  }

  // Widget untuk judul section
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey,
        ),
      ),
    );
  }

  // ============================================
  // 1. CONTAINER DEMO
  // Penjelasan: Container adalah widget dasar yang bisa diberi
  // warna, padding, margin, dan dekorasi seperti border radius.
  // ============================================
  Widget _buildContainerDemo() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: Colors.blue.shade700,
          width: 2.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Column(
        children: [
          Icon(
            Icons.square,
            size: 40,
            color: Colors.blue,
          ),
          SizedBox(height: 8),
          Text(
            'Ini adalah Container',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Container bisa diberi warna, border, shadow, padding, dan margin',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  // ============================================
  // 2. GRIDVIEW DEMO
  // Penjelasan: GridView menampilkan item dalam bentuk grid.
  // Menggunakan GridView.count untuk menentukan jumlah kolom.
  // ============================================
  Widget _buildGridViewDemo() {
    return GridView.count(
      crossAxisCount: 3, // 3 kolom
      shrinkWrap: true, // Penting: agar grid tidak infinite height
      physics: const NeverScrollableScrollPhysics(), // Nonaktifkan scroll grid
      mainAxisSpacing: 12.0,
      crossAxisSpacing: 12.0,
      childAspectRatio: 1.0, // Rasio lebar:tinggi = 1:1 (kotak)
      children: List.generate(6, (index) {
        final colors = [
          Colors.red,
          Colors.green,
          Colors.orange,
          Colors.purple,
          Colors.teal,
          Colors.pink,
        ];
        final icons = [
          Icons.ac_unit,
          Icons.airplanemode_active,
          Icons.beach_access,
          Icons.cake,
          Icons.directions_bike,
          Icons.emoji_emotions,
        ];
        final labels = [
          'Snow',
          'Fly',
          'Beach',
          'Cake',
          'Bike',
          'Smile',
        ];

        return Container(
          decoration: BoxDecoration(
            color: colors[index].withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: colors[index],
              width: 2.0,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icons[index],
                size: 36,
                color: colors[index],
              ),
              const SizedBox(height: 8),
              Text(
                labels[index],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: colors[index],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  // ============================================
  // 3. LISTVIEW DEMO (3 Item: A, B, C)
  // Penjelasan: ListView standar yang berisi widget children
  // secara langsung. Cocok untuk jumlah item yang sedikit.
  // ============================================
  Widget _buildListViewDemo() {
    return Container(
      height: 200, // Batasi tinggi ListView
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          _buildListItem(
            icon: Icons.looks_one,
            label: 'Item A',
            subtitle: 'Ini adalah item pertama',
            color: Colors.indigo,
          ),
          _buildListItem(
            icon: Icons.looks_two,
            label: 'Item B',
            subtitle: 'Ini adalah item kedua',
            color: Colors.teal,
          ),
          _buildListItem(
            icon: Icons.looks_3,
            label: 'Item C',
            subtitle: 'Ini adalah item ketiga',
            color: Colors.deepOrange,
          ),
        ],
      ),
    );
  }

  // Widget bantuan untuk ListView item
  Widget _buildListItem({
    required IconData icon,
    required String label,
    required String subtitle,
    required Color color,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.2),
          child: Icon(icon, color: color),
        ),
        title: Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, color: color),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          // Aksi saat item diklik
        },
      ),
    );
  }

  // ============================================
  // 4. LISTVIEW.BUILDER DEMO
  // Penjelasan: ListView.builder membuat item secara lazy
  // (hanya yang terlihat). Sangat efisien untuk list panjang.
  // Menggunakan itemCount dan itemBuilder.
  // ============================================
  Widget _buildListViewBuilderDemo() {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: itemList.length, // Jumlah item dari array
        itemBuilder: (context, index) {
          // Mengambil data dari array
          final item = itemList[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(
              vertical: 4.0,
              horizontal: 4.0,
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue.shade100,
                child: Icon(item['icon'] as IconData, color: Colors.blue),
              ),
              title: Text(
                item['title'] as String,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(item['subtitle'] as String),
              trailing: Text(
                '#${index + 1}',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // ============================================
  // 5. LISTVIEW.SEPARATED DEMO
  // Penjelasan: ListView.separated menambahkan separator
  // (garis pembatas) antar item secara otomatis.
  // Cocok untuk list dengan pembatas visual yang jelas.
  // ============================================
  Widget _buildListViewSeparatedDemo() {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListView.separated(
        padding: const EdgeInsets.all(8.0),
        itemCount: itemList.length,
        separatorBuilder: (context, index) {
          // MEMBUAT GARIS PEMBATAS
          return const Divider(
            color: Colors.blueGrey,
            thickness: 1.5,
            indent: 72, // Jarak dari kiri
            endIndent: 16, // Jarak dari kanan
            height: 1,
          );
        },
        itemBuilder: (context, index) {
          final item = itemList[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.orange.shade100,
              child: Icon(item['icon'] as IconData, color: Colors.orange),
            ),
            title: Text(
              item['title'] as String,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(item['subtitle'] as String),
            trailing: Icon(
              Icons.circle,
              size: 10,
              color: Colors.orange.shade300,
            ),
          );
        },
      ),
    );
  }

  // ============================================
  // 6. STACK DEMO
  // Penjelasan: Stack menumpuk widget satu di atas yang lain.
  // Widget pertama di paling bawah, terakhir di paling atas.
  // Menggunakan Positioned untuk mengatur posisi spesifik.
  // ============================================
  Widget _buildStackDemo() {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Layer 1 (paling bawah): Kotak besar
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.blue.shade200,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.blue, width: 3),
            ),
          ),
          // Layer 2: Kotak sedang (di atas kanan)
          Positioned(
            top: 30,
            right: 60,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.green.shade200,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.green, width: 2.5),
              ),
            ),
          ),
          // Layer 3: Kotak kecil (di tengah)
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.orange.shade200,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.orange, width: 2),
            ),
            child: const Center(
              child: Text(
                'STACK',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ),
          ),
          // Layer 4 (paling atas): Badge/label di pojok
          Positioned(
            bottom: 20,
            left: 40,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Layer 4',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          // Layer 5: Label posisi
          const Positioned(
            top: 10,
            left: 20,
            child: Text(
              'Layer 1',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          const Positioned(
            top: 50,
            right: 50,
            child: Text(
              'Layer 2',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}