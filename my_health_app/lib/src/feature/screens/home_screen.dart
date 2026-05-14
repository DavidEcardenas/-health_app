// Importa los widgets de Flutter Material Design
import 'package:flutter/material.dart';

// Importa GoRouter para manejar la navegación
import 'package:go_router/go_router.dart';

// Importa el Drawer personalizado de la aplicación
import 'package:my_health_app/src/feature/witgets/my_health_app_drawer.dart';


// Pantalla principal de la aplicación.
// Se usa StatelessWidget porque no necesita manejar estados dinámicos.
class HomeScreen extends StatelessWidget {

  // Método encargado de construir la interfaz gráfica
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      // Drawer lateral de navegación
      drawer: MyHealthAppDrawer(),

      // Barra superior de la aplicación
      appBar: AppBar(

        // Título mostrado en la AppBar
        title: Text('Welcome to My App'),
      ),

      // Contenido principal de la pantalla
      body: Center(

        // Organización vertical de widgets
        child: Column(

          // Centra los elementos verticalmente
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[

            // Botón para navegar a la pantalla de cálculo de edad
            ElevatedButton(

              // Acción al presionar el botón
              onPressed: () => context.push('/age'),

              // Texto mostrado en el botón
              child: Text('Calculate Age'),

              // Estilos personalizados del botón
              style: ElevatedButton.styleFrom(

                // Color de fondo
                backgroundColor: Colors.blue,

                // Color del texto
                foregroundColor: Colors.white,

                // Espaciado interno
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
              ),
            ),

            // Espacio entre botones
            SizedBox(height: 20),

            // Botón para navegar a la pantalla BMI
            ElevatedButton(

              // Navega hacia la ruta BMI
              onPressed: () => context.push('/bmi'),

              // Texto del botón
              child: Text('Calculate BMI'),

              // Estilo personalizado
              style: ElevatedButton.styleFrom(

                // Color de fondo verde
                backgroundColor: Colors.green,

                // Color del texto
                foregroundColor: Colors.white,

                // Padding interno
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
              ),
            ),

            // Espacio entre botones
            SizedBox(height: 20),

            // Botón para navegar a la pantalla zodiacal
            ElevatedButton(

              // Navegación hacia la ruta zodiac
              onPressed: () => context.push('/zodiac'),

              // Texto mostrado
              child: Text('Determine Zodiac Sign'),

              // Estilo del botón
              style: ElevatedButton.styleFrom(

                // Fondo púrpura
                backgroundColor: Colors.purple,

                // Texto blanco
                foregroundColor: Colors.white,

                // Espaciado interno
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}