import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/recources/assets_manager/assets_manager.dart';
import 'package:movie/core/recources/colors_manager/colors_manager.dart';
import 'package:movie/core/widgets/custom_grid_view.dart';
import 'package:movie/core/widgets/custom_tab_bar.dart';
import 'package:movie/core/widgets/movie_item.dart';
import 'package:movie/model/category_model.dart';
import 'package:movie/model/moive_model.dart';

class BrowserTab extends StatefulWidget {
  const BrowserTab({super.key});

  @override
  State<BrowserTab> createState() => _BrowserTabState();
}

class _BrowserTabState extends State<BrowserTab> {
  late CategoryModel selectedCategory = CategoryModel.categories[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: Padding(
        padding: REdgeInsets.symmetric(vertical: 25, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTabBar(
              categories: CategoryModel.categories,
              onCategoryItemClicked: (category) {
                selectedCategory = category;
              },
            ),

            Expanded(
              child: CustomGridView(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisExtent: 279.h,
                mainAxisSpacing: 8,
                imageWidth: 189.w,
                movies: MovieModel.detalisMovie,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
