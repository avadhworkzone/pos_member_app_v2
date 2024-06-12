/* import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/modules/search_result/search_result_controller.dart';
import 'package:member_app_v2/modules/home/home_tab/model/categories_response.dart'
    as cat;

class CategoryExpandable extends StatefulWidget {
  final int index;
  const CategoryExpandable({super.key, required this.index});

  @override
  State<CategoryExpandable> createState() => _CategoryExpandableState();
}

class _CategoryExpandableState extends State<CategoryExpandable> {
  SearchResultController searchResultController =
      Get.find<SearchResultController>();

  @override
  Widget build(BuildContext context) {
    return Expandable(
        collapsed: ExpandableButton(
          child: ListTile(
              title: Text(searchResultController.categoriesReponse?.data
                      ?.edges?[widget.index].node?.name ??
                  ""),
              leading: Checkbox(
                value: false,
                onChanged: (value) {
                  searchResultController.onCategorySelected(
                      searchResultController.categoriesReponse?.data
                              ?.edges?[widget.index].node?.id ??
                          0);
                },
              ),
              trailing: const Icon(Icons.add)),
        ),
        expanded: recursiveExpandable(searchResultController.categoriesReponse
            ?.data?.edges?[widget.index].node?.subCategories));
  }

  Widget recursiveExpandable(List<cat.Node>? subcategories) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
          itemBuilder: (context, index) => Expandable(
              collapsed: ExpandableButton(
                child: ListTile(
                    title: Text(subcategories?[index].name ?? ""),
                    leading: Checkbox(
                      value: false,
                      onChanged: (value) {
                        searchResultController
                            .onCategorySelected(subcategories?[index].id ?? 0);
                      },
                    ),
                    trailing: const Icon(Icons.add)),
              ),
              expanded:
                  recursiveExpandable(subcategories?[index].subCategories)),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: subcategories?.length ?? 0),
    );
  }
}
 */