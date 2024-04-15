import 'package:flutter/material.dart';
import 'package:gymstats/globalStyle.dart';
import 'package:gymstats/models/workoutModel.dart';

class CardWorkout extends StatelessWidget {
  final WorkoutModel? workout;

  const CardWorkout({Key? key, this.workout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(66, 111, 109, 109),
        borderRadius: BorderRadius.all(
          Radius.circular(13),
        ),
        image: DecorationImage(
          image: AssetImage(
            "assets/img/jonathan-borba-JD6RMKGwSCQ-unsplash.jpg",
          ),
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.all(13.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    workout!.CATEGORIA,
                    style: TextStyle(
                      color: AppColors.titlePage,
                    ),
                  ),
                  Text(
                    workout!.NOME ?? '???',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // const Spacer(),
              // IconButton(
              //   onPressed: () {},
              //   color: Colors.yellow[600],
              //   icon: const Icon(
              //     Icons.grade,
              //   ),
              // )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tempo stimato'),
                  Text('Intensità'),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  IconButton.filled(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.white,
                      ),
                    ),
                    onPressed: () {},
                    color: AppColors.titlePage,
                    icon: const Icon(
                      Icons.data_exploration,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        AppColors.titlePage,
                      ),
                    ),
                    child: const Text(
                      'Avvia',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
