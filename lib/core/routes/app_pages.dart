import 'package:go_router/go_router.dart';
import '../../features/main/views/main_page.dart';
import 'app_routes.dart';

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
