
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/helpers/picking_a_color.dart';
import 'package:notes_app/helpers/show_snack_bar.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  int? chosenColor;
  getPickedColor(int pickedColor) {
    setState(() {
      chosenColor = pickedColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextField(
            initialValue: "",
            onSaved: (value) {
              title = value;
            },
            hintText: "title",
            onChanged: (onChanged) {},
            hintTextColor: kPrimaryColor,
          ),
          CustomTextField(
            initialValue: "",
            onSaved: (value) {
              subTitle = value;
            },
            hintText: "Content",
            maxLines: 5,
            onChanged: (onChanged) {},
            hintTextColor: kPrimaryColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
           const   Text(
                "Choose note color: ",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              GestureDetector(
                onTap: () {
                  pick_a_color(
                      context: context, getPickedColor: getPickedColor);
                },
                child: CircleAvatar(
                  // text: "Pick a note Color",
                  //,
                  backgroundColor: Color(chosenColor ?? 0xff75DCD7),
                ),
              ),
            ],
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                text: "Add",
                onTap: () {
                  var currentDate = DateTime.now();
                  var formatedDate =
                      formatDate(currentDate, [dd, '/', mm, '/', yyyy]);
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    final myNoteModel = NoteModel(
                        title: title!,
                        subTitle: subTitle!,
                        date: formatedDate,
                        color: chosenColor ?? Colors.blueAccent.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(myNoteModel);
                    showSnackBar(
                        context: context, message: "note Added successfully ");
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                buttonColor: kPrimaryColor,
              );
            },
          ),
        ],
      ),
    );
  }
}
