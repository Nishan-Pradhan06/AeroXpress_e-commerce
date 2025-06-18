import 'package:deal_sell/core/theme/app_theme.dart';
import 'package:deal_sell/core/widget/padding.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ContactTabScreen extends StatelessWidget {
  const ContactTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPadding(
      top: AppTheme.space2,
      child: Column(
        spacing: AppTheme.space2,
        children: [
          ShadCard(
            backgroundColor: Colors.blue,
            child: Row(
              spacing: AppTheme.space2,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(LucideIcons.facebook, size: 18, color: Colors.white),
                Text(
                  'Facebook',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
