import 'package:deal_sell/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constant/api.dart';
import '../bloc/category_bloc.dart';
import '../widgets/category_skeleton.dart';
import '../widgets/category_tile.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Material(
          elevation: 0.1,
          color: Colors.white,
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text(
              "Categories",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          return state.whenOrNull(
                loading: () => CategoryGridSkeleton(),
                failure: (error) => CategoryGridSkeleton(),
                loaded: (data) {
                  return GridView.builder(
                    padding: const EdgeInsets.only(top: AppTheme.space1),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.85,
                        ),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final String rawImage = data[index].image ?? '';
                      final String imageUrl = rawImage.replaceFirst(
                        'localhost',
                        LOCAL_IP,
                      );
                      return CategoryTile(
                        imageLink: imageUrl,
                        label: data[index].name,
                        onTap: () {},
                      );
                    },
                  );
                },
              ) ??
              const SizedBox.shrink();
        },
      ),
    );
  }
}
