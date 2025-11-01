import 'package:flutter/material.dart';
import 'package:news/gen/assets.gen.dart';
import 'package:news/models/category_data.dart';
import 'package:news/modelus/home/pages/articles_list_view.dart';
import 'package:news/modelus/home/pages/custom_drawer.dart';
import 'package:news/modelus/home/widget/category_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CategoryData? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          selectedCategory == null ? "Home" : selectedCategory!.title,
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(Assets.icons.searchIcn.path, color: Colors.black),
          ),
        ],
      ),
      drawer: CustomDrawer(
        onTap: () {
          setState(() {
            selectedCategory = null;
            Navigator.pop(context);
          });
        },
      ),
      body: selectedCategory == null
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Good Morning\nHere is Some News For You',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return CategoryItem(
                          category: CategoryData.categories[index],
                          index: index,
                          onTap: onSelectedCategory,
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10),
                      itemCount: CategoryData.categories.length,
                    ),
                  ),
                ],
              ),
            )
          : ArticlesListView(selectedCategory: selectedCategory!),
    );
  }

  void onSelectedCategory(CategoryData category) {
    setState(() {
      selectedCategory = category;
    });
  }
}
