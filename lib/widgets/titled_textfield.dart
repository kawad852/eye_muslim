import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:flutter/material.dart';

class TitledTextField extends StatelessWidget {
  final String title;
  final Widget child;
  final bool required;

  const TitledTextField({
    super.key,
    required this.title,
    required this.child,
    this.required = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.bodySmall!.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 3),
        child,
        const SizedBox(height: 3),
      ],
    );
  }
}
