<div align="center">
  <br />
  <h1>LAPORAN PRAKTIKUM <br>APLIKASI BERBASIS PLATFORM</h1>
  <br />
  <h2>MODUL 03 dan 04 - Mobile <br> MOBILE </h2>
  <br />
  <br />
  <img src="assets/Telkom.png" alt="Logo" width="300"> 
  <br />
  <br />
  <br />
  <h3>Disusun Oleh :</h3>
  <p>
    <strong>Bayu Kuncoro Adi</strong><br>
    <strong>2311102031</strong><br>
    <strong>S1 IF-11-REG 01</strong>
  </p>
  <br />
  <h3>Dosen Pengampu :</h3>
  <p>
    <strong>Dimas Fanny Hebrasianto Permadi, S.ST., M.Kom</strong>
  </p>
  <br />
  <br />
    <h4>Asisten Praktikum :</h4>
    <strong> Apri Pandu Wicaksono </strong> <br>
    <strong>Rangga Pradarrell Fathi</strong>
  <br />
  <h2>LABORATORIUM HIGH PERFORMANCE
 <br>FAKULTAS INFORMATIKA <br>UNIVERSITAS TELKOM PURWOKERTO <br>2026</h2>
</div>

---

# 1. Dasar Teori

Dasar teori komputasi bergerak atau *mobile computing* merujuk pada paradigma teknologi interaksi antara manusia dan komputer yang memungkinkan transmisi data, suara, maupun video melalui perangkat nirkabel. Konsep fundamental ini bertumpu pada tiga elemen utama, yaitu perangkat keras bergerak seperti ponsel pintar atau tablet, perangkat lunak atau aplikasi yang dirancang khusus untuk ekosistem tersebut, serta infrastruktur jaringan komunikasi tanpa kabel yang memastikan konektivitas pengguna tetap terjaga. Berbeda dengan komputasi desktop konvensional, teknologi mobile memberikan fleksibilitas mobilitas yang tinggi sehingga pengguna dapat mengakses informasi, menjalankan proses komputasi, dan berinteraksi dengan sistem dari mana saja dan kapan saja tanpa terikat pada satu lokasi fisik yang permanen.

Dalam konteks pengembangan sistem, perangkat mobile memiliki karakteristik dan batasan teoretis yang unik, seperti portabilitas, keterbatasan sumber daya komputasi, serta kondisi jaringan yang fluktuatif. Perangkat ini umumnya memiliki kapasitas daya baterai, dimensi ukuran layar, dan kemampuan pemrosesan (CPU/RAM) yang lebih terbatas dibandingkan komputer personal. Oleh karena itu, arsitektur perangkat lunak mobile harus dibangun secara sangat efisien untuk mengoptimalkan alokasi memori dan meminimalisir konsumsi daya. Selain itu, aspek antarmuka pengguna atau *User Interface* (UI) menjadi elemen teoretis yang krusial, di mana pengembang diwajibkan menggunakan pendekatan ergonomis khusus untuk layar sentuh, memastikan navigasi yang intuitif, serta menciptakan tata letak responsif yang mampu beradaptasi dengan berbagai rasio dan resolusi layar.

Dari segi rekayasa perangkat lunak, pengembangan aplikasi mobile diklasifikasikan ke dalam beberapa pendekatan arsitektural utama, yakni *native*, *web-based*, dan *cross-platform*. Pendekatan *native* berfokus pada pembuatan aplikasi menggunakan bahasa pemrograman dan *Software Development Kit* (SDK) yang terikat pada satu sistem operasi secara spesifik, yang mana mampu memberikan performa komputasi maksimal dan akses mendalam terhadap perangkat keras keras. Di sisi lain, pendekatan *cross-platform* hadir sebagai solusi modern yang memungkinkan pengembang untuk menulis satu basis kode (*codebase*) tunggal yang kemudian dapat dikompilasi menjadi aplikasi untuk berbagai sistem operasi yang berbeda secara serentak. Pendekatan lintas platform ini menggeser paradigma pengembangan menjadi jauh lebih efisien, baik dalam hal waktu pengerjaan, manajemen tim, maupun biaya pemeliharaan sistem dalam jangka panjang.


---

# 2. Sourcode Main Dart


```dart
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
```

# 3. Penjelasan Widget

