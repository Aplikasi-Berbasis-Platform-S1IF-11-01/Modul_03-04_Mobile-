<div align="center">
  <br />

  <h1>LAPORAN PRAKTIKUM <br>
  APLIKASI BERBASIS PLATFORM
  </h1>

  <br />

  <h3>MODUL 3 & 4 <br>
  MOBILE
  </h3>

  <br />

  <img width="350" height="350" alt="logo" src="https://github.com/user-attachments/assets/22ae9b17-5e73-48a6-b5dd-281e6c70613e" />



  <br />
  <br />
  <br />

  <h3>Disusun Oleh :</h3>

  <p>
    <strong>Boutefhika Nuha Ziyadatul Khair</strong><br>
    <strong>2311102316</strong><br>
    <strong>S1 IF-11-01</strong>
  </p>

  <br />

  <h3>Dosen Pengampu :</h3>

  <p>
    <strong>Dimas Fanny Hebrasianto Permadi, S.ST., M.Kom</strong>
  </p>
  
  <br />
  <br />
    <h4>Asisten Praktikum :</h4>
    <strong>Apri Pandu Wicaksono </strong> <br>
    <strong>Rangga Pradarrell Fathi</strong>
  <br />

  <h3>LABORATORIUM HIGH PERFORMANCE
 <br>FAKULTAS INFORMATIKA <br>UNIVERSITAS TELKOM PURWOKERTO <br>2026</h3>
</div>

<hr>

## 💻 Source Code

### Struktur Project

```
flutter_application_1/
├── lib/
│   └── main.dart          ← semua kode widget ada di sini
├── test/
│   └── widget_test.dart   ← test file
├── pubspec.yaml
```

### `lib/main.dart`

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
      title: 'Praktikum Modul 4 - Flutter Widgets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFC9B8DD)),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFDF6FF),
      ),
      home: const HomePage(),
    );
  }
}

