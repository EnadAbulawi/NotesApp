import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/firebase_options.dart';
import 'package:notesapp/logic/note_cubit.dart';
import 'package:notesapp/views/screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    BlocProvider(
      create: (context) {
        final noteCubit = NoteCubit();
        noteCubit.getNotes();
        return noteCubit;
      },
      child: const BasicNotesApp(),
    ),
  );
}

class BasicNotesApp extends StatelessWidget {
  const BasicNotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system, // يتبع إعدادات النظام
    );
  }
}
