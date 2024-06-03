import 'package:flutter/material.dart';

class ReturnLuggageScreen extends StatefulWidget {
  final List<Map<String, dynamic>> luggage;

  const ReturnLuggageScreen({Key? key, required this.luggage}) : super(key: key);

  @override
  _ReturnLuggageScreenState createState() => _ReturnLuggageScreenState();
}

class _ReturnLuggageScreenState extends State<ReturnLuggageScreen> {
  Map<String, List<bool>> packedItems = {};

  @override
  void initState() {
    super.initState();
    for (var luggage in widget.luggage) {
      packedItems[luggage['name']] = List<bool>.filled(
        luggage['items'].where((item) => !item['oneWay']).length,
        false,
      );
    }
  }

  void _finishTravel() {
    // Check if all items are packed
    bool allPacked = packedItems.values.every((itemList) => itemList.every((item) => item));

    if (allPacked) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Upewnij się, że wszystkie bagaże są spakowane!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final returnLuggage = widget.luggage
        .where((luggage) => luggage['items'].any((item) => !item['oneWay']))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Powrót z Podróży'),
      ),
      body: ListView.builder(
        itemCount: returnLuggage.length,
        itemBuilder: (context, index) {
          final luggage = returnLuggage[index];
          final items = luggage['items'].where((item) => !item['oneWay']).toList();

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
                  itemCount: items.length,
                  itemBuilder: (context, itemIndex) {
                    final item = items[itemIndex];
                    return ListTile(
                      title: Text(item['name']),
                      subtitle: Text('Ilość: ${item['quantity']}'),
                      trailing: Checkbox(
                        value: packedItems[luggage['name']]?[itemIndex] ?? false,
                        onChanged: (bool? value) {
                          setState(() {
                            packedItems[luggage['name']]?[itemIndex] = value!;
                          });
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _finishTravel,
        tooltip: 'Zakończ Podróż',
        child: const Icon(Icons.check),
      ),
    );
  }
}
