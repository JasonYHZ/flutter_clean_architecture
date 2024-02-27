import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/app.dart';
import 'package:flutter_clean_architecture/presentation/providers.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthenticateView extends HookConsumerWidget {
  const AuthenticateView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = useState<String>("");
    final password = useState<String>("");
    final logging = useState<bool>(false);
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(title: const Text('Authenticated')),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    validator: (value) =>
                        value != null && value.isNotEmpty ? null : 'required',
                    onSaved: (value) => account.value = value ?? '',
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Account',
                      labelText: 'Please enter Account',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: (value) =>
                        value != null && value.isNotEmpty ? null : 'required',
                    onSaved: (value) => password.value = value ?? '',
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Password',
                      labelText: 'Please enter Password',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: logging.value
                          ? null
                          : () async {
                              try {
                                logging.value = true;
                                if (formKey.currentState?.validate() ?? false) {
                                  formKey.currentState!.save();

                                  final loginStatus = await ref
                                      .read(authenticationCaseNotifierProvider)
                                      .login(account.value, password.value);

                                  if (loginStatus) {
                                    final user = await ref
                                        .read(userUseCaseNotifierProvider)
                                        .loadUser();

                                    if (user != null) {
                                      ref
                                          .read(appStateNotificationProvider
                                              .notifier)
                                          .setUser(user);
                                    }

                                    if (context.mounted) {
                                      Navigator.of(context).pop();
                                    }
                                  }
                                }
                              } finally {
                                logging.value = false;
                              }
                            },
                      icon: const Text('Login'),
                      label: logging.value
                          ? const CircularProgressIndicator()
                          : const SizedBox.shrink(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
