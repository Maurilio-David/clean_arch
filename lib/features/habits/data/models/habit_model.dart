import 'package:clean_arch/core/database/tables/habits_table.dart';

class HabitModel {
  final String id;
  final String title;
  final DateTime createdAt;

  const HabitModel({
    required this.id,
    required this.title,
    required this.createdAt,
  });

  factory HabitModel.fromMap(Map<String, dynamic> map) {
    return HabitModel(
      id: map[habistTableId],
      title: map[habistTableName],
      createdAt: DateTime.parse(map[habistTableCreatedAt]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      habistTableId: id,
      habistTableTitle: title,
      habistTableCreatedAt: createdAt.toIso8601String(),
    };
  }
}
