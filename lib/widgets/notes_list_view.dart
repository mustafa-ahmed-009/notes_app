import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/note_cubit/cubit/note_cubit_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllNoteCubit, NoteCubitState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<AllNoteCubit>(context).notes!;
        return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return NoteItem(
                noteModel: notes[index],
              );
            });
      },
    );
  }
}
