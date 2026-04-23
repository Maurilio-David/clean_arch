import 'package:clean_arch/features/habits/domain/entities/habit.dart';
import 'package:clean_arch/features/habits/domain/repositories/habit_repository.dart';

class GetHabitsUsecase {
  final HabitRepository _repository;

  const GetHabitsUsecase(this._repository);

  Future<List<Habit>> call() async {
    return await _repository.get();
  }
}
