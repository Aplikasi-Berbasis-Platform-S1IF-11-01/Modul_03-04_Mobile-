import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 150,
        width: 150,
        child: Stack(
          children: [
            Positioned(
              top: 0, left: 0,
              child: Container(width: 100, height: 100, decoration: const BoxDecoration(color: Colors.orangeAccent, shape: BoxShape.circle)),
            ),
            Positioned(
              bottom: 10, right: 10,
              child: Container(
                width: 110, height: 110,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withOpacity(0.5)),
                ),
                child: const Center(child: Text("GLASS", style: TextStyle(fontWeight: FontWeight.bold))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}