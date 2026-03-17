import 'package:clean_arch/features/habits/data/datasources/habit_local_datasource.dart';
import 'package:clean_arch/features/habits/data/models/habit_model.dart';
import 'package:clean_arch/features/habits/domain/entities/habit.dart';
import 'package:clean_arch/features/habits/domain/repositories/habit_repository.dart';

class HabitRepositoryImpl implements HabitRepository {
  final HabitLocalDatasource _datasource;

  const HabitRepositoryImpl(this._datasource);

  @override
  Future<void> delete(String id) async {
    await _datasource.deleteHabit(id);
  }

  @override
  Future<List<Habit>> get() async {
    final models = await _datasource.getHabits();

    return models
        .map(
          (model) => Habit(
            id: model.id,
            title: model.title,
            createdAt: model.createdAt,
          ),
        )
        .toList();
  }

  @override
  Future<void> insert(Habit habit) async {
    await _datasource.insertHabit(
      HabitModel(id: habit.id, title: habit.title, createdAt: habit.createdAt),
    );
  }

  @override
  Future<void> update(Habit habit) async {
    await _datasource.insertHabit(
      HabitModel(id: habit.id, title: habit.title, createdAt: habit.createdAt),
    );
  }
}
