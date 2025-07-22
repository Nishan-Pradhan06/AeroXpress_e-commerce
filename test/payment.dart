// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:developer';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:khalti_checkout_flutter/khalti_checkout_flutter.dart';

// import 'package:deal_sell/core/utils/app_loading_dialogs.dart';
// import 'package:deal_sell/core/widget/custom_button.dart';
// import 'package:deal_sell/core/widget/custom_toast.dart';
// import 'package:deal_sell/features/cutomers/cart/bloc/delete_cart/delete_cart_bloc.dart';
// import 'package:deal_sell/features/shared/payments/bloc/khalti_paymenet_initiate_bloc.dart';
// import 'package:deal_sell/routes/app_route_names.dart';

// import '../../../core/constant/api.dart';
// import '../../../core/widget/custom_card.dart';
// import '../../cutomers/cart/bloc/get_cart/get_cart_bloc.dart';
// import '../orders/bloc/create_orders/create_orders_bloc.dart';

// class CheckoutScreen extends StatefulWidget {
//   const CheckoutScreen({super.key});

//   @override
//   State<CheckoutScreen> createState() => _CheckoutScreenState();
// }

// class _CheckoutScreenState extends State<CheckoutScreen> {
//   String selectedPaymentMethod = 'KHALTI';

//   final _formKey = GlobalKey<FormState>();

//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _streetController = TextEditingController();
//   final TextEditingController _cityController = TextEditingController();
//   final TextEditingController _stateController = TextEditingController();
//   final TextEditingController _postalCodeController = TextEditingController();
//   final TextEditingController _countryController = TextEditingController();

//   late final Future<Khalti?> khalti;

//   final KhaltiPaymentState state;

//   late String pidx;

//   PaymentResult? paymentResult;

//   @override
//   void initState() {
//     super.initState();
//     pidx = state.pidx;
//     final payConfig = KhaltiPayConfig(
//       publicKey: '082dd5258935429582e20776f2f4b24e',
//       pidx: pidx,
//       environment: Environment.test,
//     );

//     khalti = Khalti.init(
//       enableDebugging: true,
//       payConfig: payConfig,
//       onPaymentResult: (paymentResult, khalti) {
//         log(paymentResult.toString());
//         setState(() {
//           this.paymentResult = paymentResult;
//         });
//         khalti.close(context);
//       },
//       onMessage: (
//         khalti, {
//         description,
//         statusCode,
//         event,
//         needsPaymentConfirmation,
//       }) async {
//         log(
//           'Description: $description, Status Code: $statusCode, Event: $event, NeedsPaymentConfirmation: $needsPaymentConfirmation',
//         );
//         khalti.close(context);
//       },
//       onReturn: () => log('Successfully redirected to return_url.'),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return MultiBlocListener(
//       listeners: [
//         BlocListener<CreateOrdersBloc, CreateOrdersState>(
//           listener: (context, state) {
//             state.whenOrNull(
//               loading: () => AppLoadingDialog.show(context),
//               loaded: (message) {
//                 AppLoadingDialog.hide(context);
//                 if (selectedPaymentMethod == "KHALTI") {
//                   ///message is the order ID
//                   context.read<KhaltiPaymenetInitiateBloc>().add(
//                     KhaltiPaymenetInitiateEvent.initiate(int.parse(message)),
//                   );

//                   return;
//                 }
//                 CustomToast.showSuccess("Successfully placed order");

//                 context.pushReplacementNamed(AppRoutesName.allOrders);
//                 context.read<DeleteCartBloc>().add(
//                   DeleteCartEvent.deleteCart(),
//                 );
//                 context.read<GetCartBloc>().add(GetCartEvent.getCart());
//               },
//               failure: (failure) {
//                 AppLoadingDialog.hide(context);

//                 CustomToast.showError(failure.message);
//               },
//             );
//           },
//         ),
//         BlocListener<KhaltiPaymenetInitiateBloc, KhaltiPaymenetInitiateState>(
//           listener: (context, state) {
//             state.whenOrNull(
//               loading: () => AppLoadingDialog.show(context),
//               loaded: (khaltiPaymentState) {
//                final khaltiSnapshot = snapshot.data;
//                 AppLoadingDialog.hide(context);

