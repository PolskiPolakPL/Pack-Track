import 'package:flutter/material.dart';
import 'add_luggage_screen.dart';

class LuggageScreen extends StatefulWidget {
  const LuggageScreen({Key? key}) : super(key: key);

  @override
  _LuggageScreenState createState() => _LuggageScreenState();
}

class _LuggageScreenState extends State<LuggageScreen> {
  // Lista przechowująca informacje o bagażach
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

  // Funkcja dodająca lub edytująca bagaż
  void _addOrEditLuggage(Map<String, dynamic> luggage, [int? index]) {
    setState(() {
      if (index == null) {
        // Dodawanie nowego bagażu
        luggageList.add(luggage);
      } else {
        // Edytowanie istniejącego bagażu
        luggageList[index] = luggage;
      }
    });
  }

  // Funkcja usuwająca bagaż
  void _deleteLuggage(int index) {
    setState(() {
      luggageList.removeAt(index);
    });
  }

  // Nawigacja do ekranu dodawania/edytowania bagażu
  void _navigateToAddEditLuggageScreen([int? index]) async {
    final luggage = index != null ? luggageList[index] : null;
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddLuggageScreen(luggage: luggage),
      ),
    );

    if (result != null) {
      _addOrEditLuggage(result, index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moje Bagaże'),
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
              // Ikony edytowania i usuwania umieszczone po prawej stronie
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => _navigateToAddEditLuggageScreen(index),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _deleteLuggage(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddEditLuggageScreen(),
        tooltip: 'Dodaj Bagaż',
        child: const Icon(Icons.add),
      ),
    );
  }
}
