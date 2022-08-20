import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/news_layout/cubit/statues.dart';
import 'package:news/modules/Business/business.dart';
import 'package:news/modules/Science/science.dart';
import 'package:news/modules/Settings/settings.dart';
import 'package:news/modules/Sports/sport.dart';
import 'package:news/shared/networks/remote/dio.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;
  List<BottomNavigationBarItem> bottomItem=[
    const  BottomNavigationBarItem(icon: Icon(Icons.business),label: 'Business'),
    const  BottomNavigationBarItem(icon: Icon(Icons.sports),label: 'Sports'),
    const BottomNavigationBarItem(icon: Icon(Icons.science),label: 'Science'),
    
  ];
  
  List <Widget> screens=[
    Business(),
    Sport(),
    Science(),
   
  ];
  void changeBottom(int index){
    currentIndex=index;
    if(index==1) {
      getSports();
    }else if(index==2){getScience();}
    emit(NewsBottomNavState());
  }
   List<dynamic> business=[];
  void getBusiness (){
    emit(NewsGetBusinessLoadingState());
    if(business.length==0){
      DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'business',
      'apiKey': 'ee02bfde7396425d8bed7b730e518dbc',
    }).then((value) {
      //print(value.data['articles'][0]['title']);
      business=value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState( error.toString()));
    });
    }else{emit(NewsGetBusinessSuccessState());}
  }

  List<dynamic> sports=[];
  void getSports (){
    emit(NewsGetSportsLoadingState());
    if(sports.length==0){
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'us',
        'category': 'sports',
        'apiKey': 'ee02bfde7396425d8bed7b730e518dbc',
      }).then((value) {
        //print(value.data['articles'][0]['title']);
        sports=value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErrorState( error.toString()));
      });
    }else{emit(NewsGetSportsSuccessState());}

  }




  List<dynamic> science=[];
  void getScience (){
    emit(NewsGetScienceLoadingState());
    if(science.length==0){
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'us',
        'category': 'science',
        'apiKey': 'ee02bfde7396425d8bed7b730e518dbc',
      }).then((value) {
        //print(value.data['articles'][0]['title']);
        science=value.data['articles'];
        print( science[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState( error.toString()));
      });
    }else{emit(NewsGetScienceSuccessState());}

  }


}