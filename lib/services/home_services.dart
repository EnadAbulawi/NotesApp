import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/services/custom_firestore_services.dart';
import '../utils/firestore_paths.dart';

abstract class HomeServices {
  Future<List<NoteModel>> getNotes();
  Future<void> addNote({required NoteModel note});
  Future<void> deleteNote({required String id});
  Future<void> updateNote({
  required NoteModel note,
});
}

class HomeServicesImpl implements HomeServices {
  final CustomFirestoreServices firestoreServices = CustomFirestoreServices();

  @override
  Future<void> addNote({required NoteModel note}) async {
    await firestoreServices.addNote(
      path: FirestorePaths.addNotes(note.id),
      data: note.toMap(),
    );
  }

  @override
  Future<void> deleteNote({required String id}) async {
    await firestoreServices.deleteNote(path: FirestorePaths.deleteNotes(id));
  }

  @override
  Future<List<NoteModel>> getNotes() async {
    final notes = await firestoreServices.getNotes(
      path: FirestorePaths.getNotes(),
      );
      return notes.map((e)=> NoteModel.fromMap(e)).toList();
  }
  
@override
Future<void> updateNote({
  required NoteModel note,
}) async {
  await firestoreServices.updateNote(
    path: FirestorePaths.updateNotes(note.id),
    data: {
      'title': note.title,
      'content': note.content,
      'updatedAt': note.updatedAt?.toIso8601String(),
    },
  );
}


  } 

