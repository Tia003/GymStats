import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gymstats/globalStyle.dart';

class NewWorkout extends StatefulWidget {
  const NewWorkout({Key? key}) : super(key: key);

  @override
  _NewWorkoutState createState() => _NewWorkoutState();
}

class _NewWorkoutState extends State<NewWorkout> {
  String selectedCategory =
      'Categoria'; // Valore iniziale per il campo categoria

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.titlePage,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Nuovo workout',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Nome',
                    hintStyle: TextStyle(
                      color: AppColors.whiteText,
                    ),
                    // Se desideri cambiare anche il colore del bordo quando il campo ottiene il focus, puoi utilizzare focusedBorder.
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.titlePage,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        readOnly: true,
                        controller:
                            TextEditingController(text: selectedCategory),
                        decoration: InputDecoration(
                          hintText: 'Categoria',
                          hintStyle: TextStyle(
                            color: AppColors.whiteText,
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.titlePage,
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _showCategoryPicker(context);
                      },
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.titlePage,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 25,
                  padding: EdgeInsets.all(2),
                  width: double.infinity,
                  decoration: BoxDecoration(color: AppColors.titlePage),
                  child: Text('ESERCIZI'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Funzione per mostrare il CupertinoPicker
  void _showCategoryPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: CupertinoPicker(
            itemExtent: 35,
            onSelectedItemChanged: (int index) {
              setState(() {
                // Aggiorna il valore selezionato
                selectedCategory = categories[index];
              });
            },
            children: List.generate(
              categories.length,
              (index) {
                return Center(
                  child: Text(
                    categories[index],
                    style: TextStyle(fontSize: 18),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

// Lista delle categorie di esempio
List<String> categories = [
  'Cardio',
  'Sollevamento pesi',
  'Yoga',
  'Pilates',
  'CrossFit'
]; // Aggiungi le tue categorie
