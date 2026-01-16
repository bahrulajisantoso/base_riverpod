import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final featureName = context.vars['feature_name'] as String;
  final camelCase = featureName.camelCase;
  final pascalCase = featureName.pascalCase;
  final snakeCase = featureName.snakeCase;
  final paramCase = featureName.paramCase;

  final logger = context.logger;

  logger.info('✓ Feature files created successfully!');
  logger.info('');

  // Update app_routes.dart
  final routesFile = File('lib/core/routes/app_routes.dart');
  if (await routesFile.exists()) {
    var content = await routesFile.readAsString();

    // Add route constant
    final routeConstant = "  static const String $camelCase = '/$paramCase';";

    if (!content.contains(routeConstant)) {
      // Find the position to insert (before the closing brace)
      if (content.contains(RegExp(r'class\s+AppRoutes\s*\{\s*\}'))) {
        // Empty class
        content = content.replaceFirst(
          RegExp(r'(class\s+AppRoutes\s*\{)\s*\}'),
          '\$1\n$routeConstant\n}',
        );
      } else {
        // Has existing routes
        content = content.replaceFirst(RegExp(r'}[\s]*$'), '$routeConstant\n}');
      }
      await routesFile.writeAsString(content);
      logger.success('✓ Added route to app_routes.dart');
    }
  }

  // Update app_pages.dart
  final pagesFile = File('lib/core/routes/app_pages.dart');
  if (await pagesFile.exists()) {
    var content = await pagesFile.readAsString();

    // Add import with relative path
    final importStatement =
        "import '../../features/$snakeCase/views/${snakeCase}_page.dart';";

    if (!content.contains(importStatement)) {
      // Add import after existing imports
      final lastImport = content.lastIndexOf("import ");
      final endOfLastImport = content.indexOf(';', lastImport) + 1;
      content =
          content.substring(0, endOfLastImport) +
          '\n$importStatement' +
          content.substring(endOfLastImport);
    }

    // Add route
    final routeCode =
        '''      GoRoute(
        name: AppRoutes.$camelCase,
        path: AppRoutes.$camelCase,
        builder: (_, __) => const ${pascalCase}Page(),
      ),''';

    if (!content.contains('AppRoutes.$camelCase')) {
      // Find the routes array and add before the closing bracket
      final routesMatch = RegExp(
        r'routes:\s*\[([\s\S]*?)\s*\]',
      ).firstMatch(content);
      if (routesMatch != null) {
        final routesContent = routesMatch.group(1)!;
        // Check if routesContent is empty or only whitespace
        final isEmpty = routesContent.trim().isEmpty;
        final newRoutesContent = isEmpty
            ? '\n$routeCode\n    '
            : routesContent.trimRight() + '\n$routeCode\n    ';
        content = content.replaceFirst(
          RegExp(r'routes:\s*\[[\s\S]*?\]'),
          'routes: [$newRoutesContent]',
        );
        await pagesFile.writeAsString(content);
        logger.success('✓ Added route to app_pages.dart');
      }
    }
  }

  logger.info('');
  logger.info('Next steps:');
  logger.info(
    '1. Run: flutter pub run build_runner build --delete-conflicting-outputs',
  );
  logger.info('2. Navigate to /$paramCase in your app');
  logger.info('');
}
