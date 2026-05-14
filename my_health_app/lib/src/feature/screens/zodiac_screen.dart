// Importa los widgets de Flutter Material Design
import 'package:flutter/material.dart';

// Importa el Drawer personalizado de la aplicación
import 'package:my_health_app/src/feature/witgets/my_health_app_drawer.dart';


// Pantalla encargada de calcular el signo zodiacal.
// Se utiliza StatefulWidget porque los datos cambian
// dinámicamente cuando el usuario interactúa.
class ZodiacScreen extends StatefulWidget {

  // Crea el estado asociado al widget
  @override
  _ZodiacScreenState createState() => _ZodiacScreenState();
}


// Clase que maneja el estado de ZodiacScreen
class _ZodiacScreenState extends State<ZodiacScreen> {

  // Controlador para capturar el nombre ingresado
  final TextEditingController _nameController =
      TextEditingController();

  // Variable que almacena la fecha seleccionada
  DateTime? _selectedDate;

  // Variable que almacena el signo zodiacal calculado
  String? _zodiacSign;


  // Método que muestra el selector de fechas
  void _presentDatePicker() {

    // Abre el calendario emergente
    showDatePicker(

      // Contexto actual
      context: context,

      // Fecha inicial mostrada
      initialDate: DateTime.now(),

      // Fecha mínima permitida
      firstDate: DateTime(1900),

      // Fecha máxima permitida
      lastDate: DateTime.now(),

      // Acción al seleccionar fecha
    ).then((pickedDate) {

      // Si el usuario cancela, no hace nada
      if (pickedDate == null) return;

      // Actualiza la interfaz
      setState(() {

        // Guarda la fecha seleccionada
        _selectedDate = pickedDate;

        // Determina el signo zodiacal
        _zodiacSign =
            _determineZodiacSign(pickedDate);
      });
    });
  }


  // Método encargado de determinar el signo zodiacal
  String _determineZodiacSign(DateTime date) {

    // Obtiene el día y mes de la fecha
    int day = date.day;
    int month = date.month;


    // Aries
    if ((month == 3 && day >= 21) ||
        (month == 4 && day <= 19)) {

      return "Aries";
    }

    // Taurus
    else if ((month == 4 && day >= 20) ||
             (month == 5 && day <= 20)) {

      return "Taurus";
    }

    // Gemini
    else if ((month == 5 && day >= 21) ||
             (month == 6 && day <= 20)) {

      return "Gemini";
    }

    // Cancer
    else if ((month == 6 && day >= 21) ||
             (month == 7 && day <= 22)) {

      return "Cancer";
    }

    // Leo
    else if ((month == 7 && day >= 23) ||
             (month == 8 && day <= 22)) {

      return "Leo";
    }

    // Virgo
    else if ((month == 8 && day >= 23) ||
             (month == 9 && day <= 22)) {

      return "Virgo";
    }

    // Libra
    else if ((month == 9 && day >= 23) ||
             (month == 10 && day <= 22)) {

      return "Libra";
    }

    // Scorpio
    else if ((month == 10 && day >= 23) ||
             (month == 11 && day <= 21)) {

      return "Scorpio";
    }

    // Sagittarius
    else if ((month == 11 && day >= 22) ||
             (month == 12 && day <= 21)) {

      return "Sagittarius";
    }

    // Capricorn
    else if ((month == 12 && day >= 22) ||
             (month == 1 && day <= 19)) {

      return "Capricorn";
    }

    // Aquarius
    else if ((month == 1 && day >= 20) ||
             (month == 2 && day <= 18)) {

      return "Aquarius";
    }

    // Pisces
    else if ((month == 2 && day >= 19) ||
             (month == 3 && day <= 20)) {

      return "Pisces";
    }

    // Retorno por defecto en caso inesperado
    return "Unknown";
  }


  // Método que construye la interfaz gráfica
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      // Drawer lateral de navegación
      drawer: MyHealthAppDrawer(),

      // Barra superior
      appBar: AppBar(
        title: Text("Zodiac Sign Calculator"),
      ),

      // Contenido principal
      body: Padding(

        // Espaciado interno
        padding: const EdgeInsets.all(20.0),

        // Organización vertical
        child: Column(

          // Alineación al inicio
          mainAxisAlignment: MainAxisAlignment.start,

          children: [

            // Campo de texto para ingresar el nombre
            TextField(

              // Controlador asociado
              controller: _nameController,

              // Decoración visual
              decoration: InputDecoration(

                // Etiqueta del campo
                labelText: 'Name',

                // Texto guía
                hintText: 'Enter your name',

                // Borde visual
                border: OutlineInputBorder(),
              ),
            ),

            // Espacio entre widgets
            SizedBox(height: 20),

            // Botón para seleccionar fecha
            ElevatedButton(

              // Acción del botón
              onPressed: _presentDatePicker,

              // Texto dinámico
              child: Text(

                _selectedDate == null

                    ? 'Pick your birthdate'

                    : 'Change birthdate',
              ),
            ),

            // Espacio entre widgets
            SizedBox(height: 20),

            // Muestra el resultado si ya existe un signo
            if (_zodiacSign != null)

              Text(

                // Mensaje personalizado
                'Hello, ${_nameController.text}! Your Zodiac Sign is $_zodiacSign.',

                // Estilo del texto
                style: TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}