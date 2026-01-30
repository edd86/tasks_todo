import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tasks_todo/features/authentication/presentation/pages/login_page.dart';
import 'package:tasks_todo/features/home/presentation/pages/home_page.dart';
import 'package:tasks_todo/features/user_management/presentation/pages/new_user_page.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(path: '/login', builder: (context, state) => LoginPage()),
      GoRoute(path: '/', builder: (context, state) => const HomePage()),
      GoRoute(path: '/new_user', builder: (context, state) => NewUserPage()),
    ],
  );
});

/* class AppRouter {
  AppRouter._(); //Evitar instanciar la clase

  //Nombres de las rutas
  static const String login = '/login';
  static const String newUser = '/new_user';
  static const String home = '/';

  //Mapa de rutas
  static Map<String, WidgetBuilder> get routes => {
    home: (context) => HomePage(),
    newUser: (context) => NewUserPage(),
  };

  //Rutas generadas para casos con argumentos
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (context) => LoginPage());
      default:
        return null;
    }
  }

  //Navegación simple con push
  static Future<T?> push<T>(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(context).pushNamed(routeName, arguments: arguments);
  }
} */
