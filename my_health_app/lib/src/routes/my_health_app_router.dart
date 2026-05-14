// Importa GoRouter para manejar las rutas de navegación
import 'package:go_router/go_router.dart';

// Importa las diferentes pantallas de la aplicación
import 'package:my_health_app/src/feature/screens/age_screen.dart';
import 'package:my_health_app/src/feature/screens/bmi_screen.dart';
import 'package:my_health_app/src/feature/screens/home_screen.dart';
import 'package:my_health_app/src/feature/screens/zodiac_screen.dart';

// Clase encargada de centralizar la configuración
// de rutas de la aplicación.
class MyHealthAppRouter {
  // Instancia estática de GoRouter
  static GoRouter router = GoRouter(
    // Lista de rutas disponibles
    routes: [
      // Ruta principal "/"
      GoRoute(
        // Dirección de la ruta
        path: '/',

        // Widget que se mostrará
        builder: (context, state) => HomeScreen(),
      ),

      // Ruta para la calculadora BMI
      GoRoute(
        // Dirección de navegación
        path: '/bmi',

        // Pantalla asociada
        builder: (context, state) => BmiScreen(),
      ),

      // Ruta para la calculadora de edad
      GoRoute(
        // Path de navegación
        path: '/age',

        // Pantalla mostrada
        builder: (context, state) => AgeScreen(),
      ),

      // Ruta para la calculadora zodiacal
      GoRoute(
        // Dirección de la ruta
        path: '/zodiac',

        // Pantalla asociada
        builder: (context, state) => ZodiacScreen(),
      ),
    ],
  );
}
