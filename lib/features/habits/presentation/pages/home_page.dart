import 'package:clean_arch/core/di/injector_container.dart';
import 'package:clean_arch/features/habits/presentation/cubit/habit/habits_cubit.dart';
import 'package:clean_arch/features/habits/presentation/cubit/habit/habits_state.dart';
import 'package:clean_arch/features/habits/presentation/widgets/habits_form_dialog.dart';
import 'package:clean_arch/features/habits/presentation/widgets/list_habits_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final habitsCubit = sl<HabitsCubit>();
  @override
  void initState() {
    super.initState();
    habitsCubit.getHabits();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Habits')),
      body: BlocBuilder<HabitsCubit, HabitsState>(
        builder: (context, state) {
          if (state is HabitLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is HabitsLoaded) {
            return ListHabitsWidget(habits: state.habits);
          }
          if (state is HabitsError) {
            return Center(child: Text(state.error));
          }
          return SizedBox.shrink();
        },
        bloc: habitsCubit,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => HabitsFormDialog(),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
