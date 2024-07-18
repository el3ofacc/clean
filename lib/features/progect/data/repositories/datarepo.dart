// import 'dart:convert';

// import 'package:dartz/dartz.dart';
// import 'package:raqi/core/utils/failure.dart';
// import 'package:http/http.dart' as http;
// import 'package:raqi/features/progect/domain/repositories/news.dart';

// class Datarepo {List<News> newslist = [];//<------------------list of object (news)
//   Future<Either<Failure, List<dynamic>>> fetchuser() async {

//     try {
//       final response =
//           await http.get(Uri.parse('https://jsonplaceholder.org/posts'));
//       if (response.statusCode == 200) {
//         var jsonbody = json.decode(response.body) as List;
//         newslist = jsonbody.map((json) => News.fromjson(json)).toList();
//         return right(newslist);
//       } else {
//         return left(serverfailure('failed to load data :try again'));
//       }
//     } catch (e) {
//       return left(networkfailure('no internet connection'));
//     }
//   }
// }

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:raqi/core/utils/failure.dart';
import 'package:http/http.dart' as http;
import 'package:raqi/features/progect/domain/repositories/news.dart';
import 'package:raqi/features/progect/presentation/widgets/scaffoldmes.dart';

class Datarepo {
  List<Data> Datalist = [];
  Future<Either<Failure, List<Data>>> fetchdata(BuildContext context) async {
    try {
      var response =
          await http.get(Uri.parse('https://jsonplaceholder.org/posts'));
      if (response.statusCode == 200) {
        var jsonbody = json.decode(response.body) as List;
        Datalist = jsonbody.map((json) => Data.fromjson(json)).toList();
        return right(Datalist);
      } else {
        return left(
            serverfailure(Scaffoldmes. showmessage('server failed ,try again', context)));
      }
    } catch (e) {
      return left(
          Networkfailure(Scaffoldmes.showmessage('no internet connection', context)));
    }
  }
}
