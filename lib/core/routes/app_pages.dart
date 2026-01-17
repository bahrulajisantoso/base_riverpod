import 'package:go_router/go_router.dart';
import 'app_routes.dart';
import '../../features/main/views/main_page.dart';

class AppPages {
  static final GoRouter routes = GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(
        name: AppRoutes.home,
        path: AppRoutes.home,
        builder: (_, __) => const MainPage(),
      ),
    ],
  );
}
