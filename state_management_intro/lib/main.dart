import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_intro/demobloc/all_articles/all_articles_bloc.dart';
import 'package:state_management_intro/ui/all_articles_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management Intro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider<AllArticlesBloc>(
        create: (BuildContext context) =>
            AllArticlesBloc()..add(GetAllArticlesEvent()),
        // For BLoC example
        child: AllArticlesView(),
        // For InheritedWidgetExample
        // child: const ColorChangeView(),
      ),
    );
  }
}
