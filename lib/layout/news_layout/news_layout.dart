import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/news_layout/cubit/cubit.dart';
import 'package:news/layout/news_layout/cubit/statues.dart';
import 'package:news/shared/networks/remote/dio.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder:(context,state){
          var cubit=NewsCubit.get(context);
          return Scaffold(
          appBar: AppBar(title: Text('News App'),actions: [IconButton(onPressed: (){}, icon: Icon(Icons.search)),IconButton(onPressed: (){}, icon: Icon(Icons.brightness_4_outlined))]),
          body:cubit.screens[cubit.currentIndex] ,
          bottomNavigationBar: BottomNavigationBar(items:cubit.bottomItem,currentIndex: cubit.currentIndex,onTap: (index){cubit.changeBottom(index);},),
          
        ); } ,
        
      ),
    );
  }
}