import 'package:flutter/material.dart';
import 'package:projekt/screens/return_luggage_screen.dart'; // Import nowego ekranu

class TravelDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> travel;

  const TravelDetailsScreen({Key? key, required this.travel}) : super(key: key);

  void _startReturn(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ReturnLuggageScreen(luggage: travel['luggage']),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(travel['name']),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: travel['luggage'].length,
              itemBuilder: (context, index) {
                final luggage = travel['luggage'][index];
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        color: luggage['color'],
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          luggage['name'],
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: luggage['items'].length,
                        itemBuilder: (context, itemIndex) {
                          final item = luggage['items'][itemIndex];
                          return ListTile(
                            title: Text(item['name']),
                            subtitle: Text('Ilość: ${item['quantity']}'),
                            trailing: item['oneWay']
                                ? const Icon(Icons.arrow_forward, color: Colors.red)
                                : null,
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () => _startReturn(context),
              child: const Text('Powrót'),
            ),
          ),
        ],
      ),
    );
  }
}
