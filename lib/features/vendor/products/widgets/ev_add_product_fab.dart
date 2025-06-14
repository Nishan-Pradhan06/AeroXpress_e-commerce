import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../../core/theme/app_colors.dart';

class EvAddProductFab extends StatelessWidget {
  const EvAddProductFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => _showAddProductDialog(context),
      icon: Icon(PhosphorIconsRegular.plus, color: Colors.white),
      label: const Text('Add Product', style: TextStyle(color: Colors.white)),
      backgroundColor: brandPrimaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }

  void _showAddProductDialog(BuildContext context) {
    // Implement add product dialog
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Add Product'),
            content: const Text('Add product dialog would be implemented here'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Add'),
              ),
            ],
          ),
    );
  }
}
