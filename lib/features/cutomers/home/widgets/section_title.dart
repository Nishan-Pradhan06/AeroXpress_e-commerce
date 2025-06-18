import 'package:flutter/material.dart';
import '../../../../core/widget/padding.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title, required this.onTap});

  final String title;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomPadding(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          TextButton(
            onPressed: onTap,
            style: TextButton.styleFrom(foregroundColor: Colors.grey),
            child: const Text("See more"),
          ),
        ],
      ),
    );
  }
}
