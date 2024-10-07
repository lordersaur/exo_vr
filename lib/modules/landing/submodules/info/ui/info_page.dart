import 'package:exo_vr/ui/provider/route_provider.dart';
import 'package:exo_vr/ui/widgets/filled_button.dart';
import 'package:exo_vr/ui/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class InfoPage extends ConsumerStatefulWidget {
  const InfoPage({super.key, required this.pageController});

  final PageController pageController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => InfoPageState();
}

class InfoPageState extends ConsumerState<InfoPage> with SingleTickerProviderStateMixin {
  // late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    // animationController = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    'assets/images/moon.png',
                    height: 250,
                  ).animate().fadeIn(duration: 1.seconds),
                ],
              ),
              Space(
                horizontal: 16,
                top: 32,
                bottom: 0,
                child: Text(
                  'Explore the solar system!',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onPrimary),
                ).animate().then(delay: 1.seconds).fadeIn(duration: 1.seconds),
              ),
              Space(
                bottom: 0,
                horizontal: 16,
                child: Text(
                  'With 360 degree angle view',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onPrimary),
                ).animate().then(delay: 1.seconds).fadeIn(duration: 1.seconds),
              )
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
                  text: 'Start journey!',
                  onTap: () async {
                    context.goNamed('planets');
                  },
                ).animate().then(delay: 2.seconds).fadeIn(duration: 1.seconds),
              ),
            ],
          ),
        )
      ],
    );
  }
}
