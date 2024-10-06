import 'package:exo_vr/ui/widgets/filled_button.dart';
import 'package:exo_vr/ui/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WelcomePage extends ConsumerStatefulWidget {
  const WelcomePage({super.key, required this.pageController});

  final PageController pageController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WelcomePageState();
}

class _WelcomePageState extends ConsumerState<WelcomePage> with SingleTickerProviderStateMixin {
  // late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    // animationController = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/icon/icon.png',
                      height: 300,
                    ).animate().fadeIn(duration: 1.seconds),
                  ],
                ),
                Space(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Explore the galaxies!',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onPrimary),
                      ).animate().then(delay: 1.seconds).fadeIn(duration: 1.seconds)
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Space(
                  horizontal: 16,
                  child: CustomFilledButton(
                    textAlign: TextAlign.center,
                    text: 'See more',
                    onTap: () async {
                      // animationController.forward();
                      widget.pageController.nextPage(duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
                    },
                  ).animate().then(delay: 2.seconds).fadeIn(duration: 1.seconds).then(delay: 1.seconds).shake(duration: .5.seconds),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
