// Andreas Besar Wibowo - 2311102198
// Modul 3 dan 4 Flutter - Container, GridView, ListView, Stack

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> data = ["List 1", "List 2", "List 3", "List 4"];

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget cardWrapper(Widget child) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(padding: const EdgeInsets.all(8.0), child: child),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Modul 3 dan 4 Flutter - Andreas Besar Wibowo"), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container
                sectionTitle("Container"),
                cardWrapper(
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Container",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),

                // GridView
                sectionTitle("GridView"),
                cardWrapper(
                  SizedBox(
                    height: 200,
                    child: GridView.builder(
                      itemCount: 9,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 249, 8, 253),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Grid ${index + 1}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                // ListView
                sectionTitle("ListView"),
                cardWrapper(
                  SizedBox(
                    height: 120,
                    child: ListView(
                      children: ["A", "B", "C", "D"]
                          .map(
                            (e) => ListTile(
                              leading: Icon(Icons.label),
                              title: Text(e),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),

                // ListView.builder
                sectionTitle("ListView.builder"),
                cardWrapper(
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(Icons.list),
                          title: Text(data[index]),
                        );
                      },
                    ),
                  ),
                ),

                // ListView.separated
                sectionTitle("ListView.separated"),
                cardWrapper(
                  SizedBox(
                    height: 150,
                    child: ListView.separated(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text("Separated ${data[index]}"),
                        );
                      },
                      separatorBuilder: (_, __) => Divider(),
                    ),
                  ),
                ),

                // Stack
                sectionTitle("Stack"),
                cardWrapper(
                  SizedBox(
                    height: 150,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          left: 20,
                          child: Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: Text(
                            "Andreas Besar Wibowo",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
