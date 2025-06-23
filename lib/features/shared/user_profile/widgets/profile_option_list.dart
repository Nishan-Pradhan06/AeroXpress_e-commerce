
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

Widget buildProfileOption(
  String title,
  IconData icon, {
  bool showDivider = false,
  Function()? onTap,
}) {
  return Column(
    children: [
      ListTile(
        leading: Icon(icon, size: 18),
        title: Text(title),
        trailing: Icon(LucideIcons.chevronRight),
        onTap: onTap,
      ),
      if (showDivider) Divider(height: 1),
    ],
  );
}
