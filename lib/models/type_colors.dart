import 'package:flutter/material.dart';

class TypeColors{
  static Map<String, Color> colorMap = {
    'Grass': const Color(0xFF5EBF62),
    'Fire': const Color(0xFFF8A44E),
    'Water': const Color(0xFF559FE1),
    'Poison': const Color(0xFFB564CD),
    'Electric': const Color(0xFFF1D440),
    'Rock': const Color(0xFFC4B589),
    'Ground': const Color(0xFFD98554),
    'Psychic': const Color(0xFFF87C7A),
    'Fighting': const Color(0xFFD94356),
    'Bug': const Color(0xFF9EC334),
    'Ghost': const Color(0xFF696FC8),
    'Ice': const Color(0xFF7ED4C9),
    'Dragon': const Color(0xFF0673C5),
    'Normal': const Color(0xFF9B9EA4),
  };

  static Color getColorForType(String type){
    return colorMap[type] ?? Colors.white10;
  }
}