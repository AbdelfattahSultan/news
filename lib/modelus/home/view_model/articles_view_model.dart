import 'package:flutter/material.dart';
import 'package:news/network/API/api_services.dart';
import 'dart:core';
import 'package:news/network/repones/artcles/article.dart';
import 'package:news/network/repones/sources/source.dart';

class ArticlesViewModel extends ChangeNotifier {
  List<Article> _articles = [];
  List<Source> _sources = [];

  List<Article> get articles => _articles;
  List<Source> get sources => _sources;

  Future<void> getAllSources(String categoryId) async {
    _sources = await ApiServices.getAllSources(categoryId);
    notifyListeners();
  }

  Future<void> getAllArticles(String sourcesId) async {
    _articles = await ApiServices.getArticlesNews(sourcesId);
    notifyListeners();
  }
}
