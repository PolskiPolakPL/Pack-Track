import 'package:flutter/material.dart';

class TravelCard extends StatelessWidget {
  final Map<String, dynamic> travel;
  final VoidCallback onTap;

  const TravelCard({Key? key, required this.travel, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(travel['name']),
        subtitle: Text('${travel['luggage'].length} bagaży'),
        onTap: onTap,
      ),
    );
  }
}
