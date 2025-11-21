import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modelus/home/view_model/articles_cubit/articles_cubit.dart';
import 'package:news/modelus/home/view_model/articles_cubit/articles_cubit_state.dart';
import 'package:news/modelus/home/widget/article_item.dart';
import 'package:news/network/repones/artcles/article.dart';
import 'package:news/network/API/services/api_services.dart';

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
    articlesFuture = ApiServices().getArticlesNews(widget.sourceId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArticlesCubit()..getAllArticles(widget.sourceId),
      child: BlocBuilder<ArticlesCubit, ArticlesCubitState>(
        builder: (context, articleState) {
          if (articleState is ArticlesLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (articleState is ArticlesErrorState) {
            return Center(child: Text(articleState.message));
          } else if (articleState is ArticlesSuccessState) {
            return ListView.builder(
              itemCount: articleState.article.length,
              itemBuilder: (context, index) {
                return ArticleItem(article: articleState.article[index]);
              },
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
