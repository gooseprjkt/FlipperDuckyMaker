import 'package:flutter/material.dart';
import 'package:flutter_ducky_app/l10n/l10n.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');
  
  Locale get locale => _locale;

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }

  void toggleLocale() {
    if (_locale == const Locale('en')) {
      _locale = const Locale('ru');
    } else {
      _locale = const Locale('en');
    }
    notifyListeners();
  }
}

class LocaleProviderWidget extends StatefulWidget {
  final Widget child;

  const LocaleProviderWidget({super.key, required this.child});

  @override
  State<LocaleProviderWidget> createState() => _LocaleProviderWidgetState();
}

class _LocaleProviderWidgetState extends State<LocaleProviderWidget> {
  final LocaleProvider _localeProvider = LocaleProvider();

  @override
  Widget build(BuildContext context) {
    return ListenableProvider<LocaleProvider>(
      create: (_) => _localeProvider,
      child: widget.child,
    );
  }
}

class ListenableProvider<T extends Listenable> extends StatefulWidget {
  final Widget child;
  final T Function(BuildContext context) create;

  const ListenableProvider({
    super.key,
    required this.create,
    required this.child,
  });

  @override
  State<ListenableProvider<T>> createState() => _ListenableProviderState<T>();

  static T? of<T extends Listenable>(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<_InheritedProvider<T>>();
    return widget?.value;
  }
}

class _ListenableProviderState<T extends Listenable> extends State<ListenableProvider<T>> {
  late T _value;

  @override
  void initState() {
    super.initState();
    _value = widget.create(context);
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedProvider<T>(
      value: _value,
      child: widget.child,
    );
  }
}

class _InheritedProvider<T> extends InheritedWidget {
  final T value;

  const _InheritedProvider({
    super.key,
    required this.value,
    required super.child,
  });

  @override
  bool updateShouldNotify(_InheritedProvider<T> oldWidget) {
    return value != oldWidget.value;
  }
}