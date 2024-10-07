import 'package:exo_vr/modules/planets/models/planet.dart';
import 'package:exo_vr/ui/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class PlanetPage extends ConsumerWidget {
  const PlanetPage({super.key, required this.planet});
  final Planet planet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        child: DefaultTabController(
          length: 3,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_outlined,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  onPressed: () async {
                    context.pop();
                  },
                ),
                backgroundColor: Colors.transparent,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.more_horiz_outlined,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SliverFillRemaining(
                  child: PageView(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 250,
                        width: 250,
                        child: ModelViewer(
                          src: planet.modelPath,
                          alt: 'A 3D model of ${planet.name}',
                          arScale: ArScale.auto,
                          ar: true,
                          autoRotate: true,
                          cameraControls: true,
                          disableZoom: true,
                        ),
                      ),
                      Space(
                        horizontal: 16,
                        child: Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: planet.name,
                                style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                                children: [
                                  TextSpan(
                                    text: "\n",
                                    style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Space(
                        horizontal: 16,
                        child: Divider(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                      Space(
                        horizontal: 16,
                        child: Text(
                          planet.description,
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                        ),
                      ),
                      Space(
                        horizontal: 16,
                        child: Divider(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      )
                    ],
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
