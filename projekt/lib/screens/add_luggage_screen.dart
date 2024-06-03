import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AddLuggageScreen extends StatefulWidget {
  final Map<String, dynamic>? luggage;

  const AddLuggageScreen({Key? key, this.luggage}) : super(key: key);

  @override
  _AddLuggageScreenState createState() => _AddLuggageScreenState();
}

class _AddLuggageScreenState extends State<AddLuggageScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late String _selectedType;
  late String _selectedSize;
  late Color _selectedColor;

  // Listy dostępnych typów i rozmiarów bagażu
  final List<String> _types = ['Plecak', 'Torebka', 'Walizka', 'Inne'];
  final List<String> _sizes = ['S', 'M', 'L', 'XL'];

  @override
  void initState() {
    super.initState();
    // Inicjalizacja kontrolerów i zmiennych na podstawie przekazanego bagażu (jeśli istnieje)
    _nameController = TextEditingController(text: widget.luggage?['name'] ?? '');
    _selectedType = widget.luggage?['type'] ?? 'Plecak';
    _selectedSize = widget.luggage?['size'] ?? 'M';
    _selectedColor = widget.luggage?['color'] ?? Colors.red;
  }

  // Funkcja wysyłająca dane formularza
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newLuggage = {
        'name': _nameController.text,
        'type': _selectedType,
        'size': _selectedSize,
        'color': _selectedColor,
      };

      Navigator.of(context).pop(newLuggage);
    }
  }

  // Funkcja otwierająca selektor koloru
  void _openColorPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Wybierz kolor'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _selectedColor,
              onColorChanged: (color) {
                setState(() {
                  _selectedColor = color;
                });
              },
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Zamknij'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.luggage == null ? 'Dodaj Nowy Bagaż' : 'Edytuj Bagaż'),
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
                    return 'Proszę podać nazwę';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _selectedType,
                items: _types.map((type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedType = value!;
                  });
                },
                decoration: const InputDecoration(labelText: 'Typ'),
              ),
              DropdownButtonFormField<String>(
                value: _selectedSize,
                items: _sizes.map((size) {
                  return DropdownMenuItem<String>(
                    value: size,
                    child: Text(size),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedSize = value!;
                  });
                },
                decoration: const InputDecoration(labelText: 'Rozmiar'),
              ),
              ElevatedButton(
                onPressed: _openColorPicker,
                child: const Text('Wybierz kolor'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _selectedColor,
                  textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Zapisz'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
