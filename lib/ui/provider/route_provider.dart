import 'package:exo_vr/modules/home/ui/home_page.dart';
import 'package:exo_vr/modules/landing/ui/landing_page.dart';
import 'package:exo_vr/modules/planet/planets_list_page.dart';
import 'package:exo_vr/modules/planet/submodule/planet_details/ui/planet_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routeProvider = AsyncNotifierProvider<RouteController, GoRouter>(RouteController.new);

class RouteController extends AsyncNotifier<GoRouter> {
  @override
  Future<GoRouter> build() async {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: 'landing',
          builder: (context, state) => LandingPage(),
        ),
        GoRoute(
          path: '/home',
          name: 'home',
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
              path: 'planets',
              name: 'planets',
              builder: (context, state) => const PlanetsListPage(),
            ),
            GoRoute(
              path: 'planet',
              name: 'planet',
              builder: (context, state) => const PlanetPage(),
            ),
          ],
        )
      ],
    );
  }
}
