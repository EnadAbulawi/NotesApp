import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/utils/app_fonts.dart';

import '../screens/notes_detail_screen.dart';
import 'search_screen_notecard_widget.dart';

class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({
    super.key,
    required this.filteredNotes,
  });

  final List<NoteModel> filteredNotes;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: filteredNotes.isEmpty
          ?  Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 340,
                    height: 240,
                    child: Image.asset('assets/images/no_search.png')),
                  Text(
                    'لم يتم العثور على نتائج',
                    style: AppFontsStyle.expoRegular,
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: filteredNotes.length,
              itemBuilder: (context, index) {
                final note = filteredNotes[index];
                return GestureDetector(
                  onTap: () {
                    // الانتقال إلى تفاصيل الملاحظة
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NoteDetailsScreen(note: note),
                      ),
                    );  
                  },
                  child: SearchScreenNotesCardWidget(note: note),
                );
    
              },
            ),
    );
  }
}
