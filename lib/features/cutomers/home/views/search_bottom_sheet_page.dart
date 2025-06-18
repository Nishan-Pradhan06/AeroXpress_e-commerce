import 'package:flutter/material.dart';

import '../../../../core/widget/padding.dart';
import '../models/product_list.dart';
import '../widgets/product_card.dart';
import '../widgets/search_field.dart';

class SearchBottomSheet extends StatefulWidget {
  const SearchBottomSheet({super.key});

  @override
  State<SearchBottomSheet> createState() => _SearchBottomSheetState();
}

class _SearchBottomSheetState extends State<SearchBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 1,
      maxChildSize: 1,
      expand: false,
      builder:
          (_, controller) => CustomPadding(
            top: MediaQuery.of(context).size.height * 0.05,
            child: Column(
              children: [
                const Text(
                  'Search Products',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                SearchField(),
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: demoProducts.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 0.75,
                          // mainAxisSpacing: 2,
                          crossAxisSpacing: 16,
                        ),
                    itemBuilder:
                        (context, index) => ProductCard(
                          product: demoProducts[index],
                          onPress: () {},
                        ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
