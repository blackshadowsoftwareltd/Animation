import 'dart:async' show Future;
import 'dart:math' show Random;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show
        AutoDisposeFamilyNotifier,
        AutoDisposeNotifierProviderFamily,
        Consumer,
        ProviderScope;

void main() {
  runApp(ProviderScope(
      child: MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      useMaterial3: true,
    ),
    home: const HomePage(),
  )));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Theme Test')),
      body: Center(
        child: Consumer(builder: (context, ref, __) {
          final state = ref.watch(buttonStateProvider('button1'));
          final notifier = ref.watch(buttonStateProvider('button1').notifier);
          return AnimatedContainer(
            duration: duration200,
            width: state == ButtonState.pressed || state == ButtonState.loading
                ? 40
                : 100,
            height: 40,
            child: TextButton(
              onPressed: () async {
                if (state == ButtonState.enable) {
                  notifier.setLoading();
                  if (await notifier.toDo()) {
                    notifier.setSuccess();
                  } else {
                    notifier.setFailed();
                  }
                  return;
                }
              },
              style: TextButton.styleFrom(
                  backgroundColor: Colors.blueGrey.shade800),
              child: FittedBox(
                  child: state == ButtonState.pressed ||
                          state == ButtonState.loading
                      ? const SizedBox(
                          width: 40,
                          height: 40,
                          child: CircularProgressIndicator(color: Colors.white))
                      : Text(
                          state.name,
                          style: const TextStyle(color: Colors.white),
                        )),
            ),
          );
        }),
      ),
    );
  }
}

final buttonStateProvider = AutoDisposeNotifierProviderFamily<
    _ButtonStateProvider, ButtonState, String>(_ButtonStateProvider.new);

class _ButtonStateProvider
    extends AutoDisposeFamilyNotifier<ButtonState, String> {
  @override
  ButtonState build(String arg) => ButtonState.enable;
  void setEnable() => state = ButtonState.enable;
  Future<void> setLoading() async {
    state = ButtonState.pressed;
    await Future.delayed(duration200);
    state = ButtonState.loading;
  }

  Future<void> setFailed() async {
    state = ButtonState.failed;
    await Future.delayed(duration2);
    state = ButtonState.enable;
  }

  Future<void> setSuccess() async {
    state = ButtonState.success;
    await Future.delayed(duration2);
    state = ButtonState.enable;
  }

  Future<bool> toDo() async {
    await Future.delayed(duration2);
    return Random().nextBool();
  }
}

const duration200 = Duration(milliseconds: 200);
const duration2 = Duration(seconds: 2);

enum ButtonState { enable, pressed, loading, success, failed }
