import 'package:flutter/material.dart';
import 'package:movie/core/widgets/tab_item.dart';
import 'package:movie/model/category_model.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({
    super.key,
    required this.categories,
    required this.onCategoryItemClicked,
  });
  final List<CategoryModel> categories;
  final void Function(CategoryModel)? onCategoryItemClicked;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.categories.length,
      child: TabBar(
        indicatorColor: Colors.transparent,
        isScrollable: true,
        dividerColor: Colors.transparent,
        tabAlignment: TabAlignment.start,
        physics: BouncingScrollPhysics(),
        onTap: (newIndex) {
          widget.onCategoryItemClicked?.call(widget.categories[newIndex]);
          selectedIndex = newIndex;
          setState(() {});
        },
        tabs: widget.categories
            .map(
              (category) => TabItem(
                isSelected:
                    selectedIndex == widget.categories.indexOf(category),
                category: category,
              ),
            )
            .toList(),
      ),
    );
  }
}
