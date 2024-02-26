import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/index/index.dart';
import 'package:flutter_clean_architecture/presentation/providers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'theme.dart';

part 'app.g.dart';

class AppState {
  final Locale locale;
  final ThemeMode themeMode;
  final CustomTheme themeData;

  const AppState(
      {required this.locale, required this.themeMode, required this.themeData});

  AppState copyWith(
      {Locale? locale, ThemeMode? themeMode, CustomTheme? themeData}) {
    return AppState(
      locale: locale ?? this.locale,
      themeMode: themeMode ?? this.themeMode,
      themeData: themeData ?? this.themeData,
    );
  }
}

class AppRoot extends HookConsumerWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStateNotification = ref.watch(appStateNotificationProvider);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: appStateNotification.locale,
        themeMode: appStateNotification.themeMode,
        theme: appStateNotification.themeData.toThemeData(),
        darkTheme: appStateNotification.themeData.toThemeDataDark(),
        home: const IndexView());
  }
}

@riverpod
class AppStateNotification extends _$AppStateNotification {
  @override
  AppState build() {
    return AppState(
        locale: ref.read(appUseCaseNotifierProvider).loadLocale(),
        themeMode: ref.read(appUseCaseNotifierProvider).loadTheme(),
        themeData: const CustomTheme());
  }

  void setThemeMode(ThemeMode themeMode) async {
    await ref.read(appUseCaseNotifierProvider).saveTheme(themeMode);
    state = state.copyWith(themeMode: themeMode);
  }

  void setLocale(Locale locale) async {
    await ref.read(appUseCaseNotifierProvider).saveLocale(locale);
    state = state.copyWith(locale: locale);
  }
}
