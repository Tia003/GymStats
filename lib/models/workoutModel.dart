import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';

class WorkoutModel {
  String NOME;
  int INTENSITA;
  String IMAGE;
  String ID_USER;
  String CATEGORIA;
  Timestamp DATA_CREAZIONE;
  Timestamp DATA_MODIFICA;

  WorkoutModel({
    required this.NOME,
    required this.INTENSITA,
    required this.IMAGE,
    required this.ID_USER,
    required this.CATEGORIA,
    required this.DATA_CREAZIONE,
    required this.DATA_MODIFICA,
  });

  WorkoutModel.fromJson(Map<String, Object?> json)
      : this(
          NOME: json['NOME']! as String,
          INTENSITA: json['INTENSITA']! as int,
          IMAGE: json['IMAGE']! as String,
          ID_USER: json['ID_USER']! as String,
          CATEGORIA: json['CATEGORIA']! as String,
          DATA_CREAZIONE: json['DATA_CREAZIONE']! as Timestamp,
          DATA_MODIFICA: json['DATA_MODIFICA']! as Timestamp,
        );

  WorkoutModel copyWith({
    String? NOME,
    int? INTENSITA,
    String? IMAGE,
    String? ID_USER,
    String? CATEGORIA,
    Timestamp? DATA_CREAZIONE,
    Timestamp? DATA_MODIFICA,
  }) {
    return WorkoutModel(
      NOME: NOME ?? this.NOME,
      INTENSITA: INTENSITA ?? this.INTENSITA,
      IMAGE: IMAGE ?? this.IMAGE,
      ID_USER: ID_USER ?? this.ID_USER,
      CATEGORIA: CATEGORIA ?? this.CATEGORIA,
      DATA_CREAZIONE: DATA_CREAZIONE ?? this.DATA_CREAZIONE,
      DATA_MODIFICA: DATA_MODIFICA ?? this.DATA_MODIFICA,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'NOME': NOME,
      'INTENSITA': INTENSITA,
      'IMAGE': IMAGE,
      'ID_USER': ID_USER,
      'CATEGORIA': CATEGORIA,
      'DATA_CREAZIONE': DATA_CREAZIONE,
      'DATA_MODIFICA': DATA_MODIFICA,
    };
  }
}
