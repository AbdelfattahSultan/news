import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/network/API/api_constants.dart';
import 'package:news/network/API/api_end_point.dart';
import 'package:news/network/repones/artcles/article.dart';
import 'package:news/network/repones/artcles/articles_response.dart';
import 'package:news/network/repones/sources/source.dart';
import 'package:news/network/repones/sources/sources_response.dart';

class ApiServices {
  static Future<List<Source>> getAllSources(String category) async {
    var queryParameters = {'apiKey': ApiConstants.apiKey, 'category': category};
    var uri = Uri.https(
      ApiConstants.baseUrl,
      ApiEndPoint.sources,
      queryParameters,
    );
    var response = await http.get(uri);
    var json = jsonDecode(response.body);

    SourcesResponse res = SourcesResponse.fromJson(json);
    print(json);
    return res.sources!;
  }

  static Future<List<Article>> getArticlesNews(String sourcesId) async {
    var queryParameters = {'apiKey': ApiConstants.apiKey, 'sources': sourcesId};
    var uri = Uri.https(
      ApiConstants.baseUrl,
      ApiEndPoint.everything,
      queryParameters,
    );
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    print(json);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    return articlesResponse.articles ?? [];
  }
}
