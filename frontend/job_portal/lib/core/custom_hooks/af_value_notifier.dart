import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

ValueNotifier<T> useAfValueNotifier<T>(T initialData) {
  return use(_StateHook(initialData: initialData));
}

class _StateHook<T> extends Hook<ValueNotifier<T>> {
  const _StateHook({required this.initialData});

  final T initialData;

  @override
  _StateHookState<T> createState() => _StateHookState();
}

class _StateHookState<T> extends HookState<ValueNotifier<T>, _StateHook<T>> {
  late final _state = ValueNotifier<T>(hook.initialData);
  // ..addListener(_listener);

  @override
  void dispose() {
    _state.dispose();
  }

  @override
  ValueNotifier<T> build(BuildContext context) => _state;

  // void _listener() {
  //   setState(() {});
  // }

  @override
  Object? get debugValue => _state.value;

  @override
  String get debugLabel => 'useAfValueNotifier<$T>';
}
