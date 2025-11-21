import 'package:news/network/repones/artcles/article.dart';


abstract class ArticlesCubitState {}

class ArticlesInitState extends ArticlesCubitState {}

class ArticlesLoadingState extends ArticlesCubitState {}

class ArticlesErrorState extends ArticlesCubitState {
  final String message;
  ArticlesErrorState(this.message);
}

class ArticlesSuccessState extends ArticlesCubitState {
  final List<Article> article;
  ArticlesSuccessState(this.article);
}

class ArticlesEmptyState extends ArticlesCubitState {
  final String message;
  ArticlesEmptyState(this.message);
}
