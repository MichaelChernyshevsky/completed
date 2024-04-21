import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/interface/routes/app_routes.dart';
import 'package:flutter_spotify_ui/interface/screens/generate_screen.dart';
import 'package:flutter_spotify_ui/interface/screens/widgets/container.dart';
import 'package:flutter_spotify_ui/interface/screens/widgets/custom_bottom.dart';
import 'package:flutter_spotify_ui/interface/screens/widgets/delete_buttom.dart';
import 'package:flutter_spotify_ui/interface/screens/widgets/line.dart';
import 'package:flutter_spotify_ui/interface/screens/widgets/text.dart';
import 'package:flutter_spotify_ui/localization/app_localization.dart';
import 'package:flutter_spotify_ui/utils/constants/constants_uikit.dart';
import 'package:flutter_spotify_ui/utils/utils_size.dart';
import 'package:flutter_spotify_ui/models/element_class.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController? _controllerPack;
  TextEditingController? _controllerWord;
  List<CustomElement> packs = [];
  int? indexPack;

  @override
  void initState() {
    _controllerPack = TextEditingController();
    _controllerWord = TextEditingController();

    super.initState();
  }

  void onTapAddPack() {
    if (_controllerPack!.text.isNotEmpty) {
      setState(() {
        packs.add(CustomElement(_controllerPack!.text));
        _controllerPack!.text = '';
      });
    }
  }

  void onTapAddWord() {
    if (_controllerWord!.text.isNotEmpty) {
      setState(() {
        packs[indexPack!].words.add(_controllerWord!.text);
        _controllerWord!.text = '';
      });
    }
  }

  onTapDeletePack(int index) => setState(() {
        packs.removeAt(index);
      });

  onTapDeleteWord(int index) => setState(() {
        packs[indexPack!].words.removeAt(index);
      });

  setPack(int index) => setState(
        () {
          indexPack = index;
          indexPack = index;
        },
      );

  onTapGenerate() {
    if (packs.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GenerateScreen(
            packs: packs,
          ),
        ),
      );
    }
  }

  onTapGoSettings() => Navigator.pushNamed(context, AppRoutes.settingsScreen);

  onTapDispose() => setState(() {
        packs = [];
        indexPack == null;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Container(
              color: UTILSConstants.purple,
              child: Padding(
                padding: getPadding(all: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    CustomContainer(
                      color: Colors.blue,
                      height: 170,
                      widget: Column(
                        children: [
                          CustomText(
                            text: AppLocalizations.current.addPack,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: 400,
                                child:
                                    TextFormField(controller: _controllerPack),
                              ),
                            ],
                          ),
                          Padding(
                            padding: getPadding(top: 10, bottom: 10),
                            child: SizedBox(
                              child: CustomButton(
                                color: UTILSConstants.done,
                                tap: onTapAddPack,
                                text: AppLocalizations.current.add,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    CustomContainer(
                      color: Colors.amber,
                      height: 170,
                      widget: Column(
                        children: [
                          CustomText(
                            text: AppLocalizations.current.addWord,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: 400,
                                child:
                                    TextFormField(controller: _controllerWord),
                              ),
                            ],
                          ),
                          Padding(
                            padding: getPadding(top: 10, bottom: 10),
                            child: SizedBox(
                              child: CustomButton(
                                color: indexPack != null
                                    ? UTILSConstants.done
                                    : UTILSConstants.transparent,
                                tap: onTapAddWord,
                                text: AppLocalizations.current.add,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: getPadding(top: 50, bottom: 20),
                      child: SizedBox(
                        width: 300,
                        child: CustomButton(
                          color: UTILSConstants.undone,
                          tap: onTapDispose,
                          text: AppLocalizations.current.dispose,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: getPadding(top: 20, bottom: 20),
                          child: CustomContainer(
                            color: Colors.pink,
                            paggingAll: 0,
                            widget: IconButton(
                              icon: Icon(
                                Icons.save_alt_outlined,
                                color: Colors.black,
                              ),
                              onPressed: onTapGenerate,
                              color: UTILSConstants.done,
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(top: 20, bottom: 20),
                          child: CustomContainer(
                            color: Colors.grey,
                            paggingAll: 0,
                            widget: IconButton(
                              icon: Icon(
                                Icons.settings,
                                color: Colors.black,
                              ),
                              onPressed: onTapGoSettings,
                              color: UTILSConstants.done,
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(top: 20, bottom: 20),
                          child: CustomButton(
                            color: UTILSConstants.done,
                            tap: onTapGenerate,
                            text: AppLocalizations.current.generate,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          VericalLine(),
          Expanded(
              child: ListView.builder(
            itemCount: packs.length,
            itemBuilder: ((context, index) => Padding(
                  padding: getPadding(all: 10),
                  child: GestureDetector(
                    onTap: () => setPack(index),
                    child: Row(
                      children: [
                        Spacer(),
                        CustomText(text: packs[index].title),
                        Spacer(),
                        Spacer(),
                        CustomText(
                          text: packs[index].words.length.toString(),
                        ),
                        Spacer(),
                        DeleteButton(
                          onTapDelete: () => onTapDeletePack(index),
                        ),
                      ],
                    ),
                  ),
                )),
          )),
          VericalLine(),
          Expanded(
            child: indexPack == null
                ? Center(
                    child:
                        CustomText(text: AppLocalizations.current.emptyColumn),
                  )
                : ListView.builder(
                    itemCount: packs[indexPack!].words.length,
                    itemBuilder: ((context, index) => Padding(
                          padding: getPadding(all: 10),
                          child: Row(
                            children: [
                              CustomText(text: packs[indexPack!].words[index]),
                              Spacer(),
                              DeleteButton(
                                onTapDelete: () => onTapDeleteWord(index),
                              ),
                            ],
                          ),
                        )),
                  ),
          ),
        ],
      ),
    );
  }
}
