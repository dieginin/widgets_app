import 'package:flutter/material.dart';

const List<Map<String, dynamic>> colorList = [
  {'name': 'Blue', 'color': Colors.blue},
  {'name': 'Lime', 'color': Colors.lime},
  {'name': 'Teal', 'color': Colors.teal},
  {'name': 'Green', 'color': Colors.green},
  {'name': 'Red', 'color': Colors.red},
  {'name': 'Purple', 'color': Colors.purple},
  {'name': 'Deep Purple', 'color': Colors.deepPurple},
  {'name': 'Orange', 'color': Colors.orange},
  {'name': 'Pink', 'color': Colors.pink},
  {'name': 'Pink Accent', 'color': Colors.pinkAccent},
];

class AppTheme {
  AppTheme({
    this.isDarkmode = false,
    this.selectedColor = 0,
  })  : assert(selectedColor >= 0, 'Selected color must be greater then 0'),
        assert(selectedColor < colorList.length, 'Selected color must be less or equal than ${colorList.length - 1}');

  final bool isDarkmode;
  final int selectedColor;

  AppTheme copyWith({
    bool? isDarkmode,
    int? selectedColor,
  }) =>
      AppTheme(
        selectedColor: selectedColor ?? this.selectedColor,
        isDarkmode: isDarkmode ?? this.isDarkmode,
      );

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      brightness: isDarkmode ? Brightness.dark : Brightness.light,
      colorSchemeSeed: colorList[selectedColor]['color'] as Color,
      appBarTheme: const AppBarTheme(
        centerTitle: false,
      ));
}
