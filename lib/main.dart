import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/bloc_observable/simple_bloc_observable.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/cubits/notes/notes_cubit.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/screens/notes_screen.dart';

void main()  async{
  await Hive.initFlutter();

  Bloc.observer = SimpleBlocObservable();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NotesCubit(),)
      ],
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        debugShowCheckedModeBanner: false,
        home: const NotesViews(),
      ),
    );
  }
}


