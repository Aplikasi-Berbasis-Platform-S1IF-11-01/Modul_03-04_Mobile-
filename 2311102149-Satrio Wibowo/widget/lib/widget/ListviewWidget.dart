import 'package:flutter/material.dart';

class ListviewWidget extends StatelessWidget {
  const ListviewWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView(
        children: const [
          ListTile(title: Text("Item A"), leading: Icon(Icons.label)),
          ListTile(title: Text("Item B"), leading: Icon(Icons.label)),
          ListTile(title: Text("Item C"), leading: Icon(Icons.label)),
        ],
      ),
    );
  }
}