import 'package:flutter/material.dart';
import '../widgets/custom_input.dart';

class AddTripScreen extends StatefulWidget {
  const AddTripScreen({super.key});

  @override
  State<AddTripScreen> createState() => _AddTripScreenState();
}

class _AddTripScreenState extends State<AddTripScreen> {
  // Clé globale pour identifier et valider le formulaire
  final _formKey = GlobalKey<FormState>();
  
  // Contrôleurs pour récupérer le texte des formulaires
  final _nameController = TextEditingController();
  final _destinationController = TextEditingController();
  final _daysController = TextEditingController();

  @override
  void dispose() {
    // Libération des contrôleurs pour éviter les fuites de mémoire
    _nameController.dispose();
    _destinationController.dispose();
    _daysController.dispose();
    super.dispose();
  }

  void _submitForm() {
    // Déclenche la validation de tous les champs du formulaire
    if (_formKey.currentState!.validate()) {
      // Si le formulaire est valide, on affiche un message de succès
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Voyage pour ${_nameController.text} enregistré avec succès !'),
          backgroundColor: Colors.green,
        ),
      );
      // Retour à l'écran précédent après enregistrement
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planifier un Voyage'),
      ),
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

              // Champ 1 : Nom du voyageur (Utilise notre widget réutilisable)
              CustomInput(
                controller: _nameController,
                label: 'Nom complet',
                hint: 'Entrez votre nom et prénom',
                icon: Icons.person,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Veuillez saisir votre nom';
                  }
                  if (value.trim().length < 3) {
                    return 'Le nom doit contenir au moins 3 caractères';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Champ 2 : Destination (Utilise notre widget réutilisable)
              CustomInput(
                controller: _destinationController,
                label: 'Destination souhaitée',
                hint: 'Ex: Tokyo, Paris, Islande...',
                icon: Icons.flight_takeoff,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Veuillez renseigner une destination';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Champ 3 : Nombre de jours (Utilise notre widget réutilisable)
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
                  final days = int.tryParse(value);
                  if (days == null || days <= 0) {
                    return 'Veuillez entrer un nombre supérieur à 0';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),

              // Bouton de soumission du formulaire
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Valider mon projet',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
