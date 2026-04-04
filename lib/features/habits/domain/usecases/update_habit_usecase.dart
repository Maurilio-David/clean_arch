import 'package:clean_arch/features/habits/domain/repositories/habit_repository.dart';

import '../entities/habit.dart';

class UpdateHabitUsecase {
  final HabitRepository _repository;

  const UpdateHabitUsecase(this._repository);

  Future<void> call(Habit habit) async {
    return await _repository.update(habit);
  }
}
