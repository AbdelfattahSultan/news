import 'package:flutter/material.dart';
import 'package:news/network/API/api_services.dart';
import 'dart:core';
import 'package:news/network/repones/artcles/article.dart';
import 'package:news/network/repones/sources/source.dart';

class ArticlesViewModel extends ChangeNotifier {
  List<Article> _articles = [];
  List<Source> _sources = [];

  bool _isLoadingSources = true;
  bool _isLoadingArticles = true;

  bool get isLoadingSources => _isLoadingSources;
  bool get isLoadingArticles => _isLoadingArticles;

  List<Article> get articles => _articles;
  List<Source> get sources => _sources;

  Future<void> getAllSources(String categoryId) async {
    _sources = await ApiServices.getAllSources(categoryId);
    changeLoadingSources(false);
    notifyListeners();
  }

  Future<void> getAllArticles(String sourcesId) async {
    _articles = await ApiServices.getArticlesNews(sourcesId);
    changeLoadingArticles(false);
    notifyListeners();
  }

  void changeLoadingSources(bool value) {
    _isLoadingSources = value;
    notifyListeners();
  }

  void changeLoadingArticles(bool value) {
    _isLoadingArticles = value;
    notifyListeners();
  }
}
