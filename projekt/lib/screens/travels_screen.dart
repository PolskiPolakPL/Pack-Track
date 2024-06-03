import 'package:flutter/material.dart';
import 'package:projekt/screens/travel_details_screen.dart';
import 'package:projekt/screens/select_luggage_screen.dart';
import 'package:projekt/screens/add_items_screen.dart';
import 'package:projekt/widgets/travel_card.dart'; // Import nowego pliku

class TravelsScreen extends StatefulWidget {
  const TravelsScreen({Key? key}) : super(key: key);

  @override
  _TravelsScreenState createState() => _TravelsScreenState();
}

class _TravelsScreenState extends State<TravelsScreen> {
  List<Map<String, dynamic>> travels = [];
  int travelCount = 0;

  @override
  void initState() {
    super.initState();
    _addSampleTravel(); // Dodajemy przykładową podróż
  }

  void _addSampleTravel() {
    travelCount++;
    travels.add({
      'name': 'Podróż Testowa',
      'luggage': [
        {
          'name': 'Bagaż Testowy 1',
          'color': Colors.blue,
          'items': [
            {'name': 'Koszulka', 'quantity': 3, 'oneWay': false},
            {'name': 'Spodnie', 'quantity': 2, 'oneWay': true},
            {'name': 'Buty', 'quantity': 1, 'oneWay': false},
          ],
        },
        {
          'name': 'Bagaż Testowy 2',
          'color': Colors.green,
          'items': [
            {'name': 'Laptop', 'quantity': 1, 'oneWay': false},
            {'name': 'Ładowarka', 'quantity': 1, 'oneWay': false},
            {'name': 'Książka', 'quantity': 2, 'oneWay': true},
          ],
        },
      ],
    });
  }

  void _startNewTravel(BuildContext context) async {
    final selectedLuggage = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SelectLuggageScreen(), // Zmieniony ekran
      ),
    );

    if (selectedLuggage != null) {
      final luggageWithItems = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => AddItemsScreen(selectedLuggage: selectedLuggage),
        ),
      );

      if (luggageWithItems != null) {
        setState(() {
          travelCount++;
          travels.add({
            'name': 'Podróż $travelCount',
            'luggage': luggageWithItems,
          });
        });
      }
    }
  }

  void _viewTravelDetails(Map<String, dynamic> travel) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TravelDetailsScreen(travel: travel),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moje Podróże'),
      ),
      body: ListView.builder(
        itemCount: travels.length,
        itemBuilder: (context, index) {
          final travel = travels[index];
          return TravelCard(
            travel: travel,
            onTap: () => _viewTravelDetails(travel),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startNewTravel(context),
        tooltip: 'Dodaj Podróż',
        child: const Icon(Icons.add),
      ),
    );
  }
}
