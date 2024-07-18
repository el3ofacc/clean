import 'package:flutter/material.dart';
import 'package:raqi/core/utils/failure.dart';
import 'package:raqi/features/progect/data/repositories/datarepo.dart';

class Myfuturebuilder extends StatelessWidget {
  Myfuturebuilder({
    super.key,
  });
 
  final Datarepo datarepo = Datarepo();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: datarepo.fetchuser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            return snapshot.data!.fold(
                (Failure) => Center(
                      child: Text(Failure.message),
                    ),
                (user) => ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(user[index].title.toString()),
                          subtitle: Text(user[index].description.toString()),
                        );
                      },
                      itemCount: user.length,
                    ));
          } else {
            return Center(
              child: Text('no posts available'),
            );
          }
        });
  }
}


 