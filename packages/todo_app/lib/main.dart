import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/navigation/navigationService.dart';
import 'views/homeScreen.dart';
import 'views/addTodoScreen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // Set up go_router with the navigatorKey from NavigationService.
  final GoRouter _router = GoRouter(
    navigatorKey: NavigationService.instance.navigatorKey,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/add',
        builder: (context, state) => const AddTodoScreen(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Todo App',
      routerConfig: _router,
    );
  }
}
