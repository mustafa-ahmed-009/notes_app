import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/note_cubit/cubit/note_cubit_cubit.dart';
import 'package:notes_app/helpers/show_snack_bar.dart';
import 'package:notes_app/models/note_model.dart';

class DeleteNoteWidget extends StatelessWidget {
  const DeleteNoteWidget({
    super.key,
    required this.noteModel,
  });

  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return Container(
                  child: AlertDialog(
                    backgroundColor: const Color(0xff2D2D2D),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "do you really want to remove the note ? ",
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                noteModel.delete();
                                BlocProvider.of<AllNoteCubit>(context)
                                    .fetchAllNotes();
                                Navigator.pop(context);
                                showSnackBar(
                                    context: context,
                                    message:
                                        "Note has benn successfully deleted");
                              },
                              child: const Text(
                                "yes",
                                style: TextStyle(color: kPrimaryColor),
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "No",
                                  style: TextStyle(color: kPrimaryColor),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
        },
        icon: const Icon(
          Icons.delete,
          color: Colors.black,
          size: 30,
        ));
  }
}
