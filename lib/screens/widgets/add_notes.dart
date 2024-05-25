import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:note_app/constant.dart';
import 'package:note_app/cubits/add_notes/add_notes_cubit.dart';
import 'package:note_app/cubits/notes/notes_cubit.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/screens/widgets/color_items.dart';
import 'package:note_app/screens/widgets/custom_textfield_notes.dart';

import '../../cubits/add_notes/add_notes_states.dart';

class CustomAddNotes extends StatefulWidget {
  const CustomAddNotes({Key? key}) : super(key: key);

  @override
  State<CustomAddNotes> createState() => _CustomAddNotesState();
}

class _CustomAddNotesState extends State<CustomAddNotes> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? title, content;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return AddNotesCubit();
      },
      child: Padding(
        padding: EdgeInsets.only(
          left: 15,
          right: 15,
          top: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: BlocConsumer<AddNotesCubit, AddNotesStates>(
            listener: (context, state) {
          if (state is AddNotesFailure) {}
          if (state is AddNotesSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchAllData();
            Navigator.pop(context);
          }
        }, builder: (context, state) {
          return SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTextField(
                      hint: "Title",
                      onSaved: (value) {
                        title = value;
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                      hint: "Content",
                      maxLine: 5,
                      onSaved: (value) {
                        content = value;
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomListColors(),
                  const SizedBox(
                    height: 30,
                  ),
                  BlocBuilder<AddNotesCubit, AddNotesStates>(
                      builder: (BuildContext context, state) => GestureDetector(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                var currentDate = DateTime.now();
                                var formattedDate =
                                    DateFormat.yMd().format(currentDate);
                                var noteModel = NoteModel(
                                  title: title!,
                                  subTitle: content!,
                                  date: formattedDate,
                                  color: Colors.blue.value,
                                );
                                BlocProvider.of<AddNotesCubit>(context)
                                    .addNotes(noteModel);
                              } else {
                                autoValidateMode = AutovalidateMode.always;
                                setState(() {});
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 10),
                              // width: double.infinity,
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(16),
                              ),

                              child: state is AddNotesLoading
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                      "Add",
                                      style: TextStyle(
                                          fontSize: 22, color: Colors.black),
                                    ),
                            ),
                          )),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}



