import 'package:dio/dio.dart';
import 'package:github_search/models/SearchResult.dart';
import 'dart:io';

class GitHubService {
  final Dio dio = Dio();

  Future<SearchResult> search(String term) async {
    try {
      Response response =
          await dio.get("https://api.github.com/search/repositories?q=${term}");

      return SearchResult.fromJson(response.data);
    } catch (e) {
      throw SocketException(e);
    }
  }
}
