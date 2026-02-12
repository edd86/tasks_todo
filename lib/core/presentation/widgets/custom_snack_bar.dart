import 'package:flutter/material.dart';

class CustomSnackBar extends SnackBar {
  CustomSnackBar({
    super.key,
    required String message,
    required BuildContext context,
  }) : super(
         content: Text(message),
         backgroundColor: Theme.of(context).colorScheme.primary,
       );
}
