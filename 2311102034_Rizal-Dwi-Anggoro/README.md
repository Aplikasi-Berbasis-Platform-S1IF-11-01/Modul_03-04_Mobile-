<div align="center">
  <br />
  <h1>LAPORAN PRAKTIKUM <br>APLIKASI BERBASIS PLATFORM</h1>
  <br />
  <h3>MODUL 03-04 - Mobile <br> Pengenalan Flutter  </h3>
  <br />
  <img src="assets\logo_telkom.jpeg" alt="Logo" width="300"> 
  <br />
  <br />
  <br />
  <h3>Disusun Oleh :</h3>
  <p>
    <strong>Rizal Dwi Anggoro</strong><br>
    <strong>2311102034</strong><br>
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
Container(
  width: double.infinity,
  height: 80,
  decoration: BoxDecoration(
    color: const Color(0xFF4F46E5),
    borderRadius: BorderRadius.circular(16),
  ),
  child: Center(child: Text('Container Biru')),
)
```
Widget kotak serbaguna. Bisa diatur ukuran, warna, border, shadow, dan radius sudutnya lewat `BoxDecoration`.

### 1.2 GridView
```dart
GridView.count(
  crossAxisCount: 3,       // jumlah kolom
  crossAxisSpacing: 10,    // jarak antar kolom
  mainAxisSpacing: 10,     // jarak antar baris
  shrinkWrap: true,        // ikuti ukuran konten
  children: [...],
)
```
Menampilkan item dalam bentuk grid. `crossAxisCount`: 3 berarti 3 kolom, jadi 6 item = 2 baris.

### 1.3 ListView (statis)
```dart
ListView(
  shrinkWrap: true,
  children: [
    _StaticListTile(label: 'A', ...),
    _StaticListTile(label: 'B', ...),
    _StaticListTile(label: 'C', ...),
  ],
)
```
List sederhana dengan item yang ditulis manual satu per satu. Cocok untuk data yang jumlahnya sedikit dan tetap.

### 1.4 ListView.builder
```dart
ListView.builder(
  itemCount: buahList.length,   // jumlah item = panjang array
  itemBuilder: (context, index) {
    final buah = buahList[index]; // ambil data per index
    return ListTile(...);
  },
)
```
List yang dibuat otomatis dari array buahList. Lebih efisien karena item dibuat hanya saat ditampilkan ke layar.

### 1.5 ListView.separated
```dart
ListView.separated(
  itemCount: buahList.length,
  separatorBuilder: (context, index) => Divider(...), // garis pembatas
  itemBuilder: (context, index) {
    return ListTile(...);
  },
)
```
Sama seperti builder, tapi ada separatorBuilder yang otomatis menambahkan garis pembatas di antara setiap item.

### 1.6 Stack
```dart
Stack(
  children: [
    Container(...),           // Layer 1 - paling bawah
    Positioned(               // Layer 2 - di atas layer 1
      top: 30, left: 30,
      child: Container(...),
    ),
    Positioned(               // Layer 3 - paling atas
      bottom: 20, right: 20,
      child: Text('Stack!'),
    ),
  ],
)
```
Menumpuk widget satu di atas yang lain. Positioned digunakan untuk mengatur posisi tepat setiap layer (atas, bawah, kiri, kanan).

---
## 2. Screenshoot Hasil
### 2.1 Tampilan Dashboard
![Dashboard](assets\dashboard1.png)

![Dashboard](assets\dashboard2.png)

### 2.2 Tampilan ListView
![ListView](assets\listview1.png)
![Dashboard](assets\listview2.png)
![Dashboard](assets\listview3.png)

### 2.3 Tampilan Stack
![Stack](assets\stack1.png)
![Stack](assets\stack2.png)
