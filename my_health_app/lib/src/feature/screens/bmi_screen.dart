// Importa los widgets de Flutter Material Design
import 'package:flutter/material.dart';

// Importa el Drawer personalizado de la aplicación
import 'package:my_health_app/src/feature/witgets/my_health_app_drawer.dart';


// Widget principal de la pantalla BMI.
// Se usa StatefulWidget porque los datos cambian
// cuando el usuario escribe y calcula el BMI.
class BmiScreen extends StatefulWidget {

  // Crea el estado asociado al widget
  @override
  _BmiScreenState createState() => _BmiScreenState();
}


// Clase que maneja el estado de la pantalla BMI
class _BmiScreenState extends State<BmiScreen> {

  // Controlador para capturar el peso ingresado
  final TextEditingController _weightController =
      TextEditingController();

  // Controlador para capturar la altura ingresada
  final TextEditingController _heightController =
      TextEditingController();

  // Variable que almacena el BMI calculado
  double? _bmi;

  // Variable que almacena la categoría del BMI
  String? _category;


  // Método encargado de calcular el BMI
  void _calculateBMI() {

    // Convierte el texto ingresado en número decimal
    // Si falla, asigna 0
    final double weight =
        double.tryParse(_weightController.text) ?? 0;

    final double height =
        double.tryParse(_heightController.text) ?? 0;


    // Verifica que los valores sean válidos
    if (weight > 0 && height > 0) {

      // Convierte la altura de centímetros a metros
      final double heightInMeters = height / 100;

      // Actualiza la interfaz
      setState(() {

        // Fórmula del Índice de Masa Corporal
        _bmi = weight /
            (heightInMeters * heightInMeters);

        // Determina la categoría del resultado
        _category = _determineCategory(_bmi!);
      });
    }
  }


  // Método que clasifica el BMI según el resultado
  String _determineCategory(double bmi) {

    // Bajo peso
    if (bmi < 18.5) {
      return "Underweight";
    }

    // Peso normal
    else if (bmi < 25) {
      return "Normal";
    }

    // Sobrepeso
    else if (bmi < 30) {
      return "Overweight";
    }

    // Obesidad
    else {
      return "Obese";
    }
  }


  // Método que construye la interfaz gráfica
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      // Drawer lateral de navegación
      drawer: MyHealthAppDrawer(),

      // Barra superior
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),

      // Contenido principal
      body: Padding(

        // Espaciado interno
        padding: const EdgeInsets.all(20.0),

        // Organización vertical
        child: Column(

          // Centra los elementos verticalmente
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            // Campo de texto para el peso
            TextField(

              // Controlador asociado
              controller: _weightController,

              // Permite únicamente teclado numérico
              keyboardType: TextInputType.number,

              // Decoración del campo
              decoration: InputDecoration(

                // Texto de la etiqueta
                labelText: 'Weight (kg)',

                // Borde visual
                border: OutlineInputBorder(),

                // Texto guía
                hintText: 'Enter your weight in kg',
              ),
            ),

            // Espacio entre widgets
            SizedBox(height: 20),

            // Campo de texto para la altura
            TextField(

              // Controlador asociado
              controller: _heightController,

              // Teclado numérico
              keyboardType: TextInputType.number,

              // Decoración visual
              decoration: InputDecoration(

                // Etiqueta
                labelText: 'Height (cm)',

                // Borde visual
                border: OutlineInputBorder(),

                // Texto guía
                hintText: 'Enter your height in cm',
              ),
            ),

            // Espacio entre widgets
            SizedBox(height: 20),

            // Botón para calcular el BMI
            ElevatedButton(

              // Acción al presionar
              onPressed: _calculateBMI,

              // Texto del botón
              child: Text('Calculate BMI'),
            ),

            // Espacio entre widgets
            SizedBox(height: 20),

            // Muestra el resultado únicamente si existe
            if (_bmi != null)

              Text(

                // Resultado del BMI con 2 decimales
                'Your BMI: ${_bmi!.toStringAsFixed(2)} ($_category)',

                // Estilo del texto
                style: TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}