import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/model/news.dart';

abstract class _NewsService {
  Future<Newslist> getNews();
}

class NewsSerive implements _NewsService {
  Future<Newslist> getNews() async {
    var url = Uri.parse('https://newsapi.org/v2/everything?q=tesla&from=2023-03-25&sortBy=publishedAt&apiKey=a7918e7702114e4caa4901df2b38fe5b');
    var response = await http.get(url);
    var jsonData = utf8.decode(response.bodyBytes);
    print(jsonData);
    return Newslist.fromJson(json.decode(jsonData));
  }
}
