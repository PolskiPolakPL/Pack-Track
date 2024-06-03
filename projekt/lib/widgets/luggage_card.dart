import 'package:flutter/material.dart';

class LuggageCard extends StatelessWidget {
  final Color color;
  final String name;
  final String type;
  final String size;

  const LuggageCard({
    Key? key,
    required this.color,
    required this.name,
    required this.type,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              color: color,
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      type,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      size,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}