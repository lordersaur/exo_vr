import 'package:exo_vr/ui/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PlanetPage extends ConsumerWidget {
  const PlanetPage({super.key});

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
                    context.goNamed('planets');
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
                  Container(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/moon.png',
                          height: 250,
                        ),
                        Space(
                          horizontal: 16,
                          child: Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Moon',
                                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                                  children: [
                                    TextSpan(
                                      text: "\nEarth's little brother",
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
                            'Cillum ad quis aliquip qui irure fugiat qui ullamco eiusmod elit ullamco aliqua elit. Dolore consequat eiusmod esse exercitation. Officia incididunt commodo ullamco nostrud commodo nostrud qui labore ullamco officia adipisicing id.',
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
                    ),
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
