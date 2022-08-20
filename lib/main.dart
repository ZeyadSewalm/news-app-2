import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/news_layout/cubit/statues.dart';
import 'package:news/layout/news_layout/news_layout.dart';
import 'package:news/shared/networks/remote/dio.dart';

import 'block_opserver.dart';
import 'layout/news_layout/cubit/cubit.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>NewsCubit,
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
         builder: (context,state){ return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange),
              appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(color: Colors.black),
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  backwardsCompatibility: false,
                  systemOverlayStyle:
                      SystemUiOverlayStyle(statusBarColor: Colors.white)),
              textTheme: const TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  backgroundColor: Colors.white,
                  unselectedItemColor: Colors.grey,
                  elevation: 40)),
          darkTheme: ThemeData(
              primarySwatch: Colors.deepPurple,
              scaffoldBackgroundColor: Colors.black54,
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepPurple),
              appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(color: Colors.white),
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  backgroundColor: Colors.black54,
                  elevation: 0,
                  backwardsCompatibility: false,
                  systemOverlayStyle:
                      SystemUiOverlayStyle(statusBarColor: Colors.black)),
              textTheme: const TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepPurple,
                  backgroundColor: Colors.black54,
                  unselectedItemColor: Colors.grey,
                  elevation: 40)),
          themeMode: ThemeMode.dark,
          home: NewsLayout(),
        );},
       
      ),
    );
  }
}
