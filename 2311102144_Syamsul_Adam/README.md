<<<<<<< HEAD
<div align="center">
  <br />
  <h1>LAPORAN PRAKTIKUM <br>APLIKASI BERBASIS PLATFORM</h1>
  <br />
  <h3>TUGAS MODUL 03 & 04 <br> Pengenalan Flutter</h3>
  <br />
  <br />
  <img src="assets/Logo Tel-u.png" alt="Logo" width="300"> 
  <br />
  <br />
  <br />
  <br />
  <h3>Disusun Oleh :</h3>
  <p>
    <strong>Syamsul Adam</strong><br>
    <strong>2311102144</strong><br>
    <strong>S1 IF-11-01</strong>
  </p>
  <br />
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

## Source Code

### `lib/main.dart`

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ═══════════════════════════════════════
// COLORS
// ═══════════════════════════════════════
class AppColors {
  static const background = Color(0xFFF4F7FC);
  static const primary = Color(0xFF4F46E5);
  static const secondary = Color(0xFFEC4899);
  static const darkText = Color(0xFF1E293B);
  static const lightText = Color(0xFF64748B);
  static const border = Color(0xFFE2E8F0);
  static const white = Colors.white;
}

// ═══════════════════════════════════════
// APP
// ═══════════════════════════════════════
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Zyco',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'Roboto',
      ),
      home: const HomePage(),
    );
  }
}

// ═══════════════════════════════════════
// HOME PAGE
// ═══════════════════════════════════════
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // DATA
  static const fruits = [
    "Taylor Swift",
    "Bruno Mars",
    "Ariana Grande",
    "BTS",
    "Billie Eilish",
  ];

  static const users = [
    "M Raflan Kemal",
    "M Faleno Albare",
    "Julianto Ibnu Natan",
    "M Alfan Naraya r",
    "Dimas Akal Hernanda",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Zyco flutter"),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ═════════════════════════════
            // CONTAINER
            // ═════════════════════════════
            const SectionTitle("Container"),

            const SizedBox(height: 14),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.primary, AppColors.secondary],
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white24,
                    child: Icon(
                      Icons.widgets_rounded,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Container Widget",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),

                        SizedBox(height: 6),

                        Text(
                          "Contoh container dengan warna dan dekorasi.",
                          style: TextStyle(color: Colors.white70, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // ═════════════════════════════
            // GRIDVIEW
            // ═════════════════════════════
            const SectionTitle("GridView"),

            const SizedBox(height: 14),

            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.2,
              children: const [
                MenuCard(
                  icon: Icons.home_rounded,
                  title: "Home",
                  color: Colors.blue,
                ),

                MenuCard(
                  icon: Icons.person_rounded,
                  title: "Profile",
                  color: Colors.green,
                ),

                MenuCard(
                  icon: Icons.settings_rounded,
                  title: "Settings",
                  color: Colors.orange,
                ),

                MenuCard(
                  icon: Icons.message_rounded,
                  title: "Message",
                  color: Colors.purple,
                ),

                MenuCard(
                  icon: Icons.camera_alt_rounded,
                  title: "Camera",
                  color: Colors.red,
                ),

                MenuCard(
                  icon: Icons.map_rounded,
                  title: "Map",
                  color: Colors.teal,
                ),
              ],
            ),

            const SizedBox(height: 32),

            // ═════════════════════════════
            // LISTVIEW BIASA
            // ═════════════════════════════
            const SectionTitle("ListView"),

            const SizedBox(height: 14),

            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppColors.border),
              ),
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  ListTile(
                    leading: CircleAvatar(child: Text("A")),
                    title: Text("Yonex"),
                  ),

                  Divider(height: 1),

                  ListTile(
                    leading: CircleAvatar(child: Text("B")),
                    title: Text("Victor"),
                  ),

                  Divider(height: 1),

                  ListTile(
                    leading: CircleAvatar(child: Text("C")),
                    title: Text("Adam Winner"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // ═════════════════════════════
            // LISTVIEW.BUILDER
            // ═════════════════════════════
            const SectionTitle("Builder"),

            const SizedBox(height: 14),

            ListView.builder(
              itemCount: fruits.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(
                  elevation: 0,
                  color: AppColors.white,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    side: const BorderSide(color: AppColors.border),
                  ),

                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.primary.withOpacity(0.1),

                      child: Text(
                        "${index + 1}",
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    title: Text(
                      fruits[index],
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),

                    subtitle: const Text("ini nama artis ngarang"),

                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                );
              },
            ),

            const SizedBox(height: 32),

            // ═════════════════════════════
            // LISTVIEW.SEPARATED
            // ═════════════════════════════
            const SectionTitle("Separated"),

            const SizedBox(height: 14),

            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppColors.border),
              ),

              child: ListView.separated(
                itemCount: users.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),

                separatorBuilder: (context, index) {
                  return const Divider(height: 1);
                },

                itemBuilder: (context, index) {
                  final user = users[index];

                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.pink.withOpacity(0.15),

                      child: Text(
                        user[0],
                        style: const TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    title: Text(
                      user,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),

                    subtitle: const Text("Active Member"),

                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 32),

            // ═════════════════════════════
            // STACK
            // ═════════════════════════════
            const SectionTitle("Stack"),

            const SizedBox(height: 14),

            SizedBox(
              height: 230,

              child: Stack(
                children: [
                  // LAYER BELAKANG
                  Positioned(
                    top: 35,
                    left: 25,

                    child: Container(
                      width: 270,
                      height: 150,

                      decoration: BoxDecoration(
                        color: Colors.purple.shade100,
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),

                  // LAYER TENGAH
                  Positioned(
                    top: 18,
                    left: 12,

                    child: Container(
                      width: 270,
                      height: 150,

                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),

                  // LAYER DEPAN
                  Container(
                    width: 270,
                    height: 150,
                    padding: const EdgeInsets.all(22),

                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppColors.primary, AppColors.secondary],
                      ),

                      borderRadius: BorderRadius.circular(24),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      mainAxisAlignment: MainAxisAlignment.center,

                      children: const [
                        Text(
                          "Stack Widget",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 8),

                        Text(
                          "Contoh tampilan bertumpuk menggunakan Stack.",
                          style: TextStyle(color: Colors.white70, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════
// SECTION TITLE
// ═══════════════════════════════════════
class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: AppColors.darkText,
      ),
    );
  }
}

// ═══════════════════════════════════════
// MENU CARD
// ═══════════════════════════════════════
class MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const MenuCard({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.border),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: color.withOpacity(0.12),

            child: Icon(icon, color: color, size: 30),
          ),

          const SizedBox(height: 12),

          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.darkText,
            ),
          ),
        ],
      ),
    );
  }
}

