import 'package:flutter/material.dart';
import '../../../shared/user_profile/views/customer_profile/profile_screen.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.imageLink,
    required this.label,
    this.backgroundColor,
    required this.onTap,
  });

  final String imageLink;
  final String label;
  final Color? backgroundColor;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: backgroundColor ?? Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: SizedBox(
                width: 60,
                height: 60,
                child: ClipOval(
                  child: NetworkImageWithLoader(imageLink, fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
