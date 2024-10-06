import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Container(
        decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.overlay,
          gradient: RadialGradient(
            tileMode: TileMode.clamp,
            stops: [0.1, 1],
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
                backgroundColor: Colors.transparent,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/icon/icon.png',
                      height: 50,
                    )
                  ],
                ),
              ),
              SliverFillRemaining(
                  child: PageView(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(64.0),
                            child: Image.asset('assets/images/moon.png'),
                          ),
                        ),
                        Text(
                          'Moon',
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Theme.of(context).colorScheme.secondary),
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
