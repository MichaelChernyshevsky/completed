import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/interface/screens/widgets/custom_bottom.dart';
import 'package:flutter_spotify_ui/interface/screens/widgets/line.dart';
import 'package:flutter_spotify_ui/localization/app_localization.dart';
import 'package:flutter_spotify_ui/utils/constants/constants_uikit.dart';
import 'package:flutter_spotify_ui/utils/utils_size.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void goBack() => Navigator.pop(context);

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
                  Spacer(),
                ],
              ),
            ),
          ),
          VericalLine(),
          // Expanded(
          //     child: Center(child: SelectableText(widget.result.join('\n'))))
        ],
      ),
    );
  }
}
