import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/interface/screens/widgets/custom_bottom.dart';
import 'package:flutter_spotify_ui/localization/app_localization.dart';
import 'package:flutter_spotify_ui/utils/constants/constants_uikit.dart';

class DeleteButton extends StatelessWidget {
  DeleteButton({super.key, required this.onTapDelete});
  final VoidCallback onTapDelete;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      color: UTILSConstants.undone,
      tap: onTapDelete,
      text: AppLocalizations.current.delete,
    );
  }
}
