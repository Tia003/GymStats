import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gymstats/globalStyle.dart';

class ExercisePickerScreen extends StatefulWidget {
  @override
  _ExercisePickerScreenState createState() => _ExercisePickerScreenState();
}

class _ExercisePickerScreenState extends State<ExercisePickerScreen> {
  List<String> selectedEsercizi = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.titlePage,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Seleziona gli esercizi',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              // Azione da eseguire quando viene premuto il pulsante "Salva"
              print(selectedEsercizi);
              Navigator.pop(context, selectedEsercizi);
            },
            child: const Text(
              'Salva',
              style: TextStyle(
                color: AppColors.whiteText,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text(
              exercises[index],
              style: TextStyle(fontSize: 16, color: AppColors.whiteText),
            ),
            value: selectedEsercizi.contains(exercises[index]),
            onChanged: (bool? value) {
              setState(() {
                if (value != null && value) {
                  selectedEsercizi.add(exercises[index]);
                } else {
                  selectedEsercizi.remove(exercises[index]);
                }
              });
            },
          );
        },
      ),
    );
  }
}

List<String> exercises = [
  'Push-ups',
  'Squats',
  'Pull-ups',
  'Planks',
  'Lunges',
  'Deadlifts',
];
