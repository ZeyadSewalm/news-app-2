import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget builedArticlesItems(article,context,) => InkWell(
  child:   Padding(
  
        padding: const EdgeInsets.all(20.0),
  
        child: Row(
  
          children: [
  
            Container(
  
              height: 120,
  
              width: 120,
  
              decoration: BoxDecoration(
  
                  borderRadius: BorderRadius.circular(10),
  
                  image: DecorationImage(
  
                      image: NetworkImage('${article['urlToImage']}'),
  
                      fit: BoxFit.cover)),
  
            ),
  
            SizedBox(
  
              width: 20,
  
            ),
  
            Expanded(
  
              //عملنا  expanded عشان بداخل العمود نس expanded فلازم اعمله expanded للكبير
  
              child: Container(
  
                height: 120,
  
                child: Column(
  
                  mainAxisAlignment: MainAxisAlignment.start,
  
                  crossAxisAlignment: CrossAxisAlignment.start,
  
                  children: [
  
                    Expanded(
  
                        child: Text(
  
                      '${article['title']}',
  
                      style: Theme.of(context).textTheme.bodyText1,
  
                      maxLines: 4,
  
                      overflow: TextOverflow.ellipsis,
  
                    )),
  
                    Text(
  
                      '${article['publishedAt']}',
  
                      style: TextStyle(color: Colors.grey),
  
                    ),
  
                  ],
  
                ),
  
              ),
  
            )
  
          ],
  
        ),
  
      ),
);



Widget myDivider() => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 1,
        width: double.infinity,
        color: Colors.grey[300],
      ),
    );


Widget articleBuilder(list,context)=>ConditionalBuilder(
        condition:list.length>0 ,
       builder: (context)=>ListView.separated(
         physics: BouncingScrollPhysics(),
         itemBuilder:(context,index )=>builedArticlesItems(list[index],context) ,
          separatorBuilder: (context,index)=>myDivider(), 
          itemCount: 10), 
       fallback: (context)=>Center(child: CircularProgressIndicator()));    


    



    