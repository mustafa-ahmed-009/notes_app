import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/note_cubit/cubit/note_cubit_cubit.dart';
import 'package:notes_app/widgets/notes_list_view.dart';

class NoteScreenBody extends StatefulWidget {
  const NoteScreenBody({super.key});

  @override
  State<NoteScreenBody> createState() => _NoteScreenBodyState();
}

class _NoteScreenBodyState extends State<NoteScreenBody> {
  @override
  void initState() {
    BlocProvider.of<AllNoteCubit>(context).fetchAllNotes();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const NotesListView();
  }
}
