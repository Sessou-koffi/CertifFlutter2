import 'package:go_router/go_router.dart';
import '../views/home_screen.dart';
import '../views/list_screen.dart';
import '../views/detail_screen.dart';
import '../views/add_trip_screen.dart';

class AppRouter {
  static const String home = '/';
  static const String list = '/destinations';
  static const String detail = '/detail';
  static const String addTrip = '/add-trip';

  static final GoRouter router = GoRouter(
    initialLocation: home,
    routes: [
      GoRoute(
        path: home,
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: list,
        name: 'list',
        builder: (context, state) => const ListScreen(),
      ),
      GoRoute(
        path: '$detail/:id',
        name: 'detail',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return DetailScreen(destinationId: id);
        },
      ),
      GoRoute(
        path: addTrip,
        name: 'addTrip',
        builder: (context, state) => const AddTripScreen(),
      ),
    ],
  );
}
