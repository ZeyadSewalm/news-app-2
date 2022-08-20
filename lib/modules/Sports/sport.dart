import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/news_layout/cubit/cubit.dart';
import 'package:news/layout/news_layout/cubit/statues.dart';
import 'package:news/shared/componants/componants.dart';


class Sport  extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
      return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder:(context,state){ 
        var list=NewsCubit.get(context).sports;
       
        return articleBuilder(list,context);} ,
      
    );
  }
}