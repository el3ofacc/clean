import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:raqi/core/utils/failure.dart';
import 'package:http/http.dart' as http;
import 'package:raqi/features/progect/domain/repositories/news.dart';

class Datarepo {List<News> newslist = [];//<------------------list of object (news)
  Future<Either<Failure, List<dynamic>>> fetchuser() async {
    
    try {
      final response =
          await http.get(Uri.parse('https://jsonplaceholder.org/posts'));
      if (response.statusCode == 200) {
        var jsonbody = json.decode(response.body) as List;
        newslist = jsonbody.map((json) => News.fromjson(json)).toList();
        return right(newslist);
      } else {
        return left(serverfailure('failed to load data :try again'));
      }
    } catch (e) {
      return left(networkfailure('no internet connection'));
    }
  }
}

 
