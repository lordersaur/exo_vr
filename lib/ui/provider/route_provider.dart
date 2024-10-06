import 'package:exo_vr/modules/home/ui/home_page.dart';
import 'package:exo_vr/modules/landing/ui/landing_page.dart';
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
        )
      ],
    );
  }
}
