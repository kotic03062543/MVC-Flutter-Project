import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/model/news_model/news.dart';


abstract class _NewsService {
  Future<Newslist> getNews();
  Future<Newslist> get({Map<String, dynamic> queryParam});

}


class NewsSerive implements _NewsService {
  Future<Newslist> getNews() async {
    var url = Uri.parse('https://newsapi.org/v2/everything?q=tesla&from=2023-03-26&sortBy=publishedAt&apiKey=26613c15cbec417eb20455b454053b9f');
    var response = await http.get(url);
    var jsonData = utf8.decode(response.bodyBytes);
    print(jsonData);
    return Newslist.fromJson(json.decode(jsonData));
  }

  Future<Newslist> get({Map<String, dynamic>? queryParam}) async {
    try {
      // Map defaultQueryParam = <String, dynamic>{};
      Map<String, dynamic> defaultQueryParam = <String, dynamic>{};
      //** Default Query Param **//
      defaultQueryParam['apiKey'] = '26613c15cbec417eb20455b454053b9f';
      //** Default Query Param **//
      if (queryParam == null) queryParam = {};
      defaultQueryParam.addAll(queryParam);

      var url = Uri.parse('https://newsapi.org/v2/everything').replace(queryParameters: defaultQueryParam);
      print(url);

      var response = await http.get(url, headers: {
        'Content-Type': "application/json",
        //"Authorization": "Bearer " + await Constprefs.getprefs(Constprefs.token)
      }).timeout(Duration(seconds: 30));

      print('getFarmOrg Response status: ${response.statusCode}');
      print('getFarmOrg Response body: ${response.body}');

      return Newslist.fromJson(json.decode(response.body));
    } catch (exception) {
      print('getFarmOrg Exception: $exception');
      return Newslist();
    }
  }
}

