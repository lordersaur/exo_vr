import 'package:exo_vr/modules/home/provider/home_page_provider.dart';
import 'package:exo_vr/modules/planet/ui/widgets/planet_card.dart';
import 'package:exo_vr/ui/widgets/shimmer.dart';
import 'package:exo_vr/ui/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PlanetsListPage extends ConsumerWidget {
  const PlanetsListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final home = ref.watch(homeProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Container(
        decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.overlay,
          gradient: RadialGradient(
            tileMode: TileMode.clamp,
            stops: const [0.1, 1],
            radius: 1,
            colors: [
              Theme.of(context).colorScheme.surface,
              Theme.of(context).colorScheme.primary,
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Space(
                    vertical: 32,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icon/icon.png',
                          height: 200,
                        ),
                      ],
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Let's Explore",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Exoplanets",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Most Popular",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  home.when(
                    data: (data) => SizedBox(
                      height: 300,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(width: 16),
                        scrollDirection: Axis.horizontal,
                        itemCount: data.length,
                        itemBuilder: (context, index) => PlanetCard(
                          planetName: data[index].name,
                          description: data[index].description,
                          assetImage: data[index].assetPath,
                          onTap: () => context.goNamed(
                            'planet',
                            extra: data[index],
                          ),
                        ),
                      ),
                    ),
                    error: (_, __) => const SizedBox.shrink(),
                    loading: () => SizedBox(
                      height: 300,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(width: 16),
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) => const Shimmer(
                          height: 300,
                          width: 200,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
