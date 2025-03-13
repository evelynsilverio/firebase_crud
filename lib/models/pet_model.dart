import 'package:cloud_firestore/cloud_firestore.dart';

class PetModel {
  final String id;
  final String nombre;
  final String genero;
  final String raza;
  final String tipo;
  final int edad;

  PetModel({
    required this.id,
    required this.nombre,
    required this.genero,
    required this.raza,
    required this.tipo,
    required this.edad,
  });

  //Convertir de un PetModel a un Map
  //Cuando se inserta una mascota desde la app
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'genero': genero,
      'raza': raza,
      'tipo': tipo,
      'edad': edad,
    };
  }

  //Crear un PetModel desde en DocumentSnapshot
  //Cuando traemos información de Firebase
  factory PetModel.fromDocumentSnapshot(DocumentSnapshot doc){
    return PetModel(
      id: doc.id,
      nombre: doc['nombre'],
      genero: doc['genero'],
      raza: doc['raza'],
      tipo: doc['tipo'],
      edad: doc['edad'] as int,
      );
  }
}
