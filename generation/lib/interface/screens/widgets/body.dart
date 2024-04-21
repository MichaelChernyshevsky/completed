// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/utils/utils_size.dart';

class Body extends StatefulWidget {
  Body({
    super.key,
    required this.widget,
    this.appBar,
  });
  Widget widget;
  AppBar? appBar;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    if (widget.appBar != null) {
      return Scaffold(
        appBar: widget.appBar,
        body: Padding(
          padding: getPadding(
            right: 10,
            left: 10,
          ),
          child: widget.widget,
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: getPadding(
            right: 10,
            left: 10,
          ),
          child: widget.widget,
        ),
      ),
    );
  }
}
