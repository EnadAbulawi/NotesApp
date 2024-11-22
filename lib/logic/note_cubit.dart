import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/services/home_services.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  final TextEditingController textController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final HomeServicesImpl homeServices = HomeServicesImpl();

  void addNote({
    required String title,
    required String content,
  }) async {
    try {
      emit(AddNoteLoading());
      final note = NoteModel(
        id: NoteModel.generateId(),
        title: title,
        content: content,
        createdAt: DateTime.now(),
      );
      await homeServices.addNote(note: note);
      emit(AddNoteSuccess());
      getNotes();
    } catch (e) {
      emit(AddNoteFailure());
      log("Error adding note: $e");
    }
  }

  void deleteNote({required String id}) async {
    emit(DeleteNoteLoading());
    try {
      await homeServices.deleteNote(id: id);
      emit(DeleteNoteSuccess());
      getNotes();
    } catch (e) {
      emit(DeleteNoteFailure());
    }
  }

  void getNotes() async {
    try {
      emit(GetNotesLoading());
      final notes = await homeServices.getNotes();
      log("Fetched Notes: ${notes.length}"); // تحقق من عدد الملاحظات
      emit(GetNotesSuccess(notes: notes));
    } catch (e) {
      log("Error fetching notes: $e"); // سجل الأخطاء
      emit(GetNotesFailure());
    }
  }

  void editNote({
    required String id,
    required String title,
    required String content,
  }) async {
    try {
      emit(UpdateNoteLoading());
      await homeServices.updateNote(
        note: NoteModel(
          id: id,
          title: title,
          content: content,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      );
      emit(UpdateNoteSuccess());
      getNotes();
    } catch (e) {
      emit(UpdateNoteFailure());
    }
  }

  void updateNote({
    required String id,
    required String title,
    required String content,
  }) async {
    try {
      emit(UpdateNoteLoading());
      await homeServices.updateNote(
        note: NoteModel(
          id: id,
          title: title,
          content: content,
          createdAt: DateTime.now(), // وقت الإنشاء يبقى كما هو
          updatedAt: DateTime.now(), // تحديث وقت التعديل
        ),
      );
      emit(UpdateNoteSuccess());
      getNotes();
    } catch (e) {
      emit(UpdateNoteFailure());
    }
  }
}
