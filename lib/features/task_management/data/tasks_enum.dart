import 'package:flutter/material.dart';

enum CategoriesEnum {
  work(label: 'Work', icon: Icons.work),
  personal(label: 'Personal', icon: Icons.person),
  health(label: 'Health', icon: Icons.favorite);

  final String label;
  final IconData icon;

  const CategoriesEnum({required this.label, required this.icon});
}
