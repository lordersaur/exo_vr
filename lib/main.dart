import 'package:exo_vr/ui/provider/route_provider.dart';
import 'package:exo_vr/ui/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routeProvider);
    final theme = ref.watch(themeProvider);

    if (!router.hasValue) {
      return const CircularProgressIndicator();
    }

    return MaterialApp.router(
      title: 'Terere Lab',
      theme: theme.value,
      routerConfig: router.value,
    );
  }
}
