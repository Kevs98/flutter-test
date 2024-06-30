import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final _fomrKey = GlobalKey<FormState>();

  String? _selectedOption1;
  String? _selectedOption2;
  String? _shortAnswer;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _fomrKey,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Preguntas de Opcion Multiple
          const Text(
            '1. Que es Flutter?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: const Text('Un framework para crear app para Android y IOS'),
            leading: Radio<String>(
              value: 'Un framework para crear app para Android y IOS',
              groupValue: _selectedOption1,
              onChanged: (value) {
                setState(() {
                  _selectedOption1 = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Un sistema para administrar bases de datos'),
            leading: Radio<String>(
              value: 'Un sistema para administrar bases de datos',
              groupValue: _selectedOption1,
              onChanged: (value) {
                setState(() {
                  _selectedOption1 = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Un lenguaje de programacion'),
            leading: Radio<String>(
              value: 'Un lenguaje de programacion',
              groupValue: _selectedOption1,
              onChanged: (value) {
                setState(() {
                  _selectedOption1 = value;
                });
              },
            ),
          ),
          const SizedBox(height: 20),
          // Preguntas de Verdadero/Falso
          const Text(
            '2. Flutter usa Dart como su lenguaje de programacion?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: const Text('Verdadero'),
            leading: Radio<String>(
              value: 'Verdadero',
              groupValue: _selectedOption2,
              onChanged: (value) {
                setState(() {
                  _selectedOption2 = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Falso'),
            leading: Radio<String>(
              value: 'Falso',
              groupValue: _selectedOption2,
              onChanged: (value) {
                setState(() {
                  _selectedOption2 = value;
                });
              },
            ),
          ),
          const SizedBox(height: 20),
          // preguntas de respuesta breve
          const Text(
            '3. Nombra un Widget para la introduccion de texto en flutter',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Respuesta:',
            ),
            onSaved: (value) {
              _shortAnswer = value;
            },
          ),
          const SizedBox(height: 20),

          // boton de envio
          ElevatedButton(
            onPressed: () {
              if (_fomrKey.currentState!.validate()) {
                _fomrKey.currentState!.save();
                // manejar el envio de datos
              }
            },
            child: const Text('Enviar'),
          )
        ],
      ),
    );
  }
}
