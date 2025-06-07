import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EvDashboardCard extends StatelessWidget {
  final String title;
  final Widget child;
  final IconData? icon;
  final Color? iconColor;
  final Widget? trailing;
  final EdgeInsets? padding;
  final VoidCallback? onTap;

  const EvDashboardCard({
    super.key,
    required this.title,
    required this.child,
    this.icon,
    this.iconColor,
    this.trailing,
    this.padding,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: double.infinity,
          padding: padding ?? const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  if (icon != null) ...[
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: (iconColor ??
                                Theme.of(context).colorScheme.primary)
                            .withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        icon,
                        size: 20,
                        color:
                            iconColor ?? Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const Gap(12),
                  ],

                  Expanded(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),

                  if (trailing != null) trailing!,
                ],
              ),

              const Gap(20),

              // Content
              child,
            ],
          ),
        ),
      ),
    );
  }
}
