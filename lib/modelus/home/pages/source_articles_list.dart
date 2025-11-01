import 'package:flutter/material.dart';
import 'package:news/modelus/home/widget/article_item.dart';
import 'package:news/network/API/api_services.dart';
import 'package:news/network/repones/artcles/articles_response.dart';

class SourceArticlesList extends StatefulWidget {
  final String sourceId;
  const SourceArticlesList({super.key, required this.sourceId});

  @override
  State<SourceArticlesList> createState() => _SourceArticlesListState();
}

class _SourceArticlesListState extends State<SourceArticlesList> {
  late Future<ArticlesResponse> articlesFuture;

  @override
  void initState() {
    super.initState();
    articlesFuture = ApiServices.getArticlesNews(widget.sourceId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArticlesResponse>(
      future: articlesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error.toString()}"));
        }

        if (snapshot.data == null) {
          return const Center(child: Text("No data available"));
        }

        var articlesList = snapshot.data!.articles;

        if (articlesList == null || articlesList.isEmpty) {
          return const Center(child: Text("No articles found for this source"));
        }

        return ListView.builder(
          itemCount: articlesList.length,
          itemBuilder: (context, index) {
            return ArticleItem(article: articlesList[index]);
          },
        );
      },
    );
  }
}
