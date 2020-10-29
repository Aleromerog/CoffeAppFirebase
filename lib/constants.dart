import 'package:flutter/material.dart';

const kTextInputDecorator = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(color: Colors.white, width: 2, )
  ),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(25)),

      borderSide: BorderSide(color: Colors.pink, width: 2)
  ),
  focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(25)),

      borderSide: BorderSide(color: Colors.red, width: 2)
  ),
  errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(25)),

      borderSide: BorderSide(color: Colors.red, width: 1)
  ),
);