import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/logic/note_cubit.dart';
import 'package:notesapp/views/widgets/custom_app_bar.dart';
import 'package:notesapp/views/widgets/home_screen_body.dart';
import '../widgets/custom_float_action_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            final noteCubit = context.read<NoteCubit>();
            noteCubit.getNotes();
          },
          child: const Column(
            children: [
              CustomAppBar(),
              Expanded(
                child: HomeScreenBody(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: const CustomFloatActionButton(),
    );
  }
}
