import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'presentation/app.dart';
import 'presentation/providers.dart';

late SharedPreferences sharedPref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  Animate.restartOnHotReload = true;

  runApp(const ProviderScope(child: _EagerInitialization(child: AppRoot())));
}

class _EagerInitialization extends HookConsumerWidget {
  const _EagerInitialization({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(appStateNotificationProvider);
    return child;
  }
}
