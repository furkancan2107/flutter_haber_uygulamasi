import 'package:haberuygulamasi/models/article.dart';
import 'package:haberuygulamasi/models/news.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class NewsService{

   static Future<List<Articles>?> getNews()async{
    String url="https://newsapi.org/v2/top-headlines?country=tr&category=business&apiKey=acd46a8ada904c7b83a7fa96882954b5";
    final response = await http.get(url);
    if(response.body.isNotEmpty){
      final responseJson=jsonDecode(response.body);
      News news = News.fromJson(responseJson);
      return news.articles;
    }
    return null;


  }
}