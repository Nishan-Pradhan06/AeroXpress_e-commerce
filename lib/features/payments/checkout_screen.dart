import 'package:flutter/material.dart';
import '../../core/widget/custom_card.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String selectedShippingMethod = 'Standard';
  String selectedPaymentMethod = 'Khalti';

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Material(
          elevation: 0.1,
          color: Colors.white,
          child: AppBar(
            // automaticallyImplyLeading: false,
            scrolledUnderElevation: 0,
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text(
              "Checkout",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          spacing: 10,
          children: [
            _buildOrderSummaryCard(theme),
            _buildShippingAddressCard(theme),
            _buildShippingMethodCard(theme),
            _buildPaymentMethodCard(theme),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _placeOrder();
              }
            },
            child: Text('Place Order'),
          ),
        ),
      ),
    );
  }

  Widget _buildOrderSummaryCard(ThemeData theme) {
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order Summary', style: theme.textTheme.titleMedium),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.shopping_bag,
                    color: theme.colorScheme.primary,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nike Air Max',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text('x2', style: theme.textTheme.bodyMedium),
                    ],
                  ),
                ),
                Text(
                  'Rs.200',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Divider(color: theme.dividerColor),
            const SizedBox(height: 16),
            _buildOrderRow('Subtotal', 'Rs.400', theme),
            const SizedBox(height: 8),
            _buildOrderRow('Shipping', 'Rs.119', theme),
            const SizedBox(height: 8),
            _buildOrderRow('Tax', 'Rs.52', theme),
            const SizedBox(height: 8),
            _buildOrderRow('Discount', '- Rs.0', theme),
            const SizedBox(height: 12),
            Divider(color: theme.dividerColor),
            const SizedBox(height: 12),
            _buildOrderRow('Total', 'Rs.571', theme, isTotal: true),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderRow(
    String label,
    String amount,
    ThemeData theme, {
    bool isTotal = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style:
              isTotal ? theme.textTheme.titleSmall : theme.textTheme.bodyLarge,
        ),
        Text(
          amount,
          style: (isTotal
                  ? theme.textTheme.titleSmall?.copyWith(
                    color: theme.colorScheme.primary,
                  )
                  : theme.textTheme.bodyLarge)
              ?.copyWith(
                fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              ),
        ),
      ],
    );
  }

  Widget _buildShippingAddressCard(ThemeData theme) {
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Shipping Address', style: theme.textTheme.titleMedium),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      theme,
                      _nameController,
                      'Recipient Name',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildTextField(theme, _phoneController, 'Phone'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(theme, _streetController, 'Street'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildTextField(theme, _cityController, 'City'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(theme, _stateController, 'State'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildTextField(
                      theme,
                      _postalCodeController,
                      'Postal Code',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildTextField(theme, _countryController, 'Country'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    ThemeData theme,
    TextEditingController controller,
    String label,
  ) {
    return TextFormField(
      controller: controller,
      validator: (value) => value == null || value.isEmpty ? 'Required' : null,
      decoration: InputDecoration(labelText: label),
    );
  }

  Widget _buildShippingMethodCard(ThemeData theme) {
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Shipping Method', style: theme.textTheme.titleMedium),
            const SizedBox(height: 16),
            _buildShippingOption(
              theme,
              'Standard',
              'Standard Delivery',
              '3-5 business days • 3-5 days',
              'Rs.100',
            ),
            const SizedBox(height: 12),
            _buildShippingOption(
              theme,
              'Express',
              'Express Delivery',
              '1-2 business days • 1-2 days',
              'Rs.200',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShippingOption(
    ThemeData theme,
    String value,
    String title,
    String description,
    String price,
  ) {
    final isSelected = selectedShippingMethod == value;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? theme.colorScheme.primary : theme.dividerColor,
          width: isSelected ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: RadioListTile<String>(
        value: value,
        groupValue: selectedShippingMethod,
        onChanged: (String? newValue) {
          setState(() {
            selectedShippingMethod = newValue!;
          });
        },
        title: Text(
          title,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description, style: theme.textTheme.bodySmall),
            Text(price, style: theme.textTheme.labelLarge),
          ],
        ),
        activeColor: theme.colorScheme.primary,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      ),
    );
  }

  Widget _buildPaymentMethodCard(ThemeData theme) {
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Payment Method', style: theme.textTheme.titleMedium),
            const SizedBox(height: 16),
            _buildPaymentOption(
              theme,
              'Khalti',
              'Khalti',
              'Pay with Khalti wallet',
              Icons.account_balance_wallet,
            ),
            const SizedBox(height: 12),
            _buildPaymentOption(
              theme,
              'eSewa',
              'eSewa',
              'Pay with eSewa wallet',
              Icons.account_balance_wallet,
            ),
            const SizedBox(height: 12),
            _buildPaymentOption(
              theme,
              'Card',
              'Card',
              'Pay with debit/credit card',
              Icons.credit_card,
            ),
            const SizedBox(height: 12),
            _buildPaymentOption(
              theme,
              'Cash',
              'Cash on Delivery',
              'Pay with cash on delivery',
              Icons.money,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(
    ThemeData theme,
    String value,
    String title,
    String description,
    IconData icon,
  ) {
    final isSelected = selectedPaymentMethod == value;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? theme.colorScheme.primary : theme.dividerColor,
          width: isSelected ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: RadioListTile<String>(
        value: value,
        groupValue: selectedPaymentMethod,
        onChanged: (String? newValue) {
          setState(() {
            selectedPaymentMethod = newValue!;
          });
        },
        title: Row(
          children: [
            Icon(icon, color: theme.iconTheme.color, size: 20),
            const SizedBox(width: 8),
            Text(
              title,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        subtitle: Text(description, style: theme.textTheme.bodySmall),
        activeColor: theme.colorScheme.primary,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      ),
    );
  }

  void _placeOrder() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Order Placed Successfully!'),
          content: Text(
            'Your order has been placed and will be processed soon.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _streetController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _postalCodeController.dispose();
    _countryController.dispose();
    super.dispose();
  }
}
