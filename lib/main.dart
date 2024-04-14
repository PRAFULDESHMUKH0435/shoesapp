import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/MainScreen.dart';
import 'package:flutter/foundation.dart';

import 'Controllers/mainscreen_provider.dart';
void main(){
  runApp(
    MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (context)=>MainScreenNotifier()),
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:MainScreen()
    );
  }
}
