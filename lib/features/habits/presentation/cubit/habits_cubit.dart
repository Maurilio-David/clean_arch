import 'package:clean_arch/features/habits/domain/entities/habit.dart';
import 'package:clean_arch/features/habits/domain/usecases/delete_habit_usecase.dart';
import 'package:clean_arch/features/habits/domain/usecases/get_habits_usecase.dart';
import 'package:clean_arch/features/habits/domain/usecases/insert_habit_usecase.dart';
import 'package:clean_arch/features/habits/domain/usecases/update_habit_usecase.dart';
import 'package:clean_arch/features/habits/presentation/cubit/habits_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class HabitsCubit extends Cubit<HabitsState> {
  final GetHabitsUsecase _getHabitUsecase;
  final InsertHabitUsecase _insertHabitUsecase;
  final UpdateHabitUsecase _updateHabitUsecase;
  final DeleteHabitUsecase _deleteHabitUsecase;

  HabitsCubit(
    this._getHabitUsecase,
    this._insertHabitUsecase,
    this._updateHabitUsecase,
    this._deleteHabitUsecase,
  ) : super(HabitsInitial());

  Future<void> getHabits() async {
    emit(HabitLoading());

    try {
      final habits = await _getHabitUsecase();
      emit(HabitsLoaded(habits));
    } catch (e) {
      emit(HabitsError(e.toString()));
    }
  }

  Future<void> insertHabit(String title) async {
    try {
      final habit = Habit(
        id: Uuid().v4(),
        title: title,
        createdAt: DateTime.now(),
      );
      await _insertHabitUsecase(habit);
      await getHabits();
    } catch (e) {
      emit(HabitsError(e.toString()));
    }
  }

  Future<void> editHabit(Habit habit) async {
    try {
      await _updateHabitUsecase(habit);
      await getHabits();
    } catch (e) {
      emit(HabitsError(e.toString()));
    }
  }

  Future<void> deleteHabit(String id) async {
    try {
      await _deleteHabitUsecase(id);
      await getHabits();
    } catch (e) {
      emit(HabitsError(e.toString()));
    }
  }
}
