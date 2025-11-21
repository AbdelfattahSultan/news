import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modelus/home/view_model/articles_cubit/articles_cubit_state.dart';
import 'package:news/network/API/services/api_services.dart';

class ArticlesCubit extends Cubit<ArticlesCubitState> {
  ArticlesCubit() : super(ArticlesInitState());

  Future<void> getAllArticles(String sourceId) async {
    emit(ArticlesLoadingState());
    try {
      var responses = await ApiServices().getArticlesNews(sourceId);

      if (responses.isEmpty) {
        emit(ArticlesEmptyState("articles is empty"));
      } else {
        emit(ArticlesSuccessState(responses));
      }
    } catch (e) {
      emit(ArticlesErrorState(e.toString()));
    }
  }
}
