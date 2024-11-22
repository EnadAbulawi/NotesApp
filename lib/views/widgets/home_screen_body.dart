
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/logic/note_cubit.dart';
import 'package:notesapp/views/widgets/builder_function.dart';
import 'package:notesapp/views/widgets/listener_function.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
       // استدعاء getNotes عند بناء الشاشة
    context.read<NoteCubit>().getNotes();
    return const BlocConsumer<NoteCubit, NoteState>(
      listener: listenerFunction,
      builder: builderFunction,
    );
  }
}