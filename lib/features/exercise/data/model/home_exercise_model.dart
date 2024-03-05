import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class HomeExerciseModel extends Equatable {
  final String image;
  final String title;
  final String rep;
  final int order;
  final String documentId;

  const HomeExerciseModel({
    required this.documentId,
    required this.image,
    required this.title,
    required this.rep,
    required this.order,
  });

  factory HomeExerciseModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final json = document.data()!;
    return HomeExerciseModel(
      documentId: document.id,
      image: json["image"],
      title: json["title"],
      rep: json["rep"],
      order: json["order"],
    );
  }

  @override
  List<Object> get props => [documentId,image, title, rep, order];
}
