import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks_todo/core/routes/app_router.dart';
import 'package:tasks_todo/core/theme/app_theme.dart';
import 'package:tasks_todo/features/authentication/presentation/providers/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final appRouter = ref.watch(appRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: appRouter,
      /* //home: LoginPage(),

      //Rutas definidas en AppRouter
      routes: AppRouter.routes,
      //Ruta inicial
      initialRoute: AppRouter.login,
      //Generar rutas
      onGenerateRoute: AppRouter.onGenerateRoute, */
    );
  }
}
