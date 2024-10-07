import 'package:exo_vr/modules/planet/ui/widgets/planet_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PlanetsListPage extends ConsumerWidget {
  const PlanetsListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
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
                      "The milky way galaxy",
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
                // Icon(Icons.arrow_forward, color: Colors.white),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  PlanetCard(
                    color: Colors.orange,
                    planetName: "Earth",
                    description: "The minor planet",
                    assetImage: 'assets/images/earth.png',
                    onTap: () async {
                      context.goNamed('planet');
                    },
                  ),
                  const SizedBox(width: 20),
                  PlanetCard(
                    color: Colors.red,
                    planetName: "Mars",
                    description: "The red planet",
                    assetImage: 'assets/images/mars.png',
                    onTap: () async {
                      context.goNamed('planet');
                    },
                  ),
                  const SizedBox(width: 20),
                  PlanetCard(
                    color: Colors.blue,
                    planetName: "Moon",
                    description: "Farthest from the sun",
                    assetImage: 'assets/images/moon.png',
                    onTap: () async {
                      context.goNamed('planet');
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // const Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       "You may also like",
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 18,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //     Icon(Icons.arrow_forward, color: Colors.white),
            //   ],
            // ),
            // const SizedBox(height: 16),
            // Expanded(
            //   child: GridView.count(
            //     crossAxisCount: 2,
            //     crossAxisSpacing: 16,
            //     mainAxisSpacing: 16,
            //     children: [
            //       PlanetCard(
            //         color: Colors.green,
            //         planetName: "Moon",
            //         description: "The icy planet",
            //         assetImage: 'assets/images/moon.png',
            //         onTap: () async {
            //           context.goNamed('planet');
            //         },
            //       ),
            //       PlanetCard(
            //         color: Colors.brown,
            //         planetName: "Venus",
            //         description: "Hot & bright",
            //         assetImage: 'assets/images/mars.png',
            //         onTap: () async {
            //           context.goNamed('planet');
            //         },
            //       ),
            //       PlanetCard(
            //         color: Colors.orange,
            //         planetName: "Jupiter",
            //         description: "The gas giant",
            //         assetImage: 'assets/images/earth.png',
            //         onTap: () async {
            //           context.goNamed('planet');
            //         },
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
