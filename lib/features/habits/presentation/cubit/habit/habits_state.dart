import 'package:clean_arch/features/habits/domain/entities/habit.dart';

abstract class HabitsState {
  const HabitsState();
}

class HabitsInitial extends HabitsState {}

class HabitLoading extends HabitsState {}

class HabitsLoaded extends HabitsState {
  final List<Habit> habits;

  const HabitsLoaded(this.habits);
}

class HabitsError extends HabitsState {
  final String error;

  const HabitsError(this.error);
}
