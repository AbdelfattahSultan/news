import 'package:flutter/material.dart';
import 'package:news/models/category_data.dart';
import 'package:news/modelus/home/view/source_articles_list.dart';
import 'package:news/modelus/home/view_model/articles_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ArticlesListView extends StatefulWidget {
  final CategoryData selectedCategory;
  const ArticlesListView({super.key, required this.selectedCategory});
  @override
  State<ArticlesListView> createState() => _ArticlesListViewState();
}

class _ArticlesListViewState extends State<ArticlesListView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          ArticlesViewModel()..getAllSources(widget.selectedCategory.id),
      child: Consumer<ArticlesViewModel>(
        builder: (context, value, child) {
          return value.isLoadingSources
              ? Shimmer(
                  duration: Duration(seconds: 2),
                  interval: Duration(seconds: 1),
                  enabled: true,
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade300,
                    ),
                  ),
                )
              : DefaultTabController(
                  length: value.sources.length,
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        isScrollable: true,
                        labelColor: Colors.black,
                        labelStyle: TextStyle(fontSize: 18),
                        unselectedLabelStyle: TextStyle(fontSize: 14),
                        tabAlignment: TabAlignment.start,
                        indicatorColor: Colors.black,
                        tabs: value.sources
                            .map((source) => Tab(text: source.name))
                            .toList(),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: value.sources
                              .map(
                                (source) =>
                                    SourceArticlesList(sourceId: source.id!),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
