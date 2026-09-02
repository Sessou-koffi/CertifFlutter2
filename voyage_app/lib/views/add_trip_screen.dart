import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/custom_input.dart';

class AddTripScreen extends StatefulWidget {
  const AddTripScreen({super.key});

  @override
  State<AddTripScreen> createState() => _AddTripScreenState();
}

class _AddTripScreenState extends State<AddTripScreen> {
  final _formKey = GlobalKey<FormState>(); // Déclaré en final
  
  final _nameController = TextEditingController();
  final _destinationController = TextEditingController();
  final _daysController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose(); // Correctement disposé pour éviter les fuites
    _destinationController.dispose();
    _daysController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar( // Utilisation recommandée
        SnackBar(
          content: Text('Voyage pour ${_nameController.text} enregistré !'),
          backgroundColor: Colors.green,
        ),
      );
      context.pop(); // Navigation déclarative GoRouter
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Planifier un Voyage')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Créez votre projet de séjour',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              CustomInput(
                controller: _nameController,
                label: 'Nom complet',
                hint: 'Entrez votre nom et prénom',
                icon: Icons.person,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Veuillez saisir votre nom';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomInput(
                controller: _destinationController,
                label: 'Destination souhaitée',
                hint: 'Ex: Tokyo, Paris...',
                icon: Icons.flight_takeoff,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Veuillez renseigner une destination';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomInput(
                controller: _daysController,
                label: 'Durée du séjour (jours)',
                hint: 'Ex: 7',
                icon: Icons.date_range,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez indiquer le nombre de jours';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
                child: const Text('Valider mon projet', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
