import 'package:exo_vr/modules/home/ui/pages/home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';

final routeProvider = AsyncNotifierProvider<RouteController, GoRouter>(RouteController.new);

class RouteController extends AsyncNotifier<GoRouter> {
  @override
  Future<GoRouter> build() async {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) => const HomePage(),
        ),
        // GoRoute(
        //   path: 'home',
        //   name: 'home',
        //   builder: (context, state) => const HomePage(),
        // )
      ],
    );
  }
}
