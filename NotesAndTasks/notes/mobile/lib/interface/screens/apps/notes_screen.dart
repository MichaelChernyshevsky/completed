import 'package:app_with_apps/constants/exports/exports.dart';
import 'package:app_with_apps/constants/localization/text.dart';
import 'package:app_with_apps/constants/models/notes/folder_class.dart';
import 'package:app_with_apps/constants/models/state_enum.dart';
import 'package:app_with_apps/interface/screens/apps/widgets/mainbody_widget.dart';
import 'package:app_with_apps/manager/notes/notes_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  AppState state = AppState.loading;
  NotesBloc? _bloc;
  List<Folder> elements = [];
  String newFolder_title = '';

  @override
  void initState() {
    _bloc = BlocProvider.of<NotesBloc>(context);
    _bloc!.add(GetFoldersEvent());
    super.initState();
  }

  getData(List<Folder> arr) {
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
        appBar: AppBar(
          actions: [
            ElevatedButton(
              onPressed: showCreation,
              child: Text(ConstantText.create),
            ),
          ],
        ),
        body: BlocListener<NotesBloc, NotesState>(
          listener: (context, state) {
            if (state is FoldersData) {
              setState(() {
                getData(state.folders);
              });
            } else if (state is NotesError) {
              // print('error');
            } else if (state is DeleteSucess) {
              setState(() {});
            }
          },
          child: MainBody(
            elements: elements,
            state: state,
          ),
        ));
  }
}
