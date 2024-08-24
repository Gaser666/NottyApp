import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/constants.dart';

import 'package:todo_app/cubits/notes_cubit/notes_states.dart';
import 'package:todo_app/models/note_model.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NoteInitial());
  List<NoteModel>? notes;
  fetchAllNotes() async {
    // await Hive.openBox(kNotesBox);
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();
    emit(NoteSucces());
  }
}
