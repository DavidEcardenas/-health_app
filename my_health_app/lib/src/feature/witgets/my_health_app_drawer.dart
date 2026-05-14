// Importa los widgets de Flutter Material Design
import 'package:flutter/material.dart';

// Importa GoRouter para manejar la navegación
import 'package:go_router/go_router.dart';


// Widget que representa el menú lateral (Drawer)
// de la aplicación.
class MyHealthAppDrawer extends StatelessWidget {

  // Método encargado de construir la interfaz
  @override
  Widget build(BuildContext context) {

    return Drawer(

      // Lista de elementos dentro del Drawer
      child: ListView(

        children: <Widget>[

          // Encabezado superior del Drawer
          DrawerHeader(

            // Contenido del encabezado
            child: Text('My Health App'),

            // Decoración visual
            decoration: BoxDecoration(

              // Color de fondo azul
              color: Colors.blue,
            ),
          ),

          // Opción para navegar al Home
          ListTile(

            // Texto mostrado
            title: Text('Home'),

            // Acción al presionar
            onTap: () {

              // Cierra el Drawer actual
              Navigator.pop(context);

              // Navega a la ruta principal
              context.go('/');
            },
          ),

          // Opción para navegar al BMI Calculator
          ListTile(

            // Texto mostrado
            title: Text('BMI Calculator'),

            // Acción al presionar
            onTap: () {

              // Cierra el Drawer
              Navigator.pop(context);

              // Navega a la pantalla BMI
              context.go('/bmi');
            },
          ),

          // Opción para navegar al Age Calculator
          ListTile(

            // Texto visible
            title: Text('Age Calculator'),

            // Acción del botón
            onTap: () {

              // Cierra el Drawer
              Navigator.pop(context);

              // Navega a la pantalla Age
              context.go('/age');
            },
          ),

          // Opción para navegar al Zodiac Calculator
          ListTile(

            // Texto mostrado
            title: Text('Zodiac Calculator'),

            // Acción al seleccionar
            onTap: () {

              // Cierra el Drawer
              Navigator.pop(context);

              // Navega a la pantalla Zodiac
              context.go('/zodiac');
            },
          ),
        ],
      ),
    );
  }
}