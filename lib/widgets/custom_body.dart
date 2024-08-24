import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/notes_cubit/note_cubit.dart';
import 'package:todo_app/widgets/custom_appbar.dart';

import 'package:todo_app/widgets/notes_list_view.dart';

class CustomBody extends StatefulWidget {
  const CustomBody({super.key});

  @override
  State<CustomBody> createState() => _CustomBodyState();
}

class _CustomBodyState extends State<CustomBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            CustomAppBar(
              icon: Icons.note_alt_outlined,
              title: 'My Notty',
            ),
            Expanded(child: NotesListView()),
          ],
        ),
      ),
    );
  }
}
