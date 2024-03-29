import 'package:flutter/material.dart';

class NestedNavigationFlowView extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NestedNavigationFlowView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nested navigation flow'),
      ),
      body: Navigator(
        key: _navigatorKey,
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }

  Route _onGenerateRoute(RouteSettings settings) {
    print(settings.name);
    late Widget page;
    switch (settings.name) {
      case '/':
        page = _FirstView();
        break;
      case '/Next':
        page = _NextView();
        break;
    }
    return MaterialPageRoute(builder: (_) => page, settings: settings);
  }
}

class _FirstView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: const Text('First View'),
        onPressed: () => Navigator.pushNamed(context, '/Next'),
      ),
    );
  }
}

class _NextView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('This is next page'),
      ),
    );
  }
}
