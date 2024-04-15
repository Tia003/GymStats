import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gymstats/models/workoutModel.dart';

const String WORKOUT_COLLECTION_REF = "WORKOUT";

class firebase_service {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _WorkoutRef;

  firebase_service() {
    _WorkoutRef = _firestore
        .collection(WORKOUT_COLLECTION_REF)
        .withConverter<WorkoutModel>(
            fromFirestore: (snapshots, _) =>
                WorkoutModel.fromJson(snapshots.data()!),
            toFirestore: (workout, _) => workout.toJson());
  }

  Stream<QuerySnapshot> getWorkouts() {
    return _WorkoutRef.snapshots();
  }

  Stream<QuerySnapshot> getWorkoutsByUserID(String UserId) {
    return _WorkoutRef.where('ID_USER', isEqualTo: UserId).snapshots();
  }

  void addWorkout(WorkoutModel workout) async {
    _WorkoutRef.add(workout);
  }
}
