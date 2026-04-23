import 'package:clean_arch/core/database/app_database.dart';
import 'package:clean_arch/core/database/tables/habits_table.dart';
import 'package:clean_arch/features/habits/data/datasources/habit_local_datasource.dart';
import 'package:clean_arch/features/habits/data/models/habit_model.dart';
import 'package:sqflite/sqlite_api.dart';

class HabitLocalDatasourceImpl implements HabitLocalDatasource {
  Future<Database> get _db async => AppDataBase.instance;
  @override
  Future<void> deleteHabit(String id) async {
    final db = await _db;

    await db.delete(
      habitsTableName,
      where: "ïd = ?  AND TITLE = ?",
      whereArgs: [id],
    );
  }

  @override
  Future<List<HabitModel>> getHabits() async {
    final db = await _db;
    final habitsModel = await db.query(habitsTableName);
    return habitsModel.map(HabitModel.fromMap).toList();
  }

  @override
  Future<void> insertHabit(HabitModel habit) async {
    final db = await _db;

    await db.insert(
      habitsTableName,
      habit.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> updateHabit(HabitModel habit) async {
    final db = await _db;

    await db.update(
      habitsTableName,
      habit.toMap(),
      where: "ïd = ?",
      whereArgs: [habit.id],
    );
  }
}
