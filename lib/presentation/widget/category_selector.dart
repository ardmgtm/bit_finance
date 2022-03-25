import 'package:flutter/material.dart';

import '../../domain/entity/category/category.dart';

class CategorySelector extends StatefulWidget {
  final CategorySelectController? controller;
  final List<Category> categoryList;

  const CategorySelector({
    Key? key,
    this.controller,
    required this.categoryList,
  }) : super(key: key);

  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  Category? _selectedCategory;

  @override
  void initState() {
    _selectedCategory = widget.categoryList[0];
    if (widget.controller != null) {
      widget.controller!.category = _selectedCategory;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconTheme(
              child: _selectedCategory!.icon,
              data: IconThemeData(color: Colors.grey[800]),
            ),
          ),
          Text(_selectedCategory!.name, style: const TextStyle(fontSize: 16)),
          Expanded(child: Container()),
          TextButton(
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Select Category',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                      const Divider(),
                      Expanded(
                        child: ListView(
                          children: widget.categoryList.map(
                            (category) {
                              return ListTile(
                                onTap: () {
                                  setState(() {
                                    _selectedCategory = category;
                                    if (widget.controller != null) {
                                      var index =
                                          widget.categoryList.indexOf(category);
                                      widget.controller!.category = category;
                                      widget.controller!.index = index;
                                    }
                                  });
                                  Navigator.pop(context);
                                },
                                leading: category.icon,
                                title: Text(category.name),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text("Change"),
          ),
        ],
      ),
    );
  }
}

class CategorySelectController {
  Category? category;
  int? index;

  CategorySelectController({this.category, this.index});
}
