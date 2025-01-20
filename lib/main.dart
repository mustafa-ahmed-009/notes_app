import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/note_cubit/cubit/note_cubit_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/screens/edit_screen.dart';
import 'package:notes_app/screens/home_screen.dart';
import 'package:notes_app/simple_bloc_observer.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllNoteCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          EditScreen.editScreenId: (context) => const EditScreen(),
          HomeScreen.homeScreenId: (context) => const HomeScreen(),
        },
        theme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: const Color(0xff2D2D2D),
            fontFamily: "Poppins"),
        initialRoute: HomeScreen.homeScreenId,
      ),
    );
  }
}
