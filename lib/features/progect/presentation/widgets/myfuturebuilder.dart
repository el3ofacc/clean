// import 'package:flutter/material.dart';
// import 'package:raqi/core/utils/failure.dart';
// import 'package:raqi/features/progect/data/repositories/datarepo.dart';

// class Myfuturebuilder extends StatelessWidget {
//   Myfuturebuilder({
//     super.key,
//   });

//   final Datarepo datarepo = Datarepo();
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: datarepo.fetchuser(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.hasError) {
//             return Center(child: Text(snapshot.error.toString()));
//           } else if (snapshot.hasData) {
//             return snapshot.data!.fold(
//                 (Failure) => Center(
//                       child: Text(Failure.message),
//                     ),
//                 (user) => ListView.builder(
//                       itemBuilder: (context, index) {
//                         return ListTile(
//                           title: Text(user[index].title.toString()),
//                           subtitle: Text(user[index].description.toString()),
//                         );
//                       },
//                       itemCount: user.length,
//                     ));
//           } else {
//             return Center(
//               child: Text('no posts available'),
//             );
//           }
//         });
//   }
// }

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:raqi/core/utils/failure.dart';
import 'package:raqi/features/progect/data/repositories/datarepo.dart';
import 'package:raqi/features/progect/domain/repositories/news.dart';
import 'package:raqi/features/progect/presentation/widgets/scaffoldmes.dart';

class Myfuturebuilder extends StatelessWidget {
  Myfuturebuilder({super.key});
  final Datarepo datarepo = Datarepo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: datarepo.fetchdata(context),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('no data available'));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return snapshot.data!.fold(
                (Failure) =>Scaffoldmes.showmessage(Failure.message, context),
                (user) => ListView.builder(
                    itemCount: user.length,
                    itemBuilder: (context, index) {
                      return Text(user[index].title.toString());
                    }));
          } else {
            return Center(child: Text('no data available'));
          }
        },
      ),
    );
  }
}