// ─── Pastel Color Palette ────────────────────────────────────
class PastelColors {
  static const purple     = Color(0xFFE8D5F5);
  static const purpleDark = Color(0xFF5A3780);
  static const pink       = Color(0xFFFFD6E0);
  static const pinkDark   = Color(0xFF8B3A52);
  static const green      = Color(0xFFD6F5E3);
  static const greenDark  = Color(0xFF2D6A4F);
  static const blue       = Color(0xFFD6F0F5);
  static const blueDark   = Color(0xFF1D6A7A);
  static const yellow     = Color(0xFFFFF3CC);
  static const yellowDark = Color(0xFF7A5C00);
  static const peach      = Color(0xFFFFE0CC);
  static const peachDark  = Color(0xFF7A3A1A);
  static const appBar     = Color(0xFFE8D5F5);
  static const background = Color(0xFFFDF6FF);
  static const cardBorder = Color(0xFFF0E6FF);
  static const divider    = Color(0xFFF0E6FF);
  static const textMain   = Color(0xFF4A3466);
  static const textSub    = Color(0xFFA08ABB);
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PastelColors.background,
      appBar: AppBar(
        backgroundColor: PastelColors.appBar,
        elevation: 0,
        title: const Text(
          '🌸 Praktikum Modul 4',
          style: TextStyle(
            color: PastelColors.purpleDark,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: PastelColors.cardBorder, height: 1),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionTitle('1. Container'),
          const SizedBox(height: 8),
          _buildContainerSection(),
          const SizedBox(height: 20),
          _buildSectionTitle('2. GridView'),
          const SizedBox(height: 8),
          _buildGridViewSection(),
          const SizedBox(height: 20),
          _buildSectionTitle('3. ListView'),
          const SizedBox(height: 8),
          _buildListViewSection(),
          const SizedBox(height: 20),
          _buildSectionTitle('4. ListView.builder'),
          const SizedBox(height: 8),
          _buildListViewBuilderSection(),
          const SizedBox(height: 20),
          _buildSectionTitle('5. ListView.separated'),
          const SizedBox(height: 8),
          _buildListViewSeparatedSection(),
          const SizedBox(height: 20),
          _buildSectionTitle('6. Stack'),
          const SizedBox(height: 8),
          _buildStackSection(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: PastelColors.purple,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: PastelColors.cardBorder),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: PastelColors.purpleDark,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }

  Widget _pastelCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: PastelColors.cardBorder),
      ),
      child: child,
    );
  }

  // ─── 1. CONTAINER ───────────────────────────────────────────
  Widget _buildContainerSection() {
    return _pastelCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _pastelBox(emoji: '🌷', label: 'Merah',
              bg: PastelColors.pink, fg: PastelColors.pinkDark),
          _pastelBox(emoji: '🌿', label: 'Hijau',
              bg: PastelColors.green, fg: PastelColors.greenDark),
          _pastelBox(emoji: '🍊', label: 'Oranye',
              bg: PastelColors.peach, fg: PastelColors.peachDark),
        ],
      ),
    );
  }

  Widget _pastelBox({
    required String emoji,
    required String label,
    required Color bg,
    required Color fg,
  }) {
    return Container(
      width: 88,
      height: 80,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 22)),
          const SizedBox(height: 4),
          Text(label,
              style: TextStyle(
                  color: fg, fontWeight: FontWeight.bold, fontSize: 11)),
        ],
      ),
    );
  }

  // ─── 2. GRIDVIEW ────────────────────────────────────────────
  Widget _buildGridViewSection() {
    final List<Map<String, dynamic>> items = [
      {'label': 'Item 1', 'bg': PastelColors.purple, 'fg': PastelColors.purpleDark},
      {'label': 'Item 2', 'bg': PastelColors.blue,   'fg': PastelColors.blueDark},
      {'label': 'Item 3', 'bg': PastelColors.pink,   'fg': PastelColors.pinkDark},
      {'label': 'Item 4', 'bg': PastelColors.yellow, 'fg': PastelColors.yellowDark},
      {'label': 'Item 5', 'bg': PastelColors.green,  'fg': PastelColors.greenDark},
      {'label': 'Item 6', 'bg': PastelColors.peach,  'fg': PastelColors.peachDark},
    ];

    return _pastelCard(
      child: SizedBox(
        height: 200,
        child: GridView.count(
          crossAxisCount: 3,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: items.map((item) {
            return Container(
              decoration: BoxDecoration(
                color: item['bg'] as Color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  item['label'] as String,
                  style: TextStyle(
                    color: item['fg'] as Color,
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  // ─── 3. LISTVIEW ────────────────────────────────────────────
  Widget _buildListViewSection() {
    final items = [
      {'letter': 'A', 'bg': PastelColors.purple, 'fg': PastelColors.purpleDark},
      {'letter': 'B', 'bg': PastelColors.pink,   'fg': PastelColors.pinkDark},
      {'letter': 'C', 'bg': PastelColors.green,  'fg': PastelColors.greenDark},
    ];

    return _pastelCard(
      child: SizedBox(
        height: 148,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: items.map((item) {
            final letter = item['letter'] as String;
            return _pastelListTile(
              avatar: CircleAvatar(
                backgroundColor: item['bg'] as Color,
                child: Text(letter,
                    style: TextStyle(
                        color: item['fg'] as Color,
                        fontWeight: FontWeight.bold)),
              ),
              title: 'Item $letter',
              subtitle: 'Deskripsi item $letter',
              isLast: letter == 'C',
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _pastelListTile({
    required Widget avatar,
    required String title,
    required String subtitle,
    bool isLast = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : const Border(
                bottom: BorderSide(color: PastelColors.divider, width: 1)),
      ),
      child: Row(
        children: [
          avatar,
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      color: PastelColors.textMain,
                      fontWeight: FontWeight.w600,
                      fontSize: 13)),
              Text(subtitle,
                  style: const TextStyle(
                      color: PastelColors.textSub, fontSize: 11)),
            ],
          ),
        ],
      ),
    );
  }

  // ─── 4. LISTVIEW.BUILDER ────────────────────────────────────
  Widget _buildListViewBuilderSection() {
    final List<String> buahList = ['Apel', 'Mangga', 'Jeruk', 'Pisang', 'Semangka'];
    final colors = [
      PastelColors.purple, PastelColors.pink, PastelColors.blue,
      PastelColors.yellow, PastelColors.green,
    ];
    final colorsDark = [
      PastelColors.purpleDark, PastelColors.pinkDark, PastelColors.blueDark,
      PastelColors.yellowDark, PastelColors.greenDark,
    ];

    return _pastelCard(
      child: SizedBox(
        height: 212,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: buahList.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 6),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: PastelColors.background,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: PastelColors.cardBorder),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundColor: colors[index],
                    child: Text('${index + 1}',
                        style: TextStyle(
                            color: colorsDark[index],
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),
                  ),
                  const SizedBox(width: 12),
                  Text(buahList[index],
                      style: const TextStyle(
                          color: PastelColors.textMain,
                          fontWeight: FontWeight.w600,
                          fontSize: 13)),
                  const Spacer(),
                  const Icon(Icons.chevron_right,
                      color: PastelColors.textSub, size: 18),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // ─── 5. LISTVIEW.SEPARATED ──────────────────────────────────
  Widget _buildListViewSeparatedSection() {
    final List<String> hewanList = ['Kucing', 'Anjing', 'Kelinci', 'Hamster', 'Burung'];
    final List<String> emojis   = ['🐱', '🐶', '🐰', '🐹', '🐦'];

    return _pastelCard(
      child: SizedBox(
        height: 220,
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: hewanList.length,
          separatorBuilder: (context, index) => const Divider(
            color: PastelColors.divider,
            thickness: 1,
            height: 1,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Text(emojis[index], style: const TextStyle(fontSize: 20)),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(hewanList[index],
                          style: const TextStyle(
                              color: PastelColors.textMain,
                              fontWeight: FontWeight.w600,
                              fontSize: 13)),
                      Text('Hewan ke-${index + 1}',
                          style: const TextStyle(
                              color: PastelColors.textSub, fontSize: 11)),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // ─── 6. STACK ───────────────────────────────────────────────
  Widget _buildStackSection() {
    return _pastelCard(
      child: Center(
        child: SizedBox(
          width: double.infinity,
          height: 150,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: PastelColors.purple,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              Positioned(
                right: -18, top: -18,
                child: Container(
                  width: 100, height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.35),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                left: -12, bottom: -12,
                child: Container(
                  width: 70, height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.25),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              const Positioned(
                left: 20, top: 24,
                child: Text('Stack Widget',
                    style: TextStyle(
                        color: PastelColors.purpleDark,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              const Positioned(
                left: 20, top: 54,
                child: Text('Elemen ditumpuk\ndi atas lainnya',
                    style: TextStyle(
                        color: Color(0xFF8B68B0),
                        fontSize: 12,
                        height: 1.5)),
              ),
              Positioned(
                right: 16, bottom: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: PastelColors.pink,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text('Layer 5 ✨',
                      style: TextStyle(
                          color: PastelColors.pinkDark,
                          fontWeight: FontWeight.bold,
                          fontSize: 11)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

## Penjelasan Widget

### 1. Container

```dart
Container(
  width: 88,
  height: 80,
  decoration: BoxDecoration(
    color: PastelColors.pink,
    borderRadius: BorderRadius.circular(14),
  ),
  child: Column(
    children: [
      Text('🌷', ...),
      Text('Merah', ...),
    ],
  ),
)
```

**Container** adalah widget kotak serbaguna di Flutter yang bisa diberi ukuran, warna, padding, margin, dan dekorasi. Properti `decoration` dengan `BoxDecoration` digunakan untuk mengatur warna background pastel dan sudut membulat (`borderRadius`). Pada contoh ini ditampilkan 3 Container berdampingan dalam `Row`, masing-masing bertema warna pastel (pink, hijau mint, peach) dilengkapi emoji.

---

### 2. GridView

```dart
GridView.count(
  crossAxisCount: 3,       // 3 kolom
  crossAxisSpacing: 8,     // jarak horizontal
  mainAxisSpacing: 8,      // jarak vertikal
  physics: const NeverScrollableScrollPhysics(),
  children: [...],         // 6 item
)
```

**GridView** menampilkan item dalam tata letak grid (baris dan kolom). `GridView.count` membuat grid dengan jumlah kolom tetap yang ditentukan `crossAxisCount`. Terdapat 6 item masing-masing dengan warna pastel berbeda (ungu, biru, pink, kuning, hijau, peach). `NeverScrollableScrollPhysics` mencegah GridView scroll sendiri karena sudah berada di dalam ListView utama.

---

### 3. ListView

```dart
ListView(
  physics: const NeverScrollableScrollPhysics(),
  children: [
    // item A, B, C
  ],
)
```

**ListView** adalah widget scroll yang menampilkan daftar item secara vertikal. Cocok digunakan ketika jumlah item sudah diketahui dan tidak terlalu banyak. Pada contoh ini ditampilkan 3 item (A, B, C) dengan avatar `CircleAvatar` berwarna pastel berbeda untuk tiap item, disusun dengan garis pemisah tipis `Divider`.

---

### 4. ListView.builder

```dart
ListView.builder(
  itemCount: buahList.length,  // jumlah item dari array
  itemBuilder: (context, index) {
    return Container(
      child: Row(
        children: [
          CircleAvatar(child: Text('${index + 1}')),
          Text(buahList[index]),
          Icon(Icons.chevron_right),
        ],
      ),
    );
  },
)
```

**ListView.builder** digunakan untuk menampilkan list secara dinamis dari data array. Widget item hanya dibuat saat akan tampil di layar (*lazy rendering*), sehingga lebih efisien untuk data yang banyak. `itemBuilder` dipanggil untuk setiap index dan mengembalikan widget item. Data bersumber dari `buahList` berisi 5 nama buah, tiap nomor badge punya warna pastel berbeda.

### 5. ListView.separated

```dart
ListView.separated(
  itemCount: hewanList.length,
  separatorBuilder: (context, index) => const Divider(
    color: PastelColors.divider,
    thickness: 1,
    height: 1,
  ),
  itemBuilder: (context, index) {
    return Padding(
      child: Row(
        children: [
          Text(emojis[index]),   // emoji hewan
          Text(hewanList[index]),
        ],
      ),
    );
  },
)
```

**ListView.separated** mirip `ListView.builder` namun secara otomatis menambahkan widget pemisah di antara setiap item. `separatorBuilder` menentukan tampilan pemisah — pada contoh ini berupa `Divider` tipis berwarna pastel lavender. Data bersumber dari `hewanList` berisi 5 nama hewan dengan emoji masing-masing (🐱🐶🐰🐹🐦).

### 6. Stack

```dart
Stack(
  children: [
    // Layer 1: background pastel ungu
    Container(color: PastelColors.purple, ...),
    // Layer 2: lingkaran dekoratif kanan atas
    Positioned(right: -18, top: -18, child: Container(...circle...)),
    // Layer 3: lingkaran dekoratif kiri bawah
    Positioned(left: -12, bottom: -12, child: Container(...circle...)),
    // Layer 4: teks judul
    Positioned(left: 20, top: 24, child: Text('Stack Widget')),
    // Layer 4b: teks subjudul
    Positioned(left: 20, top: 54, child: Text('Elemen ditumpuk...')),
    // Layer 5: badge pink
    Positioned(right: 16, bottom: 16, child: Container(...badge...)),
  ],
)
```

**Stack** menumpuk beberapa widget di atas satu sama lain seperti layer. Widget yang dideklarasikan lebih akhir berada di atas. `Positioned` digunakan untuk meletakkan child di posisi tertentu (kiri/kanan/atas/bawah). Pada contoh ini terdapat 5 layer: background ungu pastel, 2 lingkaran dekoratif semi-transparan, teks judul dan subjudul, serta badge pink bertuliskan "Layer 5 ✨".

---

## Screenshot Hasil
<img src="Images/gambar1.jpeg" width="250">

<img src="Images/gambar2.jpeg" width="250">

<img src="Images/gambar3.jpeg" width="250">
