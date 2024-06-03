import 'package:flutter/material.dart';

class AddItemsScreen extends StatefulWidget {
  final List<Map<String, dynamic>> selectedLuggage;

  const AddItemsScreen({Key? key, required this.selectedLuggage}) : super(key: key);

  @override
  _AddItemsScreenState createState() => _AddItemsScreenState();
}

class _AddItemsScreenState extends State<AddItemsScreen> {
  final List<Map<String, dynamic>> luggageWithItems = [];

  @override
  void initState() {
    super.initState();
    for (var luggage in widget.selectedLuggage) {
      luggageWithItems.add({
        'name': luggage['name'],
        'type': luggage['type'],
        'size': luggage['size'],
        'color': luggage['color'],
        'items': [],
      });
    }
  }

  void _addItemToLuggage(int index) async {
    final item = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddItemScreen(),
      ),
    );

    if (item != null) {
      setState(() {
        luggageWithItems[index]['items'].add(item);
      });
    }
  }

  void _finishAddingItems() {
    // Here you can save the trip with its luggage and items, and navigate to the trips screen
    Navigator.of(context).pop(luggageWithItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dodaj Przedmioty'),
      ),
      body: ListView.builder(
        itemCount: luggageWithItems.length,
        itemBuilder: (context, index) {
          final luggage = luggageWithItems[index];
          return Card(
            child: Column(
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
                ElevatedButton(
                  onPressed: () => _addItemToLuggage(index),
                  child: const Text('Dodaj Przedmiot'),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _finishAddingItems,
        tooltip: 'Zakończ',
        child: const Icon(Icons.check),
      ),
    );
  }
}

class AddItemScreen extends StatefulWidget {
  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  bool _oneWay = false;

  void _submitItem() {
    if (_formKey.currentState!.validate()) {
      final newItem = {
        'name': _nameController.text,
        'quantity': int.parse(_quantityController.text),
        'oneWay': _oneWay,
      };

      Navigator.of(context).pop(newItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dodaj Przedmiot'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nazwa'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Proszę podać nazwę przedmiotu';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _quantityController,
                decoration: const InputDecoration(labelText: 'Ilość'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Proszę podać ilość';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Proszę podać poprawną liczbę';
                  }
                  return null;
                },
              ),
              CheckboxListTile(
                title: const Text('W jedną stronę'),
                value: _oneWay,
                onChanged: (bool? value) {
                  setState(() {
                    _oneWay = value!;
                  });
                },
              ),
              ElevatedButton(
                onPressed: _submitItem,
                child: const Text('Dodaj Przedmiot'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
