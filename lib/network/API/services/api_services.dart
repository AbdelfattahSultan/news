import 'package:dio/dio.dart';
import 'package:news/network/repones/artcles/article.dart';
import 'package:news/network/repones/artcles/articles_response.dart';
import 'package:news/network/repones/sources/source.dart';
import 'package:news/network/repones/sources/sources_response.dart';
import 'package:news/network/API/services/api_config.dart';

class ApiServices {
  final Dio _dio;

  ApiServices()
    : _dio = Dio(
        BaseOptions(
          baseUrl: ApiConfig.baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      );

  Future<List<Article>> searchArticles(String q) async {
    try {
      var response = await _dio.get(
        ApiConfig.searchEndPoint,
        queryParameters: {"q": q, "apiKey": ApiConfig.apiKey},
      );

      if (response.statusCode == 200) {
        ArticlesResponse articlesResponse = ArticlesResponse.fromJson(
          response.data,
        );
        return articlesResponse.articles ?? [];
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          message: "Something went wrong ",
        );
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception("Connection timeout");
      }
      rethrow;
    }
  }

  Future<List<Source>> getAllSources(String category) async {
    try {
      var queryParameters = {'apiKey': ApiConfig.apiKey, 'category': category};

      var response = await _dio.get(
        ApiConfig.sources,
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        SourcesResponse res = SourcesResponse.fromJson(response.data);

        return res.sources!;
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          message: "Something went wrong ",
        );
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception("Connection timeout");
      }
      rethrow;
    }
  }

  Future<List<Article>> getArticlesNews(String sourcesId) async {
    try {
      var queryParameters = {'apiKey': ApiConfig.apiKey, 'sources': sourcesId};

      var response = await _dio.get(
        ApiConfig.everything,
        queryParameters: queryParameters,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        ArticlesResponse articlesResponse = ArticlesResponse.fromJson(
          response.data,
        );
        return articlesResponse.articles ?? [];
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          message: "Something went wrong",
        );
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception("Connection timeout");
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception("Receive timeout");
      } else if (e.type == DioExceptionType.badResponse) {
        throw Exception("Invalid server response");
      } else {
        throw Exception("Unexpected error: ${e.message}");
      }
    } catch (e) {
      throw Exception("Unexpected error occurred: $e");
    }
  }
}
