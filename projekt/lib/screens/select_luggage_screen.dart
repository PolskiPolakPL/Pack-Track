import 'package:flutter/material.dart';
import 'add_items_screen.dart'; // Import nowego ekranu

class SelectLuggageScreen extends StatefulWidget {
  const SelectLuggageScreen({Key? key}) : super(key: key);

  @override
  _SelectLuggageScreenState createState() => _SelectLuggageScreenState();
}

class _SelectLuggageScreenState extends State<SelectLuggageScreen> {
  List<Map<String, dynamic>> luggageList = [
    {
      'name': 'Bagaż 1',
      'type': 'Plecak',
      'size': 'M',
      'color': Colors.blue,
    },
    {
      'name': 'Bagaż 2',
      'type': 'Walizka',
      'size': 'L',
      'color': Colors.green,
    },
  ];

  List<bool> selectedLuggage = [];

  @override
  void initState() {
    super.initState();
    selectedLuggage = List<bool>.filled(luggageList.length, false);
  }

  void _navigateToNextStep() {
    final selected = luggageList
        .asMap()
        .entries
        .where((entry) => selectedLuggage[entry.key])
        .map((entry) => entry.value)
        .toList();

    Navigator.of(context).pop(selected); // Zmienione na pop zamiast push
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wybierz Bagaż'),
      ),
      body: ListView.builder(
        itemCount: luggageList.length,
        itemBuilder: (context, index) {
          final luggage = luggageList[index];
          return Card(
            child: ListTile(
              leading: Container(
                width: 20,
                height: 20,
                color: luggage['color'],
              ),
              title: Text(luggage['name']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Typ: ${luggage['type']}'),
                      const SizedBox(width: 20),
                      Text('Rozmiar: ${luggage['size']}'),
                    ],
                  ),
                ],
              ),
              trailing: Checkbox(
                value: selectedLuggage[index],
                onChanged: (bool? value) {
                  setState(() {
                    selectedLuggage[index] = value!;
                  });
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToNextStep,
        tooltip: 'Dalej',
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
