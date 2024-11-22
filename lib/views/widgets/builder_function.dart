

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:notesapp/logic/note_cubit.dart';
import 'package:notesapp/views/widgets/notes_list_view.dart';

Widget builderFunction(BuildContext context, NoteState state) {
  if (state is GetNotesLoading) {
    return const Center(child: CircularProgressIndicator());
  } else if (state is GetNotesSuccess) {
    log("Rendering Notes: ${state.notes.length}"); // تحقق من عدد الملاحظات
    return NotesListView(notes: state.notes);
  } else if (state is GetNotesFailure) {
    return const Center(child: Text('Failed to load notes'));
  }
  return const Center(child: Text('No notes to display'));
}


