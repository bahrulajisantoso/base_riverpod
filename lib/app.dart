import 'package:expense/core/routes/app_pages.dart';
import 'package:expense/core/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: appTheme(context),
      routerConfig: AppPages.routes,
    );
  }
}
