import 'package:flutter/material.dart';

mixin TabHomeMixin<T extends StatefulWidget> on State<T> {
  // ignore: unused_field
  int counter = 0;
  @override
  void initState() {
    super.initState();
  }

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }
}
