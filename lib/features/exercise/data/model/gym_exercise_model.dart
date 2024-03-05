import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class GymExerciseModel extends Equatable {
  final String image;
  final String title;
  final int order;
  final String documentId;
  final String rep ;

  const GymExerciseModel({
    required this.image,
    required this.title,
    required this.order,
    required this.documentId,
    required this.rep
  });

  factory GymExerciseModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final json = document.data()!;
    return GymExerciseModel(
        image: json["image"],
      title: json["title"],
      order: json["order"],
      rep: json["rep"]?? "",
      documentId: document.id

    );
  }

  @override
  List<Object> get props => [image, title, order,rep,documentId];
}
