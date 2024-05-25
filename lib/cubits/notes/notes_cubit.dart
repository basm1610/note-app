import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/cubits/notes/notes_states.dart';
import 'package:note_app/model/note_model.dart';


class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  fetchAllData() async {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
       notes = notesBox.values.toList();
      emit(NotesSuccess());
    }

}
