import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/logic/note_cubit.dart';
import 'package:notesapp/views/widgets/builder_function.dart';
import 'package:notesapp/views/widgets/listener_function.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  void initState() {
    super.initState();
    context.read<NoteCubit>().getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return const BlocConsumer<NoteCubit, NoteState>(
      listener: listenerFunction,
      builder: builderFunction,
    );
  }
}
