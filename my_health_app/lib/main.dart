// Importa los widgets principales de Flutter
import 'package:flutter/material.dart';

// Importa la configuración de rutas de la aplicación
import 'package:my_health_app/src/routes/my_health_app_router.dart';

// Función principal de la aplicación.
// Es el punto de entrada donde inicia Flutter.
void main() {
  // Ejecuta la aplicación principal
  runApp(MainApp());
}

// Widget principal de la aplicación.
// Se utiliza StatelessWidget porque no maneja estados dinámicos.
class MainApp extends StatelessWidget {
  // Constructor del widget principal
  MainApp({super.key});

  // Método encargado de construir la aplicación
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // Configuración del sistema de rutas
      routerConfig: MyHealthAppRouter.router,
    );
  }
}
