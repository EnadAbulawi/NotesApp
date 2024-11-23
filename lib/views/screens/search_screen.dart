import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/logic/note_cubit.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/utils/app_fonts.dart';
import 'package:notesapp/views/widgets/search_screen_body.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    final notes = context.select<NoteCubit, List<NoteModel>>((cubit) =>
        cubit.state is GetNotesSuccess
            ? (cubit.state as GetNotesSuccess).notes
            : []);

    // تصفية الملاحظات بناءً على النص المدخل
    final filteredNotes = notes.where((note) {
      return note.title.toLowerCase().contains(searchText.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('البحث عن الملاحظات', style: AppFontsStyle.expoBold),
      ),
      body: Column(
        children: [
          // شريط البحث
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: '... ابحث عن ملاحظة',
                hintStyle: AppFontsStyle.expoRegular,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      searchController.clear();
                      searchText = '';
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),
          ),
          // عرض النتائج أو رسالة "لا توجد نتائج"
          SearchScreenBody(filteredNotes: filteredNotes),
        ],
      ),
    );
  }
}
