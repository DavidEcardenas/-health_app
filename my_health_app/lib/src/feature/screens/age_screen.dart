// Importa los widgets principales de Flutter Material Design
import 'package:flutter/material.dart';

// Importa el Drawer personalizado de la aplicación
import 'package:my_health_app/src/feature/witgets/my_health_app_drawer.dart';


// Widget principal de la pantalla de cálculo de edad.
// Se utiliza StatefulWidget porque la interfaz cambia
// cuando el usuario selecciona una fecha.
class AgeScreen extends StatefulWidget {

  // Método que crea el estado asociado al widget
  @override
  _AgeScreenState createState() => _AgeScreenState();
}


// Clase que maneja el estado de AgeScreen
class _AgeScreenState extends State<AgeScreen> {

  // Variable que almacena la fecha seleccionada por el usuario
  DateTime? _selectedDate;

  // Variable que almacena la edad calculada
  int? _age;


  // Método que muestra el selector de fechas
  void _presentDatePicker() {

    // showDatePicker abre un calendario emergente
    showDatePicker(

      // Contexto actual de la aplicación
      context: context,

      // Fecha inicial mostrada en el calendario
      initialDate: DateTime.now(),

      // Fecha mínima permitida
      firstDate: DateTime(1900),

      // Fecha máxima permitida
      lastDate: DateTime.now(),

      // Cuando el usuario selecciona una fecha
    ).then((pickedDate) {

      // Si el usuario cancela la selección, no hace nada
      if (pickedDate == null) return;

      // Actualiza el estado de la pantalla
      setState(() {

        // Guarda la fecha seleccionada
        _selectedDate = pickedDate;

        // Calcula la edad con base en la fecha seleccionada
        _age = _calculateAge(pickedDate);
      });
    });
  }


  // Método encargado de calcular la edad
  int _calculateAge(DateTime birthDate) {

    // Obtiene la fecha actual
    DateTime currentDate = DateTime.now();

    // Calcula la diferencia de años
    int age = currentDate.year - birthDate.year;

    // Verifica si el cumpleaños aún no ha ocurrido este año
    if (
        currentDate.month < birthDate.month ||

        (currentDate.month == birthDate.month &&
         currentDate.day < birthDate.day)
       ) {

      // Resta un año si aún no cumple años
      age--;
    }

    // Retorna la edad calculada
    return age;
  }


  // Método que construye la interfaz gráfica
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      // Drawer lateral de navegación
      drawer: MyHealthAppDrawer(),

      // Barra superior de la aplicación
      appBar: AppBar(
        title: Text("Age Calculator"),
      ),

      // Contenido principal de la pantalla
      body: Padding(

        // Espaciado interno
        padding: const EdgeInsets.all(160.0),

        // Organización vertical de widgets
        child: Column(

          // Centra el contenido verticalmente
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            // Botón para seleccionar la fecha
            ElevatedButton(

              // Acción al presionar el botón
              onPressed: _presentDatePicker,

              // Texto dinámico del botón
              child: Text(

                // Si no hay fecha seleccionada
                _selectedDate == null

                    ? 'Select your birthdate'

                    // Si ya existe una fecha seleccionada
                    : 'Change birthdate (${_selectedDate!.toIso8601String().substring(0, 10)})'
              ),
            ),

            // Espacio entre widgets
            SizedBox(height: 20),

            // Muestra la edad únicamente si ya fue calculada
            if (_age != null)

              Text(
                'You are $_age years old.',

                // Estilo del texto
                style: TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}