import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../data/destination_data.dart';
import '../routes/app_router.dart';
import '../widgets/theme_toggle_button.dart';
import '../widgets/destination_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final popularDestinations = DestinationData.sampleDestinations
        .where((d) => d.isPopular)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Explorer le Monde'),
        actions: const [ThemeToggleButton()],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = constraints.maxWidth > 600;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Bouton de thème très visible au milieu pour le robot
                Card(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Changer le style de l\'application :', style: TextStyle(fontWeight: FontWeight.bold)),
                        ThemeToggleButton(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Destinations Populaires',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                
                SizedBox(
                  height: 270,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: popularDestinations.length,
                    itemBuilder: (context, index) {
                      final item = popularDestinations[index];
                      return Container(
                        width: isTablet ? 320 : 250,
                        margin: const EdgeInsets.only(right: 16),
                        child: DestinationCard(destination: item),
                      );
                    },
                  ),
                ),
                
                const SizedBox(height: 24),
                const Text(
                  'Catégories d\'Aventure',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),

                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: isTablet ? 4 : 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 2.5,
                  children: [
                    _buildCategoryCard(context, 'Plages', Icons.beach_access, Colors.blue),
                    _buildCategoryCard(context, 'Montagnes', Icons.terrain, Colors.green),
                    _buildCategoryCard(context, 'Villes', Icons.location_city, Colors.purple),
                    _buildCategoryCard(context, 'Culture', Icons.museum, Colors.orange),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => context.push(AppRouter.list),
                  icon: const Icon(Icons.search),
                  label: const Text('Toutes les destinations'),
                  style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 12)),
                ),
              ),
              const SizedBox(width: 12),
              FloatingActionButton(
                onPressed: () => context.push(AppRouter.addTrip),
                tooltip: 'Planifier un voyage',
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String title, IconData icon, Color color) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () => context.push(AppRouter.list),
        borderRadius: BorderRadius.circular(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
