import 'package:exo_vr/modules/home/provider/home_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final homePageProvider = ref.watch(homeProvider);
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
              Theme.of(context).colorScheme.surface,
            ],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: Icon(
                Icons.arrow_back_outlined,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              backgroundColor: Colors.transparent,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.more_horiz_outlined,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              child: homePageProvider.when(
                  data: (data) => ListView.builder(
                      itemBuilder: (context, index) => Card(
                            child: Text(data[index].name,
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
                          ),
                      itemCount: data.length),
                  loading: () => const CircularProgressIndicator(),
                  error: (error, stack) =>
                      Text('Error: $error', style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onError))),
            )
          ],
        ),
      ),
    );
  }
}
