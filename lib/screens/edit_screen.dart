import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/note_cubit/cubit/note_cubit_cubit.dart';
import 'package:notes_app/helpers/picking_a_color.dart';
import 'package:notes_app/helpers/show_snack_bar.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_app_bar_icon.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});
  static const editScreenId = "EditScreen";

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  int? chosenColor;
  getPickedColor(int pickedColor) {
    setState(() {
      chosenColor = pickedColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    NoteModel myNoteModel =
        ModalRoute.of(context)!.settings.arguments as NoteModel;

    String? title, subTitle;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff2D2D2D),
          title: const Text('Edit Note'),
          actions: [
            CustomAppBarIcon(
              onTap: () {
                myNoteModel.title = title ?? myNoteModel.title;
                myNoteModel.subTitle = subTitle ?? myNoteModel.subTitle;
                myNoteModel.color = chosenColor ?? myNoteModel.color;
                myNoteModel.save();
                BlocProvider.of<AllNoteCubit>(context).fetchAllNotes();
                Navigator.pop(context);
                showSnackBar(
                    context: context, message: "note updated successfully");
              },
              icon: Icons.check,
            )
          ],
        ),
        body: Column(
          children: [
            CustomTextField(
              hintText: "title",
              initialValue: myNoteModel.title,
              onChanged: (value) {
                title = value;
              },
              hintTextColor: kPrimaryColor,
            ),
            CustomTextField(
              hintText: myNoteModel.subTitle,
              initialValue: myNoteModel.subTitle,
              maxLines: 5,
              onChanged: (value) {
                subTitle = value;
              },
              hintTextColor: kPrimaryColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const  Text(
                  "Choose note color: ",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    pick_a_color(
                        context: context,
                        getPickedColor: getPickedColor,
                        enableSnackBar: true);
                  },
                  child: CircleAvatar(
                    backgroundColor: Color(chosenColor ?? myNoteModel.color),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