```

### Penjelasan

Program Flutter ini dibuat untuk menampilkan beberapa widget dasar pada Flutter seperti Container, GridView, ListView, ListView.builder, ListView.separated, dan Stack dalam satu halaman aplikasi. Program dimulai dari fungsi main() yang menjalankan widget MyApp menggunakan runApp(). Pada bagian MyApp, digunakan MaterialApp untuk mengatur tema aplikasi seperti warna latar belakang, font, serta halaman utama yaitu HomePage. Selain itu, dibuat juga class AppColors yang berfungsi menyimpan kumpulan warna agar tampilan aplikasi lebih konsisten dan mudah dikelola. Di dalam HomePage, terdapat beberapa data array seperti daftar artis dan daftar pengguna yang nantinya digunakan pada widget list.

Pada tampilan utama, widget disusun menggunakan SingleChildScrollView dan Column agar seluruh konten dapat discroll ke bawah. Bagian pertama menampilkan Container dengan dekorasi gradient warna dan ikon. Selanjutnya terdapat GridView.count yang menampilkan 6 menu berbentuk grid. Kemudian ada ListView biasa yang menampilkan tiga item statis yaitu A, B, dan C. Widget ListView.builder digunakan untuk menampilkan daftar artis secara otomatis dari data array, sedangkan ListView.separated digunakan untuk menampilkan daftar pengguna dengan garis pemisah antar item. Terakhir, widget Stack digunakan untuk membuat tampilan bertumpuk dengan beberapa layer container sehingga menghasilkan efek desain yang lebih menarik. Program ini juga menggunakan widget tambahan seperti SectionTitle dan MenuCard agar kode lebih rapi dan dapat digunakan kembali.

---

## Screenshot Hasil
<img src="1.PNG" width="250">

<img src="2.PNG" width="250">

<img src="3.PNG" width="250">
=======
# Modul_03-04_Mobile-
Kumpulkan tugas sesuai dengan ketentuan seperti biasa
>>>>>>> eb55a600ccdd004197093e285cd0164a15cd0d95
