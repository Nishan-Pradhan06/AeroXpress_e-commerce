import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../../core/theme/app_colors.dart';

class EvAddProductFab extends StatelessWidget {
  final bool isExtended;
  const EvAddProductFab({super.key, required this.isExtended});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child:
          isExtended
              ? FloatingActionButton.extended(
                key: const ValueKey('extended'),
                onPressed: () => _showAddProductDialog(context),
                icon: Icon(PhosphorIconsRegular.plus, color: Colors.white),
                label: const Text(
                  'Add Product',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: brandPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              )
              : FloatingActionButton(
                key: const ValueKey('iconOnly'),
                onPressed: () => _showAddProductDialog(context),
                backgroundColor: brandPrimaryColor,
                shape: const CircleBorder(),
                child: Icon(PhosphorIconsRegular.plus, color: Colors.white),
              ),
    );
  }

  void _showAddProductDialog(BuildContext context) {
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
