import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/interface/routes/app_routes.dart';
import 'package:flutter_spotify_ui/interface/screens/widgets/custom_bottom.dart';
import 'package:flutter_spotify_ui/interface/screens/widgets/line.dart';
import 'package:flutter_spotify_ui/localization/app_localization.dart';
import 'package:flutter_spotify_ui/utils/constants/constants_uikit.dart';
import 'package:flutter_spotify_ui/utils/utils_size.dart';

class ReslutScreen extends StatefulWidget {
  const ReslutScreen({super.key, required this.result});

  final List<String> result;

  @override
  State<ReslutScreen> createState() => _ReslutScreenState();
}

class _ReslutScreenState extends State<ReslutScreen> {
  void goBack() => Navigator.pop(context);

  void onTapGoMainPage() =>
      Navigator.popUntil(context, ModalRoute.withName(AppRoutes.mainScreen));

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
                      tap: onTapGoMainPage,
                      color: UTILSConstants.done,
                      text: AppLocalizations.current.goMainPAge,
                    ),
                  ),
                ],
              ),
            ),
          ),
          VericalLine(),
          Expanded(
              child: Center(child: SelectableText(widget.result.join('\n'))))
        ],
      ),
    );
  }
}
