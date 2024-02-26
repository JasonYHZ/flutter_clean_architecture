import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'model.dart';

class ActivityView extends StatefulHookConsumerWidget {
  const ActivityView({super.key});

  @override
  ConsumerState<ActivityView> createState() => _ActivityViewState();
}

class _ActivityViewState extends ConsumerState<ActivityView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(activityPageNotifierProvider.notifier).fetchActivity();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(activityPageNotifierProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Activity'),
        ),
        body: Center(
          child: Builder(builder: (context) {
            switch (provider.status) {
              case ActivityPageStatus.initial:
              case ActivityPageStatus.loading:
                return const CircularProgressIndicator();
              case ActivityPageStatus.success:
                return Text(provider.activity!.activity);
              default:
                return const Text('error');
            }
          }),
        ));
  }
}
