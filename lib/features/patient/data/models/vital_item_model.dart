import 'package:flutter/material.dart';

class VitalItemModel {
  final String label;
  final String value;
  final String unit;
  final String timestamp;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final VoidCallback? onTap;

  const VitalItemModel({
    required this.label,
    required this.value,
    required this.unit,
    required this.timestamp,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    this.onTap,
  });
}
