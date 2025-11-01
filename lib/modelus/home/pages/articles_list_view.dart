import 'package:flutter/material.dart';
import 'package:news/models/category_data.dart';
import 'package:news/modelus/home/pages/source_articles_list.dart';
import 'package:news/network/API/api_services.dart';
import 'package:news/network/repones/sources/sources_response.dart';

class ArticlesListView extends StatefulWidget {
  final CategoryData selectedCategory;
  const ArticlesListView({super.key, required this.selectedCategory});
  @override
  State<ArticlesListView> createState() => _ArticlesListViewState();
}

class _ArticlesListViewState extends State<ArticlesListView> {
  late Future<SourcesResponse> sourcesFuture;
  @override
  void initState() {
    super.initState();
    sourcesFuture = ApiServices.getAllSources(widget.selectedCategory.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: sourcesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }

        var response = snapshot.data;
        if (response == null ||
            response.sources == null ||
            response.sources!.isEmpty) {
          return const Center(
            child: Text("No sources found for this category"),
          );
        }
        return DefaultTabController(
          length: response!.sources!.length,
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
                tabs: response.sources!
                    .map((source) => Tab(text: source.name))
                    .toList(),
              ),
              Expanded(
                child: TabBarView(
                  children: response.sources!
                      .map((source) => SourceArticlesList(sourceId: source.id!))
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
