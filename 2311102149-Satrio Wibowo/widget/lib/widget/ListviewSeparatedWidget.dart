import 'package:flutter/material.dart';

class ListviewSeparatedWidget extends StatelessWidget {
  const ListviewSeparatedWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      separatorBuilder: (context, index) => const Divider(thickness: 2),
      itemBuilder: (context, index) => ListTile(title: Text("User ID: $index")),
    );
  }
}