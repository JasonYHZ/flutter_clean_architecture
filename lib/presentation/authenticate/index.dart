import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/authenticate/model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthenticateView extends HookConsumerWidget {
  const AuthenticateView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = useState<String>("");
    final password = useState<String>("");
    final formKey = GlobalKey<FormState>();
    final model = ref.watch(authenticateViewModelProvider);

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
                      onPressed: model.logging
                          ? null
                          : () async {
                              if (formKey.currentState?.validate() ?? false) {
                                formKey.currentState!.save();

                                await ref
                                    .read(
                                        authenticateViewModelProvider.notifier)
                                    .signInWithEmailAndPassword(
                                        account.value, password.value);

                                if (context.mounted) {
                                  Navigator.of(context).pop();
                                }
                              }
                            },
                      icon: const Text('Login'),
                      label: model.logging
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
