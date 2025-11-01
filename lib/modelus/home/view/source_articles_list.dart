import 'package:flutter/material.dart';
import 'package:news/modelus/home/view_model/articles_view_model.dart';
import 'package:news/modelus/home/widget/article_item.dart';
import 'package:news/network/API/api_services.dart';
import 'package:news/network/repones/artcles/article.dart';
import 'package:provider/provider.dart';

class SourceArticlesList extends StatefulWidget {
  final String sourceId;
  const SourceArticlesList({super.key, required this.sourceId});

  @override
  State<SourceArticlesList> createState() => _SourceArticlesListState();
}

class _SourceArticlesListState extends State<SourceArticlesList> {
  late Future<List<Article>> articlesFuture;

  @override
  void initState() {
    super.initState();
    articlesFuture = ApiServices.getArticlesNews(widget.sourceId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ArticlesViewModel()..getAllArticles(widget.sourceId),
      child: Consumer<ArticlesViewModel>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.articles.length,
            itemBuilder: (context, index) {
              return ArticleItem(article: value.articles[index]);
            },
          );
        },
      ),
    );
  }
}
