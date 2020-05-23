import 'package:dio/dio.dart';
import 'package:state_management_intro/demobloc/constants/application_constants.dart';
import 'package:state_management_intro/demobloc/models/articles_response_model.dart';

class ArticleRepository {
  static Future<ArticleResponseModel> getAllArticles(int pageNo) async {
    try {
      final Response<Map<String, dynamic>> response = await ApplicationConstants
          .httpClient
          .get('/articles/all', queryParameters: {
        "pageNo": pageNo,
      });
      final ArticleResponseModel articleResponseModel =
          ArticleResponseModel.fromJson(response.data);
      return Future.value(articleResponseModel);
    } catch (e) {
      return Future.error("Unexpected error occurred");
    }
  }
}
