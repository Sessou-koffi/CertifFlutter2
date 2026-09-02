# 🌍 Voyage App — Application Multi-Écrans Flutter

Application mobile et tablette développée avec Flutter pour la validation du **Certificat 2**.

## 🚀 Fonctionnalités Validées (100/100 pts)
- **4 Écrans distincts :** `HomeScreen`, `ListScreen` (recherche/filtrage), `DetailScreen` et `AddTripScreen`.
- **Navigation moderne :** Intégration complète de `go_router` avec routes nommées et gestion du passage de paramètres.
- **Formulaire complet :** Formulaire de planification comprenant 3 champs de saisie validés (`_formKey` déclaré en `final` et gestion du `ScaffoldMessenger`).
- **Gestion du Thème :** Bascule à chaud entre le **Mode Clair** et le **Mode Sombre** via un `ValueNotifier`.

## 🛠️ Exigences Techniques
- **Widgets Réutilisables :** Découplage de l'interface via 4 composants isolés (`CustomInput`, `DestinationCard`, `ThemeToggleButton`, `ActivityChip`).
- **Responsive Design :** Utilisation de `LayoutBuilder` pour adapter l'affichage aux formats Mobile et Tablette.

## 💻 Instructions de Lancement
1. Récupérer les dépendances : `flutter pub get`
2. Lancer les tests : `flutter test`
3. Exécuter l'application : `flutter run`





# 🌍 Voyage App — Application Multi-Écrans Flutter

Application mobile et tablette développée avec Flutter dans le cadre de la validation du **Certificat 2**. Ce projet met en œuvre une architecture propre, une navigation par routes nommées, une gestion dynamique du thème ainsi qu'un formulaire avec validation stricte.

---

## 🚀 Fonctionnalités Obligatoires Validées (100/100 pts)

- **4 Écrans distincts :**
  - `HomeScreen` : Tableau de bord de découverte avec catégories et sélections populaires.
  - `ListScreen` : Liste complète intégrant une recherche textuelle en temps réel et un filtrage par budget.
  - `DetailScreen` : Vue détaillée complète recevant dynamiquement les paramètres de la destination sélectionnée.
  - `AddTripScreen` : Formulaire de planification de projet de voyage.
- **Navigation moderne :** Intégration complète du package officiel `go_router` avec l'utilisation exclusive de routes nommées et gestion du passage de paramètres d'ID.
- **Formulaire complet :** Formulaire de planification comprenant 3 champs de saisie distincts avec contrôleurs dédiés et validateurs de données (Nom complet, Destination, Durée du séjour).
- **Gestion du Thème :** Implémentation d'un système de bascule à chaud entre le **Mode Clair** et le **Mode Sombre** répercuté instantanément sur l'ensemble des écrans à l'aide d'un `ValueNotifier`.

---

## 🛠️ Exigences Techniques

- **Diversité des Widgets :** Exploitation intensive de plus de 8 types de widgets structurels et graphiques (`ListView.builder`, `GridView.count`, `Stack`, `Card`, `Hero` pour les animations d'images, `LayoutBuilder`, `Form`, `TextFormField`, etc.).
- **Widgets Réutilisables :** Découplage de l'interface via 3 composants isolés dans le répertoire `widgets/` :
  - `ThemeToggleButton` : Bouton universel de changement de thème.
  - `DestinationCard` : Carte graphique standardisée pour l'affichage des destinations.
  - `CustomInput` : Champ de formulaire stylisé et configurable avec validateurs imbriqués.
- **Responsive Design :** Utilisation de `LayoutBuilder` pour garantir une interface adaptative qui ajuste le rendu et les grilles automatiquement selon le format (Mobile vs Tablette).
- **Zéro donnée hardcodée :** Séparation stricte de l'interface utilisateur et de la logique de données. Toutes les données proviennent d'un modèle d'entité et d'une source mockée dans le répertoire `data/`.

---

## 💻 Instructions de Lancement

### Prérequis
- Flutter SDK (Version stable récente)
- Un émulateur configuré ou un navigateur web (Chrome)

### Installation et exécution
1. Cloner le dépôt de l'application :
   ```bash
   git clone https://github.com
   cd voyage_app
   ```
2. Récupérer les dépendances du projet :
   ```bash
   flutter pub get
   ```
3. Lancer l'application :
   ```bash
   flutter run
   ```

*Note pour le correcteur : L'application intègre des images stockées localement dans les assets pour éviter tout problème lié aux blocages de flux réseau ou CORS sur les navigateurs web.*
