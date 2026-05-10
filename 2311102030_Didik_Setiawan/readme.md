

<div align="center">
  <br />
  <h1>LAPORAN PRAKTIKUM <br>APLIKASI BERBASIS PLATFORM
</h1>
  <br />
  <h3>MODUL 03-04 - Mobile
 <br> Pengenalan Flutter</h3>
  <br />
  <img src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2F1.bp.blogspot.com%2F-vb7jyBjK-sM%2FXXfKp51LrjI%2FAAAAAAAACts%2FEjcXzlgZwSswNWXsBHMyX-6aav1mjA77QCPcBGAYYCw%2Fs1600%2FLogo_Telkom_University_potrait.png&f=1&nofb=1&ipt=9d030d54102ea96369d39fe491220e0536195abc8ee443279c1a420302206400" alt="Logo Telkom" width="300"> 
  <br /><br /><br />
  
  <h3>Disusun Oleh :</h3>
  <p>
    <strong>Didik Setiawan</strong><br>
    <strong>2311102030</strong><br>
    <strong>IF-11-REG-01</strong>
  </p>
  <br />
  
  <h3>Dosen Pengampu :</h3>
  <p><strong>Dimas Fanny Hebrasianto Permadi, S.ST., M.Kom</strong></p>
  <br />
  
  <h4>Asisten Praktikum :</h4>
  <strong>Apri Pandu Wicaksono</strong> <br>
  <strong>Rangga Pradarrell Fathi</strong>
  <br />
  
  <h3>LABORATORIUM HIGH PERFORMANCE<br>FAKULTAS INFORMATIKA<br>UNIVERSITAS TELKOM PURWOKERTO<br>2026</h3>
</div>

---

## DASAR TEORI
  Flutter adalah framework open-source yang dikembangkan oleh Google untuk membangun aplikasi lintas platform seperti Android, iOS, web, dan desktop menggunakan satu kode sumber. Flutter menggunakan bahasa pemrograman Dart dan berfokus pada pembuatan antarmuka pengguna (UI) yang cepat, responsif, dan menarik. Dalam Flutter, semua elemen tampilan disebut widget yang menjadi dasar dalam menyusun aplikasi.

Widget dalam Flutter digunakan untuk membangun berbagai komponen seperti teks, gambar, tombol, hingga layout seperti Container, Row, Column, ListView, GridView, dan Stack. Flutter juga memiliki sistem rendering sendiri sehingga tampilan aplikasi dapat konsisten di berbagai perangkat. Dengan konsep ini, Flutter memudahkan pengembang dalam membuat aplikasi modern dengan efisien dan performa tinggi.









### Container

```bash
Container(
  width: double.infinity,
  height: 100,
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(12),
  ),
  child: const Center(
    child: Text(
      "Ini adalah Container",
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    ),
  ),
)
```
##### penjelasan

Widget Container pada Flutter digunakan untuk membuat tampilan dasar berbentuk kotak. Properti width: double.infinity membuat lebar penuh, height: 100 menentukan tinggi 100 pixel, dan color: Colors.blue memberi warna biru. borderRadius digunakan untuk membuat sudut melengkung, sedangkan Center berfungsi menempatkan teks di tengah container.




### GridView

```bash
GridView.builder(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  itemCount: 6,
  gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
  ),
  itemBuilder: (context, index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text("Item ${index + 1}"),
      ),
    );
  },
)
```
##### penjelasan
GridView.builder digunakan untuk membuat tampilan grid secara otomatis. Properti itemCount: 6 menentukan jumlah item sebanyak 6, sedangkan crossAxisCount: 2 membuat grid terdiri dari 2 kolom. itemBuilder berfungsi untuk membuat item satu per satu secara dinamis, dan index + 1 digunakan untuk menampilkan nomor pada setiap item.






### ListView

```bash
SizedBox(
  height: 150,
  child: ListView(
    children: const [
      ListTile(title: Text("A")),
      ListTile(title: Text("B")),
      ListTile(title: Text("C")),
    ],
  ),
)
```
##### penjelasan

ListView digunakan untuk membuat daftar item secara vertikal. ListTile merupakan widget bawaan Flutter yang digunakan sebagai item pada list. Pada contoh ini, data ditampilkan secara manual yaitu A, B, dan C.




### ListView.builder

```bash
List<String> buah = [
  "Apel",
  "Mangga",
  "Jeruk",
  "Pisang"
];

ListView.builder(
  itemCount: buah.length,
  itemBuilder: (context, index) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.apple),
        title: Text(buah[index]),
      ),
    );
  },
)

```
##### penjelasan
List<.String> digunakan untuk menyimpan data dalam bentuk array. ListView.builder digunakan untuk membuat daftar secara dinamis berdasarkan data dari array tersebut. Properti itemCount menentukan jumlah item sesuai panjang list, sedangkan buah[index] digunakan untuk mengambil dan menampilkan data berdasarkan posisi index masing-masing item.




### ListView.separated

```bash
ListView.separated(
  itemCount: makanan.length,
  itemBuilder: (context, index) {
    return ListTile(
      leading: const Icon(Icons.fastfood),
      title: Text(makanan[index]),
    );
  },
  separatorBuilder: (context, index) {
    return const Divider(
      thickness: 1,
    );
  },
)
```
##### penjelasan

ListView.separated digunakan untuk membuat daftar dengan pemisah antar item. separatorBuilder berfungsi untuk menambahkan pemisah, biasanya menggunakan Divider() yang menghasilkan garis di antara setiap item list agar tampilan lebih rapi dan mudah dibaca.



### Stack

```bash
Stack(
  alignment: Alignment.center,
  children: [

    Container(
      width: 250,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(15),
      ),
    ),

    Positioned(
      top: 10,
      right: 10,
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          color: Colors.yellow,
          shape: BoxShape.circle,
        ),
      ),
    ),

    const Text(
      "Ini adalah Stack",
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
  ],
)
```
##### penjelasan

Stack digunakan untuk menumpuk beberapa widget dalam satu area. Container berwarna ungu menjadi latar belakang utama, sedangkan Positioned digunakan untuk mengatur posisi lingkaran kuning di dalam stack. Selain itu, Text ditampilkan di atas container utama sehingga semua elemen bisa saling bertumpuk sesuai urutan.


### screenshoot
![Alt 1](https://github.com/didiksetia1/asset/blob/main/WhatsApp%20Image%202026-05-11%20at%2001.08.15.jpeg?raw=true)


![Alt 1](https://raw.githubusercontent.com/didiksetia1/asset/refs/heads/main/WhatsApp%20Image%202026-05-11%20at%2001.08.17.jpeg)