//                 khaltiSnapshot.open(context);
//                 // Navigator.of(context).push(
//                 //   MaterialPageRoute(
//                 //     builder:
//                 //         (context) => KhaltiSDKDemo(state: khaltiPaymentState),
//                 //   ),
//                 // );
//               },
//               failure: (failure) {
//                 AppLoadingDialog.hide(context);
//                 CustomToast.showError(failure.message);
//               },
//             );
//           },
//         ),
//       ],
//       child: Scaffold(
//         backgroundColor: theme.colorScheme.background,
//         appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(kToolbarHeight),
//           child: Material(
//             elevation: 0.1,
//             color: Colors.white,
//             child: AppBar(
//               scrolledUnderElevation: 0,
//               backgroundColor: Colors.white,
//               elevation: 0,
//               title: const Text(
//                 "Checkout",
//                 style: TextStyle(color: Colors.black),
//               ),
//             ),
//           ),
//         ),
//         body: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(vertical: 10),
//           child: Column(
//             children: [
//               _buildOrderSummaryCard(context, theme),
//               _buildShippingAddressCard(theme),
//               _buildPaymentMethodCard(theme),
//             ],
//           ),
//         ),
//         bottomNavigationBar: Container(
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: theme.colorScheme.surface,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.1),
//                 blurRadius: 10,
//                 offset: Offset(0, -5),
//               ),
//             ],
//           ),
//           child: SafeArea(
//             child: CustomButtonPrimary(
//               height: 40,
//               onPressed: () async {
//                 if (_formKey.currentState!.validate()) {
//                   _createOrder();
//                 }
//               },
//               title: 'Place Order',
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _createOrder() {
//     final shippingAddress = {
//       "recipientName": _nameController.text,
//       "phone": _phoneController.text,
//       "street": _streetController.text,
//       "city": _cityController.text,
//       "state": _stateController.text,
//       "postalCode": _postalCodeController.text,
//       "country": _countryController.text,
//     };

//     final cartState = context.read<GetCartBloc>().state;

//     cartState.maybeWhen(
//       loaded: (cartData) {
//         final items =
//             cartData.items
//                 .map(
//                   (item) => {
//                     "productId": item.product.id,
//                     "quantity": item.quantity,
//                   },
//                 )
//                 .toList();

//         final payload = {
//           "items": items,
//           "paymentMethod": selectedPaymentMethod,
//           "customerNote": "",
//           "shippingAddress": shippingAddress,
//         };

//         if (selectedPaymentMethod == "COD") {
//           context.read<CreateOrdersBloc>().add(
//             CreateOrdersEvent.createOrderWithCashOnDelivery(payload: payload),
//           );
//         } else if (selectedPaymentMethod == "KHALTI") {
//           context.read<CreateOrdersBloc>().add(
//             CreateOrdersEvent.createORderWithKhalti(payload: payload),
//           );
//         }
//       },
//       orElse: () {
//         debugPrint("Cart not loaded yet or some other state is active.");
//       },
//     );
//   }

//   Widget _buildOrderSummaryCard(BuildContext context, ThemeData theme) {
//     return BlocBuilder<GetCartBloc, GetCartState>(
//       builder: (context, state) {
//         return state.when(
//           initial: () => const Center(child: CircularProgressIndicator()),
//           loading: () => const Center(child: CircularProgressIndicator()),
//           failure:
//               (failure) => Center(child: Text('Failed: ${failure.message}')),
//           loaded: (cart) {
//             final summary = cart.summary;

//             return CustomCard(
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Order Summary', style: theme.textTheme.titleMedium),
//                     const SizedBox(height: 16),
//                     ...cart.items.map((item) {
//                       return Padding(
//                         padding: const EdgeInsets.only(bottom: 16),
//                         child: Row(
//                           children: [
//                             Container(
//                               width: 60,
//                               height: 60,
//                               decoration: BoxDecoration(
//                                 color: theme.colorScheme.primary.withOpacity(
//                                   0.1,
//                                 ),
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               child:
//                                   item.product.vendor?.logo != null
//                                       ? ClipRRect(
//                                         borderRadius: BorderRadius.circular(8),
//                                         child: CachedNetworkImage(
//                                           imageUrl:
//                                               'http://$LOCAL_IP:5000${item.product.vendor!.logo}',
//                                           fit: BoxFit.cover,
//                                           placeholder:
//                                               (context, url) => const Center(
//                                                 child: SizedBox(
//                                                   width: 16,
//                                                   height: 16,
//                                                   child:
//                                                       CircularProgressIndicator(
//                                                         strokeWidth: 2,
//                                                       ),
//                                                 ),
//                                               ),
//                                           errorWidget:
//                                               (context, url, error) =>
//                                                   const Icon(
//                                                     Icons.image_outlined,
//                                                     size: 30,
//                                                     color: Colors.grey,
//                                                   ),
//                                         ),
//                                       )
//                                       : const Icon(
//                                         Icons.image_outlined,
//                                         size: 30,
//                                         color: Colors.grey,
//                                       ),
//                             ),
//                             const SizedBox(width: 12),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     item.product.name,
//                                     style: theme.textTheme.bodyLarge?.copyWith(
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 4),
//                                   Text(
//                                     'x${item.quantity}',
//                                     style: theme.textTheme.bodyMedium,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Text(
//                               'Rs.${(double.tryParse(item.product.price ?? '0') ?? 0) * item.quantity}',
//                               style: theme.textTheme.bodyLarge?.copyWith(
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     }),
//                     const SizedBox(height: 8),
//                     Divider(color: theme.dividerColor),
//                     const SizedBox(height: 16),
//                     _buildOrderRow('Subtotal', 'Rs.${summary.subtotal}', theme),
//                     const SizedBox(height: 8),
//                     _buildOrderRow(
//                       'Shipping',
//                       'Rs.${summary.shippingFee}',
//                       theme,
//                     ),
//                     const SizedBox(height: 8),
//                     _buildOrderRow('Tax', 'Rs.${summary.taxAmount}', theme),
//                     const SizedBox(height: 8),
//                     _buildOrderRow(
//                       'Discount',
//                       '- Rs.${summary.discountAmount}',
//                       theme,
//                     ),
//                     const SizedBox(height: 12),
//                     Divider(color: theme.dividerColor),
//                     const SizedBox(height: 12),
//                     _buildOrderRow(
//                       'Total',
//                       'Rs.${summary.total}',
//                       theme,
//                       isTotal: true,
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   Widget _buildOrderRow(
//     String label,
//     String amount,
//     ThemeData theme, {
//     bool isTotal = false,
//   }) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           label,
//           style:
//               isTotal ? theme.textTheme.titleSmall : theme.textTheme.bodyLarge,
//         ),
//         Text(
//           amount,
//           style: (isTotal
//                   ? theme.textTheme.titleSmall?.copyWith(
//                     color: theme.colorScheme.primary,
//                   )
//                   : theme.textTheme.bodyLarge)
//               ?.copyWith(
//                 fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
//               ),
//         ),
//       ],
//     );
//   }

//   Widget _buildShippingAddressCard(ThemeData theme) {
//     return CustomCard(
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Shipping Address', style: theme.textTheme.titleMedium),
//               const SizedBox(height: 16),
//               Row(
//                 children: [
//                   Expanded(
//                     child: _buildTextField(
//                       theme,
//                       _nameController,
//                       'Recipient Name',
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: _buildTextField(theme, _phoneController, 'Phone'),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 children: [
//                   Expanded(
//                     child: _buildTextField(theme, _streetController, 'Street'),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: _buildTextField(theme, _cityController, 'City'),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 children: [
//                   Expanded(
//                     child: _buildTextField(theme, _stateController, 'State'),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: _buildTextField(
//                       theme,
//                       _postalCodeController,
//                       'Postal Code',
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               _buildTextField(theme, _countryController, 'Country'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(
//     ThemeData theme,
//     TextEditingController controller,
//     String label,
//   ) {
//     return TextFormField(
//       controller: controller,
//       validator: (value) => value == null || value.isEmpty ? 'Required' : null,
//       decoration: InputDecoration(labelText: label),
//     );
//   }

//   Widget _buildPaymentMethodCard(ThemeData theme) {
//     return CustomCard(
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Payment Method', style: theme.textTheme.titleMedium),
//             const SizedBox(height: 16),
//             _buildPaymentOption(
//               theme,
//               'KHALTI',
//               'Khalti',
//               'Pay with Khalti wallet',
//               Icons.account_balance_wallet,
//             ),

//             const SizedBox(height: 12),
//             _buildPaymentOption(
//               theme,
//               'COD',
//               'Cash on Delivery',
//               'Pay with cash on delivery',
//               Icons.money,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildPaymentOption(
//     ThemeData theme,
//     String value,
//     String title,
//     String description,
//     IconData icon,
//   ) {
//     final isSelected = selectedPaymentMethod == value;
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: isSelected ? theme.colorScheme.primary : theme.dividerColor,
//           width: isSelected ? 2 : 1,
//         ),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: RadioListTile<String>(
//         value: value,
//         groupValue: selectedPaymentMethod,
//         onChanged: (String? newValue) {
//           setState(() {
//             selectedPaymentMethod = newValue!;
//             selectedPaymentMethod.toUpperCase();
//           });
//         },
//         title: Row(
//           children: [
//             Icon(icon, color: theme.iconTheme.color, size: 20),
//             const SizedBox(width: 8),
//             Text(
//               title,
//               style: theme.textTheme.bodyLarge?.copyWith(
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ],
//         ),
//         subtitle: Text(description, style: theme.textTheme.bodySmall),
//         activeColor: theme.colorScheme.primary,
//         contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//       ),
//     );
//   }

//   // void _placeOrder() {
//   //   showDialog(
//   //     context: context,
//   //     builder: (BuildContext context) {
//   //       return AlertDialog(
//   //         title: Text('Order Placed Successfully!'),
//   //         content: Text(
//   //           'Your order has been placed and will be processed soon.',
//   //         ),
//   //         actions: [
//   //           TextButton(
//   //             onPressed: () {
//   //               Navigator.of(context).pop();
//   //             },
//   //             child: Text('OK'),
//   //           ),
//   //         ],
//   //       );
//   //     },
//   //   );
//   // }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _phoneController.dispose();
//     _streetController.dispose();
//     _cityController.dispose();
//     _stateController.dispose();
//     _postalCodeController.dispose();
//     _countryController.dispose();
//     super.dispose();
//   }
// }

// // class KhaltiSDKDemo extends StatefulWidget {
// //   const KhaltiSDKDemo({Key? key, required this.state}) : super(key: key);
// //   final KhaltiPaymentState state;

// //   @override
// //   State<KhaltiSDKDemo> createState() => _KhaltiSDKDemoState();
// // }

// // class _KhaltiSDKDemoState extends State<KhaltiSDKDemo> {
// //   late final Future<Khalti?> khalti;

// //   late String pidx;

// //   PaymentResult? paymentResult;

// //   @override
// //   void initState() {
// //     super.initState();
// //     pidx = widget.state.pidx;
// //     final payConfig = KhaltiPayConfig(
// //       publicKey: '082dd5258935429582e20776f2f4b24e',
// //       pidx: pidx,
// //       environment: Environment.test,
// //     );

// //     khalti = Khalti.init(
// //       enableDebugging: true,
// //       payConfig: payConfig,
// //       onPaymentResult: (paymentResult, khalti) {
// //         log(paymentResult.toString());
// //         setState(() {
// //           this.paymentResult = paymentResult;
// //         });
// //         khalti.close(context);
// //       },
// //       onMessage: (
// //         khalti, {
// //         description,
// //         statusCode,
// //         event,
// //         needsPaymentConfirmation,
// //       }) async {
// //         log(
// //           'Description: $description, Status Code: $statusCode, Event: $event, NeedsPaymentConfirmation: $needsPaymentConfirmation',
// //         );
// //         khalti.close(context);
// //       },
// //       onReturn: () => log('Successfully redirected to return_url.'),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: FutureBuilder(
// //           future: khalti,
// //           initialData: null,
// //           builder: (context, snapshot) {
// //             final khaltiSnapshot = snapshot.data;
// //             if (khaltiSnapshot == null) {
// //               return const CircularProgressIndicator.adaptive();
// //             }
// //             return Column(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 Image.asset('assets/seru.png', height: 200, width: 200),
// //                 const SizedBox(height: 120),
// //                 const Text('Rs. 22', style: TextStyle(fontSize: 25)),
// //                 const Text('1 day fee'),
// //                 OutlinedButton(
// //                   onPressed: () => khaltiSnapshot.open(context),
// //                   child: const Text('Pay with Khalti'),
// //                 ),
// //                 const SizedBox(height: 120),
// //                 paymentResult == null
// //                     ? Text('pidx: $pidx', style: const TextStyle(fontSize: 15))
// //                     : Column(
// //                       children: [
// //                         Text('pidx: ${paymentResult!.payload?.pidx}'),
// //                         Text('Status: ${paymentResult!.payload?.status}'),
// //                         Text(
// //                           'Amount Paid: ${paymentResult!.payload?.totalAmount}',
// //                         ),
// //                         Text(
// //                           'Transaction ID: ${paymentResult!.payload?.transactionId}',
// //                         ),
// //                       ],
// //                     ),
// //                 const SizedBox(height: 120),
// //                 const Text(
// //                   'This is a demo application developed by some merchant.',
// //                   style: TextStyle(fontSize: 12),
// //                 ),
// //               ],
// //             );
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }

// ignore_for_file: public_member_api_docs, sort_constructors_first
