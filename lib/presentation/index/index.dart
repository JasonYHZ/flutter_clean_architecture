import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/providers.dart';
import 'package:flutter_clean_architecture/presentation/utils/extension.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app.dart';
import '../authenticate/index.dart';

class IndexView extends HookConsumerWidget {
  const IndexView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStateNotification = ref.watch(appStateNotificationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Clean Architecture'),
        leadingWidth: 38,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Ink(
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              onTap: appStateNotification.value?.user == null
                  ? () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const AuthenticateView();
                          },
                        ),
                      );
                    }
                  : null,
              customBorder: const CircleBorder(),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 15,
                backgroundImage: appStateNotification.value!.user == null
                    ? null
                    : CachedNetworkImageProvider(
                        appStateNotification.value!.user!.avatar),
                child: appStateNotification.value!.user == null
                    ? const Icon(
                        Icons.person,
                        color: Colors.white,
                      )
                    : null,
              ),
            ),
          ),
        ),
        actions: [
          PopupMenuButton<ThemeMode>(
            offset: const Offset(0, 20),
            onSelected: (value) => ref
                .read(appStateNotificationProvider.notifier)
                .setThemeMode(value),
            child: Builder(builder: (_) {
              switch (appStateNotification.value!.themeMode) {
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
              switch (appStateNotification.value!.locale.languageCode) {
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
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (appStateNotification.value!.user != null)
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blue,
              backgroundImage: CachedNetworkImageProvider(
                  appStateNotification.value!.user!.avatar),
            ),
          Center(
            child: Text(
              context.loc.helloWorld,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          if (appStateNotification.value!.user != null)
            FilledButton(
                onPressed: () async {
                  ref.read(userUseCaseNotifierProvider).deleteUser();
                  ref.watch(appStateNotificationProvider.notifier).setUser(null);
                },
                child: const Text('Logout'))
        ],
      ),
    );
  }
}
