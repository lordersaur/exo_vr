import 'package:exo_vr/modules/landing/submodules/info/ui/info_page.dart';
import 'package:exo_vr/modules/landing/submodules/welcome/ui/welcome_page.dart';
import 'package:exo_vr/ui/provider/global_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LandingPage extends ConsumerWidget {
  LandingPage({super.key});

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(globalProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Container(
        decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.screen,
          gradient: LinearGradient(
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
          ),
        ),
        child: PageView(
          controller: pageController,
          scrollDirection: Axis.horizontal,
          children: [
            WelcomePage(pageController: pageController),
            InfoPage(pageController: pageController),
          ],
        ),
      ),
    );
  }
}
