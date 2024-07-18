import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raqi/features/progect/presentation/pages/homepage.dart';
import 'package:raqi/features/progect/presentation/provider/change.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Change(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Homepage(),
      ),
    );
  }
}
