// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:deal_sell/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}


                // Vouchers Section
                // Container(
                //   color: Colors.white,
                //   padding: const EdgeInsets.all(16),
                //   child: Row(
                //     children: [
                //       Container(
                //         padding: const EdgeInsets.all(8),
                //         decoration: BoxDecoration(
                //           color: Colors.red,
                //           borderRadius: BorderRadius.circular(4),
                //         ),
                //         child: const Text("🎫", style: TextStyle(fontSize: 16)),
                //       ),
                //       const SizedBox(width: 12),
                //       const Text(
                //         "Vouchers",
                //         style: TextStyle(
                //           fontSize: 16,
                //           fontWeight: FontWeight.w500,
                //         ),
                //       ),
                //       const Spacer(),
                //       const Text(
                //         "Applied",
                //         style: TextStyle(color: Colors.grey),
                //       ),
                //       const SizedBox(width: 4),
                //       const Icon(Icons.chevron_right, color: Colors.grey),
                //     ],
                //   ),
                // ),




                
  // Widget _buildShippingMethodCard(ThemeData theme) {
  //   return CustomCard(
  //     child: Padding(
  //       padding: const EdgeInsets.all(16),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text('Shipping Method', style: theme.textTheme.titleMedium),
  //           const SizedBox(height: 16),
  //           BlocBuilder<ShippingOptionsBloc, ShippingOptionsState>(
  //             builder: (context, state) {
  //               return state.when(
  //                 initial:
  //                     () => const Center(child: CircularProgressIndicator()),
  //                 loading:
  //                     () => const Center(child: CircularProgressIndicator()),
  //                 failure: (failure) => Text('Error: ${failure.message}'),
  //                 loaded: (options) {
  //                   final currentSelection =
  //                       selectedShippingMethod.isEmpty && options.isNotEmpty
  //                           ? options.first.name
  //                           : selectedShippingMethod;

  //                   return Column(
  //                     children:
  //                         options
  //                             .map(
  //                               (option) => Padding(
  //                                 padding: const EdgeInsets.only(bottom: 12),
  //                                 child: _buildShippingOption(
  //                                   theme,
  //                                   option.name, // used as value
  //                                   option.name,
  //                                   '${option.description} • ${option.estimatedDays} days',
  //                                   'Rs.${option.fee}',
  //                                   currentSelection,
  //                                 ),
  //                               ),
  //                             )
  //                             .toList(),
  //                   );
  //                 },
  //               );
  //             },
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildShippingOption(
  //   ThemeData theme,
  //   String value,
  //   String title,
  //   String description,
  //   String price,
  //   String currentSelection, // Add this parameter
  // ) {
  //   final isSelected = currentSelection == value;
  //   return Container(
  //     decoration: BoxDecoration(
  //       border: Border.all(
  //         color: isSelected ? theme.colorScheme.primary : theme.dividerColor,
  //         width: isSelected ? 2 : 1,
  //       ),
  //       borderRadius: BorderRadius.circular(8),
  //     ),
  //     child: RadioListTile<String>(
  //       value: value,
  //       groupValue: currentSelection,
  //       onChanged: (String? newValue) {
  //         setState(() {
  //           selectedShippingMethod = newValue!;
  //         });
  //       },
  //       title: Text(
  //         title,
  //         style: theme.textTheme.bodyLarge?.copyWith(
  //           fontWeight: FontWeight.w600,
  //         ),
  //       ),
  //       subtitle: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(description, style: theme.textTheme.bodySmall),
  //           Text(price, style: theme.textTheme.labelLarge),
  //         ],
  //       ),
  //       activeColor: theme.colorScheme.primary,
  //       contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  //     ),
  //   );
  // }