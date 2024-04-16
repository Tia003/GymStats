import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gymstats/globalStyle.dart';
import 'package:gymstats/pages/selezionaEsercizi.dart';

class NewWorkout extends StatefulWidget {
  const NewWorkout({Key? key}) : super(key: key);

  @override
  _NewWorkoutState createState() => _NewWorkoutState();
}

class _NewWorkoutState extends State<NewWorkout> {
  String _selectedCategory = 'Categoria';
  List<String> _selectedEsercizi = []; // Definizione della lista selezionata
  TextEditingController _categoryController = TextEditingController();

  @override
  void dispose() {
    _categoryController.dispose();
    super.dispose();
  }

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
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Nome',
                    hintStyle: TextStyle(
                      color: AppColors.placeholder,
                    ),
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
                        controller: _categoryController,
                        decoration: const InputDecoration(
                          hintText: 'Categoria',
                          hintStyle: TextStyle(
                            color: AppColors.placeholder,
                          ),
                          focusedBorder: UnderlineInputBorder(
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
                  height: 35,
                  padding: EdgeInsets.all(2),
                  width: double.infinity,
                  decoration: BoxDecoration(color: AppColors.titlePage),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('ESERCIZI'),
                      IconButton(
                        color: AppColors.whiteText,
                        alignment: Alignment.center,
                        iconSize: 19,
                        icon: _selectedEsercizi.isEmpty
                            ? Icon(Icons.add)
                            : Icon(Icons.edit),
                        onPressed: () {
                          _navigateToExercisePickerScreen(
                              context, _selectedEsercizi);
                        },
                      ),
                    ],
                  ),
                ),
                _selectedEsercizi.isEmpty
                    ? Container(
                        height:
                            50, // Altezza definita per il Container quando non ci sono esercizi selezionati
                        child: Center(
                          child: Text('Aggiungi almeno un esercizio'),
                        ),
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: _selectedEsercizi.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/icon/iconEmpty.png',
                                    width: 80,
                                    height: 80,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _selectedEsercizi[index],
                                        style: TextStyle(
                                          color: AppColors.whiteText,
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 2),
                                        decoration: const BoxDecoration(
                                          color: AppColors.titlePage,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                        child: const Wrap(
                                          spacing:
                                              5.0, // Spazio tra i widget all'interno del Wrap
                                          children: [
                                            Text('5'),
                                            Text('x'),
                                            Text('10'),
                                            SizedBox(width: 5),
                                            Text('25 Kg'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

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
                _selectedCategory = categories[index];
                _categoryController.text = _selectedCategory;
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

  void _navigateToExercisePickerScreen(
      BuildContext context, _selectedEsercizi) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ExercisePickerScreen(selectedEsercizi: _selectedEsercizi),
      ),
    );

    if (result != null && result is List<String>) {
      setState(() {
        _selectedEsercizi = result;
      });
    }
  }
}

List<String> categories = [
  'Cardio',
  'Sollevamento pesi',
  'Yoga',
  'Pilates',
  'CrossFit',
];
