# My Health App

Aplicación desarrollada con Flutter que utiliza navegación mediante `go_router` para gestionar diferentes pantallas relacionadas con salud y utilidades.

---

# Características

* Navegación entre pantallas con `go_router`
* Pantalla principal (`HomeScreen`)
* Pantalla de cálculo de BMI (`BmiScreen`)
* Pantalla de edad (`AgeScreen`)
* Pantalla de signo zodiacal (`ZodiacScreen`)
* Arquitectura organizada por features

---

# Tecnologías utilizadas

* Flutter
* Dart
* go_router

---

# Estructura del proyecto

```bash
lib/
└── src/
    └── feature/
        └── screens/
            ├── age_screen.dart
            ├── bmi_screen.dart
            ├── home_screen.dart
            └── zodiac_screen.dart
```

---

# Configuración de rutas

La aplicación utiliza `GoRouter` para manejar la navegación.

```dart
class MyHealthAppRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: '/bmi',
        builder: (context, state) => BmiScreen(),
      ),
      GoRoute(
        path: '/age',
        builder: (context, state) => AgeScreen(),
      ),
      GoRoute(
        path: '/zodiac',
        builder: (context, state) => ZodiacScreen(),
      ),
    ],
  );
}
```


---

# Dependencias principales

Agregar en el archivo `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  go_router: ^14.0.0
```

---

# Pantallas disponibles

| Ruta      | Pantalla     |
| --------- | ------------ |
| `/`       | HomeScreen   |
| `/bmi`    | BmiScreen    |
| `/age`    | AgeScreen    |
| `/zodiac` | ZodiacScreen |

---

# Ejemplo de navegación

```dart
Navigator.pushNamed(context, '/bmi');
```

---

# Aprendizajes

Proyecto desarrollado como práctica de Flutter y navegación con GoRouter.
