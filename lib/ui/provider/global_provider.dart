import 'package:exo_vr/ui/provider/route_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final globalProvider = AsyncNotifierProvider<GlobalController, GlobalState>(GlobalController.new);

class GlobalController extends AsyncNotifier<GlobalState> {
  @override
  Future<GlobalState> build() async {
    final prefs = await SharedPreferences.getInstance();
    final route = await ref.watch(routeProvider.future);
    final firstRun = prefs.getBool('firstRun');
    if (firstRun ?? false) {
      route.goNamed('planets');
    }
    return GlobalState(
      firstRun: firstRun,
    );
  }

  void setFirstRun(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('firstRun', true);
    state = AsyncValue.data(state.value!.setFirstRun(value));
  }
}

class GlobalState {
  bool? firstRun;
  GlobalState({this.firstRun});

  GlobalState setFirstRun(bool newFirstRun) {
    firstRun = newFirstRun;
    return this;
  }
}
