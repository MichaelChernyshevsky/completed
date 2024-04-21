// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/core/generate.dart';
import 'package:flutter_spotify_ui/core/save.dart';
import 'package:flutter_spotify_ui/interface/screens/result_screen.dart';
import 'package:flutter_spotify_ui/interface/screens/widgets/container.dart';
import 'package:flutter_spotify_ui/interface/screens/widgets/custom_bottom.dart';
import 'package:flutter_spotify_ui/interface/screens/widgets/line.dart';
import 'package:flutter_spotify_ui/localization/app_localization.dart';
import 'package:flutter_spotify_ui/models/element_class.dart';
import 'package:flutter_spotify_ui/utils/constants/constants_uikit.dart';
import 'package:flutter_spotify_ui/utils/utils_size.dart';

class GenerateScreen extends StatefulWidget {
  GenerateScreen({super.key, required this.packs});

  List<CustomElement> packs;

  @override
  State<GenerateScreen> createState() => _GenerateScreenState();
}

class _GenerateScreenState extends State<GenerateScreen> {
  void goBack() => Navigator.pop(context);

  void onTapGoToResult() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReslutScreen(
          result: getVariantsFromPacks(
              widget.packs.where((element) => !element.isHidden).toList()),
        ),
      ),
    );
  }

  void onTapExport() => save(packs: widget.packs);

  void updateList({required int newIndex, required int oldIndex}) =>
      setState(() {
        if (oldIndex < newIndex) {
          newIndex--;
        }

        final pach = widget.packs.removeAt(oldIndex);
        widget.packs.insert(newIndex, pach);
      });

  void onTapHidden({required int index}) {
    print(widget.packs[index].isHidden);

    setState(() {
      widget.packs[index].isHidden = !widget.packs[index].isHidden;
    });
    print(widget.packs[index].isHidden);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: size.width * 0.2,
            child: Container(
              color: UTILSConstants.purple,
              child: Column(
                children: [
                  Padding(
                    padding: getPadding(all: 10),
                    child: CustomButton(
                      tap: goBack,
                      color: UTILSConstants.undone,
                      text: AppLocalizations.current.goBack,
                    ),
                  ),
                  Padding(
                    padding: getPadding(all: 10),
                    child: CustomButton(
                      tap: onTapExport,
                      color: UTILSConstants.done,
                      text: AppLocalizations.current.export,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: getPadding(all: 10),
                    child: CustomButton(
                      tap: onTapGoToResult,
                      color: UTILSConstants.done,
                      text: AppLocalizations.current.result,
                    ),
                  ),
                ],
              ),
            ),
          ),
          VericalLine(),
          Expanded(
            child: Padding(
              padding: getPadding(all: 40),
              child: ReorderableListView.builder(
                itemBuilder: ((context, index) => Row(
                      key: ValueKey(widget.packs[index]),
                      children: [
                        Text(
                          widget.packs[index].title,
                        ),
                        Spacer(),
                        Spacer(),
                        Padding(
                          padding: getPadding(top: 20, bottom: 20),
                          child: CustomContainer(
                            color: Colors.grey,
                            paggingAll: 0,
                            widget: IconButton(
                              icon: Icon(
                                Icons.remove_red_eye_outlined,
                                color: widget.packs[index].isHidden
                                    ? UTILSConstants.undone
                                    : UTILSConstants.done,
                              ),
                              onPressed: () => onTapHidden(index: index),
                              color: UTILSConstants.done,
                            ),
                          ),
                        ),
                        Spacer(),
                      ],
                    )),
                itemCount: widget.packs.length,
                onReorder: ((oldIndex, newIndex) =>
                    updateList(newIndex: newIndex, oldIndex: oldIndex)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
