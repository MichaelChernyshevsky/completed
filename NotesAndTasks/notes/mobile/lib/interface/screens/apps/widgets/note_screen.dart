import 'package:app_with_apps/constants/localization/text.dart';
import 'package:app_with_apps/constants/models/notes/note_class.dart';
import 'package:app_with_apps/constants/models/state_enum.dart';
import 'package:app_with_apps/manager/notes/notes_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key, required this.id});

  final int id;

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  AppState state = AppState.loading;
  NotesBloc? _bloc;
  List<Note> elements = [];
  String newFolder_title = '';

  @override
  void initState() {
    _bloc = BlocProvider.of<NotesBloc>(context);
    _bloc!.add(GetNotesEvent());
    super.initState();
  }

  getData(List<Note> arr) {
    if (arr.isNotEmpty) {
      elements = arr;
      state = AppState.loaded;
    } else {
      state = AppState.empty;
    }
  }

  createFolder(title) => _bloc!.add(CreateFolderEvent(title: title));

  Future<void> _displayTextInputDialog(BuildContext context) async {
    String valueText = '';
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(ConstantText.creation),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              // decoration: InputDecoration(hintText: "Text Field in Dialog"),
            ),
            actions: <Widget>[
              MaterialButton(
                child: Text(ConstantText.ok),
                onPressed: () => setState(() {
                  createFolder(valueText);
                  newFolder_title = valueText;
                  Navigator.pop(context);
                }),
              ),
            ],
          );
        });
  }

  showCreation() => _displayTextInputDialog(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocListener<NotesBloc, NotesState>(
          listener: (context, state) {
            if (state is NotesData) {
              setState(() {
                getData(state.notes);
              });
            } else if (state is NotesError) {
              // print('error');
            } else if (state is DeleteSucess) {
              setState(() {});
            }
          },
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: elements.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: 50,
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(elements[index].title),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
