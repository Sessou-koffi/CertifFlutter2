import 'package:flutter/material.dart';
import '../data/destination_data.dart';
import '../models/destination.dart';
import '../widgets/destination_card.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Destination> _filteredDestinations = [];
  String _searchQuery = '';
  bool _filterByBudget = false;

  @override
  void initState() {
    super.initState();
    _filteredDestinations = DestinationData.sampleDestinations;
  }

  void _applyFilters() {
    setState(() {
      _filteredDestinations = DestinationData.sampleDestinations.where((dest) {
        final matchesSearch = dest.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            dest.country.toLowerCase().contains(_searchQuery.toLowerCase());
        final matchesBudget = !_filterByBudget || dest.pricePerNight < 100;
        return matchesSearch && matchesBudget;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Toutes les Destinations')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Rechercher une ville ou un pays...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onChanged: (value) {
                _searchQuery = value;
                _applyFilters();
              },
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                FilterChip(
                  label: const Text('Budget Éco (< 100€)'),
                  selected: _filterByBudget,
                  onSelected: (bool selected) {
                    setState(() {
                      _filterByBudget = selected;
                      _applyFilters();
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _filteredDestinations.isEmpty
                  ? const Center(child: Text('Aucune destination trouvée.'))
                  : ListView.builder(
                      itemCount: _filteredDestinations.length,
                      itemBuilder: (context, index) {
                        return DestinationCard(destination: _filteredDestinations[index]);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
