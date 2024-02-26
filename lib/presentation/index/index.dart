import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/utils/extension.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app.dart';


class IndexView extends HookConsumerWidget {
  const IndexView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStateNotification = ref.watch(appStateNotificationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(' Clean Architecture'),
        actions: [
          PopupMenuButton<ThemeMode>(
            offset: const Offset(0, 20),
            onSelected: (value) => ref
                .read(appStateNotificationProvider.notifier)
                .setThemeMode(value),
            child: Builder(builder: (_) {
              switch (appStateNotification.themeMode) {
                case ThemeMode.system:
                  return const Icon(Icons.brightness_auto);
                case ThemeMode.light:
                  return const Icon(Icons.brightness_high_rounded);
                case ThemeMode.dark:
                  return const Icon(Icons.brightness_2_rounded);
              }
            }),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: ThemeMode.system,
                child: Text(context.loc.autoMode),
              ),
              PopupMenuItem(
                value: ThemeMode.light,
                child: Text(context.loc.lightMode),
              ),
              PopupMenuItem(
                value: ThemeMode.dark,
                child: Text(context.loc.darkMode),
              ),
            ],
          ),
          const SizedBox(width: 10),
          PopupMenuButton<Locale>(
            offset: const Offset(0, 20),
            onSelected: (value) => ref
                .read(appStateNotificationProvider.notifier)
                .setLocale(value),
            child: Builder(builder: (_) {
              switch (appStateNotification.locale.languageCode) {
                case 'zh':
                  return const Text('简体中文');
                case 'en':
                default:
                  return const Text('English');
              }
            }),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: Locale('en', 'US'),
                child: Text('English'),
              ),
              const PopupMenuItem(
                value: Locale('zh', 'CN'),
                child: Text('简体中文'),
              ),
            ],
          ),
        ],
      ),
      body: Center(
          child: Text(
            context.loc.helloWorld,
            style: Theme.of(context).textTheme.headlineLarge,
          )),
    );
  }
}
