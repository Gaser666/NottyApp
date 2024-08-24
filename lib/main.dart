import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/cubits/notes_cubit/note_cubit.dart';
import 'package:todo_app/models/note_model.dart';
import 'package:todo_app/simple_bloc_observer.dart';
import 'package:todo_app/views/notes_view.dart';

void main() async {
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  await Hive.openBox<NoteModel>(kNotesBox);
  // Hive.registerAdapter<NoteModelAdapter>(
  //     NoteModelAdapter() as TypeAdapter<NoteModelAdapter>);

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        title: 'MyNotty',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const NotesView(),
      ),
    );
  }
}
