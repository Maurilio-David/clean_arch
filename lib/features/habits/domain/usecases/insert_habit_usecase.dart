import 'package:clean_arch/features/habits/domain/entities/habit.dart';
import 'package:clean_arch/features/habits/domain/repositories/habit_repository.dart';

class InsertHabitUsecase {
  final HabitRepository _repository;

  const InsertHabitUsecase(this._repository);

  Future<void> call(Habit habit) async {
    return await _repository.insert(habit);
  }
}
