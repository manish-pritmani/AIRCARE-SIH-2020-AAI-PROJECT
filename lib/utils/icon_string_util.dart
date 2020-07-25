import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'room_service': Icons.room_service,
  'flight': Icons.flight,
  'restaurant': Icons.restaurant,
  'apps': Icons.apps,
  'wifi': Icons.wifi,
  'ac_unit': Icons.ac_unit,
  'pool': Icons.pool
};

Icon getIcon(String name, Color color) {
  return Icon(
    _icons[name],
    color: color,
    size: 36.0,
  );
}
