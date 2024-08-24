import 'package:flutter/material.dart';

import 'package:todo_app/widgets/custom_body.dart';
import 'package:todo_app/widgets/show_bottom_sheet.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return ShowBottomSheet();
                });
          }),
      body: const CustomBody(),
    );
  }
}
