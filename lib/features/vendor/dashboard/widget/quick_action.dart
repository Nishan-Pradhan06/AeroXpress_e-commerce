// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:phosphor_flutter/phosphor_flutter.dart';
// import '../../../../core/theme/app_theme.dart';
// import 'dashboard_card.dart';

// class EvQuickActions extends StatelessWidget {
//   const EvQuickActions({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final actions = [
//       _ActionData(
//         title: 'Add Product',
//         description: 'Add a new product to your inventory',
//         icon: PhosphorIconsRegular.plus,
//         color: AppColors.success,
//         onTap: () {},
//       ),
//       _ActionData(
//         title: 'Process Order',
//         description: 'Update order status and tracking',
//         icon: PhosphorIconsRegular.shoppingCart,
//         color: AppColors.info,
//         onTap: () {},
//       ),
//       _ActionData(
//         title: 'View Analytics',
//         description: 'Check sales performance and trends',
//         icon: PhosphorIconsRegular.chartLine,
//         color: AppTheme.primaryPurple,
//         onTap: () {},
//       ),
//       _ActionData(
//         title: 'Manage Inventory',
//         description: 'Update stock levels and pricing',
//         icon: PhosphorIconsRegular.package,
//         color: AppColors.warning,
//         onTap: () {},
//       ),
//       _ActionData(
//         title: 'Customer Support',
//         description: 'Respond to customer inquiries',
//         icon: PhosphorIconsRegular.chatCircle,
//         color: AppColors.orange500,
//         onTap: () {},
//       ),
//       _ActionData(
//         title: 'Store Settings',
//         description: 'Configure store preferences',
//         icon: PhosphorIconsRegular.gear,
//         color: AppColors.purple500,
//         onTap: () {},
//       ),
//     ];

//     return EvDashboardCard(
//       title: 'Quick Actions',
//       icon: PhosphorIconsRegular.lightning,
//       iconColor: AppColors.warning,
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//           final isWide = constraints.maxWidth > 600;
//           final crossAxisCount = isWide ? 3 : 2;

//           return GridView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: crossAxisCount,
//               crossAxisSpacing: 12,
//               mainAxisSpacing: 12,
//               childAspectRatio: isWide ? 1.4 : 1.6,
//             ),
//             itemCount: actions.length,
//             itemBuilder: (context, index) {
//               return _buildActionCard(context, actions[index])
//                   .animate(delay: (index * 80).ms)
//                   .fadeIn(duration: 400.ms)
//                   .scale(
//                     begin: const Offset(0.8, 0.8),
//                     end: const Offset(1, 1),
//                   );
//             },
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildActionCard(BuildContext context, _ActionData action) {
//     return InkWell(
//       onTap: action.onTap,
//       borderRadius: BorderRadius.circular(12),
//       child: Container(
//         decoration: BoxDecoration(
//           color: action.color.withOpacity(0.05),
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: action.color.withOpacity(0.2), width: 1),
//         ),
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: action.color.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Icon(action.icon, size: 20, color: action.color),
//             ),

//             const Gap(12),

//             Text(
//               action.title,
//               style: Theme.of(context).textTheme.labelLarge?.copyWith(
//                 fontWeight: FontWeight.w600,
//                 color: action.color,
//               ),
//             ),

//             const Gap(4),

//             Expanded(
//               child: Text(
//                 action.description,
//                 style: Theme.of(
//                   context,
//                 ).textTheme.bodySmall?.copyWith(height: 1.3),
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _ActionData {
//   final String title;
//   final String description;
//   final IconData icon;
//   final Color color;
//   final VoidCallback onTap;

//   const _ActionData({
//     required this.title,
//     required this.description,
//     required this.icon,
//     required this.color,
//     required this.onTap,
//   });
// }
