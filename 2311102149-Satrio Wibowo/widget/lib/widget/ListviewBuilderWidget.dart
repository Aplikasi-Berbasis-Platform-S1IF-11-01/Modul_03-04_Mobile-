import 'package:flutter/material.dart';

class ListviewBuilderWidget extends StatelessWidget {
  const ListviewBuilderWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final List<String> data = ["Apple", "Banana", "Cherry", "Date"];
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (context, index) => ListTile(title: Text(data[index])),
    );
  }
}