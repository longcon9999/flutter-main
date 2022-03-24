import 'package:flutter/material.dart';
import 'package:homework/theme/themes.dart';

final ButtonStyle flatButtonStyle = TextButton.styleFrom(
  primary: primaryColor.withOpacity(0.5),
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(2),
    ),
  ),
);

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.white30,
  primary: primaryColor,
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(2),
    ),
  ),
);

final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
  primary: primaryColor.withOpacity(0.5),
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(2),
    ),
  ),
  side: const BorderSide(
    width: 2,
    color: primaryColor,
  ),
);
