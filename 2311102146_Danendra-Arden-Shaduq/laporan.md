<div align="center">
  <br />
  <h1>LAPORAN PRAKTIKUM <br>APLIKASI BERBASIS PLATFORM</h1>
  <br />
  <h3>MODUL 03-04 - Mobile <br> Pengenalan Flutter  </h3>
  <br />
  <img src="asset\logo.png" alt="Logo" width="300"> 
  <br />
  <br />
  <br />
  <h3>Disusun Oleh :</h3>
  <p>
    <strong>Danendra Arden Shaduq</strong><br>
    <strong>2311102146</strong><br>
    <strong>IF-11-REG01</strong>
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
  <h3>LABORATORIUM HIGH PERFORMANCE
 <br>FAKULTAS INFORMATIKA <br>UNIVERSITAS TELKOM PURWOKERTO <br>2026</h3>
</div>

---
## 1. Source Code dan Penjelasan
### 1.1 Container
```dart
// 1. Container utama dengan gradien dan bayangan (Hero Card)
Container(
  height: 130,
  decoration: BoxDecoration(
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFF4F8EF7), Color(0xFF7C3AED)],
    ),
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: const Color(0xFF4F8EF7).withOpacity(0.35),
        blurRadius: 24,
        offset: const Offset(0, 8),
      ),
    ],
  ),
  child: /* Konten di dalamnya */,
)

// 2. Container dengan warna solid dan garis tepi (Bordered Card)
Container(
  height: 59,
  decoration: BoxDecoration(
    color: AppColors.surfaceElevated,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: AppColors.border),
  ),
  child: /* Konten di dalamnya */,
)
```
Container berfungsi sebagai kotak serbaguna yang memanfaatkan BoxDecoration untuk membungkus sekaligus merancang visual elemen UI. Properti dekorasi ini memungkinkan Anda untuk menambahkan warna latar solid maupun gradien, membulatkan sudut kotak, membuat garis tepi, hingga memberikan efek bayangan untuk kedalaman visual. Selain untuk mempercantik tampilan, Container juga secara fungsional digunakan untuk mengatur dimensi tetap agar susunan widget di dalamnya memiliki batasan ruang yang konsisten.

### 1.2 GridView
```dart
// Data sumber
static const List<Map<String, dynamic>> _gridItems = [
  {'icon': '🎵', 'label': 'Musik', 'sub': '2.4K songs'},
  // ... item lainnya
];

// Tata letak utama
GridView.builder(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3, // Membuat 3 kolom
  ),
  itemCount: _gridItems.length,
  itemBuilder: (context, index) {
    final item = _gridItems[index];

    return GestureDetector(
      onTap: () {},
      child: Container(
        child: Column(
          children: [
            Text(item['icon']),
            Text(item['label']),
            Text(item['sub']),
          ],
        ),
      ),
    );
  },
)
```
Penggunaan GridView.builder untuk merender sekumpulan data dari list _gridItems menjadi tata letak grid beraturan dengan 3 kolom (crossAxisCount: 3). Grid ini diatur agar menyesuaikan tinggi kontennya (shrinkWrap: true) dan tidak bisa digulir secara mandiri (NeverScrollableScrollPhysics), melainkan mengikuti scroll halaman utamanya. Pada setiap perulangan data, itemBuilder akan mengembalikan sebuah kontainer interaktif (GestureDetector) yang menampilkan ikon, judul, dan sub-judul secara vertikal menggunakan widget Column.

### 1.3 ListView
```dart
ListView(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  children: _items.map((item) {
    return ListTile(
      title: Text(item['title'] as String),
      subtitle: Text(item['desc'] as String),
    );
  }).toList(),
)
```
ListView langsung mengisi properti children dengan mengubah seluruh data dari array _items menjadi daftar widget sekaligus menggunakan fungsi .map().toList().

### 1.4 ListView.builder
```dart
ListView.builder(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  itemCount: dummyProducts.length,
  itemBuilder: (context, index) {
    final product = dummyProducts[index];
    return Row(
      children: [
        Text(product.name),
        Text('\$${product.price}'),
      ],
    );
  },
)
```
ListView.builder merender konten secara dinamis menggunakan fungsi itemBuilder yang akan membuat widget satu per satu berdasarkan index dari total itemCount milik array dummyProducts.

### 1.5 ListView.separated
```dart
ListView.separated(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  itemCount: transactionHistory.length,
  separatorBuilder: (context, index) => Container(height: 1), // Garis pembatas
  itemBuilder: (context, index) {
    final tx = transactionHistory[index];
    return Row(
      children: [
        Text(tx['title'] as String),
        Text(tx['amount'] as String),
      ],
    );
  },
)
```
ListView.separated memiliki struktur logika yang sama persis dengan builder untuk merender data transactionHistory, namun ditambahkan fungsi separatorBuilder yang secara spesifik menyisipkan sebuah Container setinggi 1 piksel sebagai garis pembatas (divider) di antara setiap widget itemnya.

### 1.6 Stack
```dart
Column(
  children: [
    // Demo 1: Penumpukan berbagai layer (Background, Posisi, dan Fill)
    Stack(
      children: [
        Container(), // Layer 1 (Terdalam): Background
        Positioned(right: -40, top: -40, child: Container()), // Layer 2: Dekorasi di pojok atas
        Positioned.fill(child: Container()), // Layer 3 & 4: Grid dan Konten yang memenuhi area
        Positioned(top: 14, right: 14, child: Container()), // Layer 5 (Terluar): Badge notifikasi
      ],
    ),
    
    // Demo 2: Overlapping antar kartu yang keluar dari batas
    Stack(
      clipBehavior: Clip.none,
      children: [
        Container(), // Kartu posisi di belakang
        Positioned(top: 0, left: 16, child: Container()), // Kartu posisi di depan (tumpang tindih)
      ],
    ),
  ],
)
```
Untuk mengatur tata letak yang presisi, kode ini memanfaatkan widget Positioned yang memberikan koordinat spesifik (seperti top, left, right) dan Positioned.fill yang meregangkan widget agar memenuhi seluruh ruang Stack. Selain itu, pada demo kedua, properti clipBehavior: Clip.none diaplikasikan agar elemen anak tetap terlihat menonjol dan saling tumpang tindih secara bebas (overlapping) meskipun posisinya digeser hingga melewati batas ukuran asli dari Stack induknya.

---
## 2. Screenshoot Hasil
![1](asset\1.jpeg)
![2](asset\2.jpeg)
![3](asset\3.jpeg)
![4](asset\4.jpeg)
![5](asset\5.jpeg)