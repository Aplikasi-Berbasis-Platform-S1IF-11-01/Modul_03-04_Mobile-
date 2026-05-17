import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> data = ["Flutter", "Dart", "Android", "iOS", "Widget"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Widget UI Flutter"),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // CONTAINER
                Text(
                  "1. Container",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 10),

                Container(
                  height: 100,
                  width: double.infinity,
                  alignment: Alignment.center,
                  color: Colors.orange,
                  child: Text(
                    "Ini Container",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),

                SizedBox(height: 20),

                // GRIDVIEW
                Text(
                  "2. GridView",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 10),

                Container(
                  height: 220,
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    physics: NeverScrollableScrollPhysics(),
                    children: List.generate(6, (index) {
                      return Container(
                        alignment: Alignment.center,
                        color: Colors.blue,
                        child: Text(
                          "Item ${index + 1}",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      );
                    }),
                  ),
                ),

                SizedBox(height: 20),

                // LISTVIEW
                Text(
                  "3. ListView",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                Container(
                  height: 150,
                  child: ListView(
                    children: [
                      ListTile(title: Text("A")),
                      ListTile(title: Text("B")),
                      ListTile(title: Text("C")),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                // LISTVIEW BUILDER
                Text(
                  "4. ListView.builder",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                Container(
                  height: 200,
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.star),
                        title: Text(data[index]),
                      );
                    },
                  ),
                ),

                SizedBox(height: 20),

                // LISTVIEW SEPARATED
                Text(
                  "5. ListView.separated",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                Container(
                  height: 200,
                  child: ListView.separated(
                    itemCount: data.length,
                    separatorBuilder: (context, index) {
                      return Divider(color: Colors.black);
                    },
                    itemBuilder: (context, index) {
                      return ListTile(title: Text(data[index]));
                    },
                  ),
                ),

                SizedBox(height: 20),

                // STACK
                Text(
                  "6. Stack",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 10),

                Container(
                  height: 200,
                  child: Stack(
                    children: [
                      Container(width: 200, height: 200, color: Colors.red),

                      Positioned(
                        top: 40,
                        left: 40,
                        child: Container(
                          width: 120,
                          height: 120,
                          color: Colors.yellow,
                        ),
                      ),

                      Positioned(
                        top: 80,
                        left: 60,
                        child: Text(
                          "STACK",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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
