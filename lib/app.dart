import 'package:base_riverpod/core/routes/app_pages.dart';
import 'package:base_riverpod/core/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends HookConsumerWidget {
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