# a. Container dan Stack
```dart
Stack(
  alignment: Alignment.center,
  children: [
    // Layer 1: Background Kayu
    Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: const Color(0xFF5D4037),
        borderRadius: BorderRadius.circular(20),
        // ... bayangan
      ),
    ),
    // Layer 2: Dekorasi Daun Kiri (Bertumpuk)
    Positioned(
      top: 0,
      left: 20,
      child: Container(
        // ... dekorasi daun hijau
        child: const Icon(Icons.energy_savings_leaf, color: Colors.white),
      ),
    ),
    // Layer 3: Kartu Info (Bertumpuk di atas kayu)
    Positioned(
      bottom: 0,
      child: Container(
        // ... styling kartu putih border cokelat
        child: const Text('Widget Stack Berhasil!'),
      ),
    ),
  ],
)
```
Stack menumpuk beberapa widget di atas satu sama lain seperti layer. Widget yang dideklarasikan paling awal berada di urutan paling bawah (background). Container adalah widget kotak serbaguna yang diatur menggunakan BoxDecoration untuk memberikan warna kayu (#5D4037), sudut membulat, dan bayangan. Positioned digunakan secara spesifik di dalam Stack untuk meletakkan elemen dekorasi daun dan kartu teks pada koordinat (atas/kiri/bawah) yang presisi.

# b. GridView
```dart
GridView.count(
  crossAxisCount: 3,             // 3 kolom
  crossAxisSpacing: 12,          // jarak horizontal
  mainAxisSpacing: 12,           // jarak vertikal
  childAspectRatio: 0.9,         // rasio aspek agar agak memanjang
  physics: const NeverScrollableScrollPhysics(),
  children: List.generate(6, (index) {
    // ... styling kotak dengan warna dan ikon alam
  }),
)
```
GridView menampilkan kumpulan item dalam tata letak baris dan kolom. GridView.count secara praktis membuat grid dengan jumlah kolom tetap, dalam hal ini crossAxisCount: 3 (3 kolom). Pada kode ini ditampilkan 6 kotak berisikan ikon bernuansa elemen hutan (pohon, rumput, daun, gunung, air, matahari) dengan warna semi-transparan. NeverScrollableScrollPhysics ditambahkan agar grid ini tidak bisa di-scroll sendiri, melainkan menyatu dengan scroll halaman utama.

# c. ListView
```dart
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
)
```
ListView adalah widget scroll dasar untuk menampilkan daftar item secara vertikal. Penggunaan ListView biasa (tanpa builder) sangat cocok ketika jumlah itemnya statis dan tidak terlalu banyak. Pada contoh ini, terdapat 3 item (Zona A, Zona B, Zona C) yang dibuat menggunakan fungsi pembantu _customListCard, menghasilkan tampilan kartu khusus bergaya modern dengan garis batas warna (border) tebal di sebelah kirinya.

# d. ListView.builder
```dart
ListView.builder(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  itemCount: floraList.length, // jumlah dari array floraList
  itemBuilder: (context, index) {
    return ListTile(
      leading: Container(
        // ... dekorasi kotak hijau muda
        child: const Icon(Icons.local_florist, color: Color(0xFF2E7D32)),
      ),
      title: Text(floraList[index]),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  },
)
```
ListView.builder digunakan untuk menghasilkan daftar secara dinamis berdasarkan sumber data array atau list. Widget ini menggunakan mekanisme lazy rendering, yang berarti item hanya akan dirender (dibangun) di dalam memori saat item tersebut mulai terlihat di layar. Data pada kode ini diambil dari array floraList yang berisi 5 jenis tanaman hutan, direpresentasikan menggunakan ListTile dengan ikon bunga (Icons.local_florist) di sisi kirinya.

# e. ListView.separated
```dart
ListView.separated(
  itemCount: faunaList.length,
  // Pembatas custom berupa ikon daun diapit garis
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
      title: Text(faunaList[index]),
      subtitle: Text('Spesies ke-${index + 1}'),
    );
  },
)
```
ListView.separated memiliki fungsi dasar yang identik dengan ListView.builder, namun menyediakan kemudahan ekstra dengan menyisipkan pemisah antar item secara otomatis. Properti separatorBuilder bertugas menggambar pemisah tersebut. Alih-alih hanya menggunakan garis pembatas (Divider) lurus biasa, kode ini mendesain pemisah kustom berupa ikon daun (Icons.eco) yang diapit oleh dua garis berwarna oranye hangat. Datanya merender daftar hewan dari array faunaList.


# 3. Hasil SS

<img src="assets/WhatsApp Image 2026-05-11 at 19.58.57.jpeg" width="250">

<img src="assets/WhatsApp Image 2026-05-11 at 19.59.12.jpeg" width="250">

<img src="assets/WhatsApp Image 2026-05-11 at 19.59.26.jpeg" width="250">

### Refrensi

- Flutter Docs: [https://docs.flutter.dev](https://docs.flutter.dev)
- Modul 3 dan 4 Praktikum Aplikasi Berbasis Platform Mobile
- Dart [https://dart.dev/]