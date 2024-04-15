import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymstats/globalStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:gymstats/models/workoutModel.dart';
import 'package:gymstats/pages/newWorkout.dart';
import 'package:gymstats/services/firebase_service.dart';
import 'package:gymstats/widget/cardWorkout.dart';

class Workout extends StatefulWidget {
  const Workout({super.key});

  @override
  State<Workout> createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _user;

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((event) {
      setState(() {
        _user = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Row(
            children: [
              const Text(
                'Workout',
                style: TextStyle(
                  fontSize: 30,
                  color: AppColors.titlePage,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewWorkout(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.add,
                  color: AppColors.titlePage,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const CupertinoSearchTextField(
          placeholder: 'Cerca il tuo workout',
          itemColor: AppColors.titlePage,
          style: TextStyle(color: Colors.white),
        ),
        StreamBuilder(
          stream: _user != null
              ? firebase_service().getWorkoutsByUserID(_user!.uid)
              : null, // Creare un'istanza di firebase_service
          builder: (context, snapshot) {
            if (_user == null) {
              // User is not authenticated, handle this case
              return const Center(
                heightFactor: 16.2,
                child: CircularProgressIndicator(),
              );
            }
            List workoutList = snapshot.data?.docs ?? [];
            // Gestire lo snapshot e costruire la ListView
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Se lo snapshot è in attesa, puoi mostrare un indicatore di caricamento
              return const Center(
                heightFactor: 16.2,
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              // Se c'è un errore nello snapshot, puoi mostrare un messaggio di errore
              return Text('Error: ${snapshot.error}');
            } else {
              if (workoutList.isNotEmpty) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: workoutList.length,
                  itemBuilder: (context, index) {
                    WorkoutModel workout = workoutList[index].data();
                    return CardWorkout(workout: workout);
                  },
                );
              } else {
                return Center(
                  heightFactor: 4.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icon/iconEmpty.png',
                        width: 90,
                        height: 90,
                      ),
                      const Text(
                        'Nessun workout?',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'Creane uno!',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              }
            }
          },
        ),
      ],
    );
  }
}
