import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const CheesecakeApp());
}

class CheesecakeApp extends StatelessWidget {
  const CheesecakeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cheesecake Store',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<String> cheesecakeList = const [
    "Strawberry Cheesecake",
    "Lotus Cheesecake",
    "Matcha Cheesecake",
    "Blueberry Cheesecake",
    "Chocolate Cheesecake",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f1f3),
      appBar: AppBar(
        title: const Text("Cheesecake Store"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xff6D214F),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // STACK
            Stack(
              children: [
                Container(
                  height: 220,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff6D214F),
                        Color(0xffB33771),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),

                Positioned(
                  top: 50,
                  left: 25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Sweet & Creamy",
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 10),

                      Text(
                        "Premium Cheesecake Collection",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  right: 20,
                  bottom: 20,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.cake,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // CONTAINER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff8E4162),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pink.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    "Fresh Cheesecake Everyday 🍰",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // GRIDVIEW
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Popular Menu",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff6D214F),
                ),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              height: 260,
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1.2,
                children: List.generate(
                  6,
                  (index) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xffB33771),
                          Color(0xff6D214F),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Cake ${index + 1}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // LISTVIEW BIASA
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Category",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff6D214F),
                ),
              ),
            ),

            SizedBox(
              height: 150,
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  itemList("A - Classic Cheesecake"),
                  itemList("B - Premium Cheesecake"),
                  itemList("C - Mini Cheesecake"),
                ],
              ),
            ),

            // LISTVIEW BUILDER
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Cheesecake List",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff6D214F),
                ),
              ),
            ),

            SizedBox(
              height: 250,
              child: ListView.builder(
                itemCount: cheesecakeList.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Color(0xffB33771),
                        child: Icon(
                          Icons.cake,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(cheesecakeList[index]),
                    ),
                  );
                },
              ),
            ),

            // LISTVIEW SEPARATED
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Store Information",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff6D214F),
                ),
              ),
            ),

            SizedBox(
              height: 180,
              child: ListView.separated(
                itemCount: 4,
                padding: const EdgeInsets.all(20),
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  );
                },
                itemBuilder: (context, index) {
                  List<String> info = [
                    "Open Everyday",
                    "Premium Ingredients",
                    "Freshly Baked",
                    "Free Delivery",
                  ];

                  return Text(
                    info[index],
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemList(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xffF8D7E3),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xff6D214F),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}