
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projs/layout/news_app/cubit/states.dart';
import 'package:projs/modules/news_app/business/bussiness_screen.dart';
import 'package:projs/modules/news_app/science/science_screen.dart';
import 'package:projs/modules/news_app/sports/sports_screen.dart';

import 'package:projs/network/remote/dio_healper.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super (NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex=0;

  List<BottomNavigationBarItem>bottomItems=
  [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Bussines',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
  ];

  List<Widget>screens=
  [
    BussinesScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeBottomBar(int index)
  {
    currentIndex=index;
    if(index==1)
      getsports();
    if(index==2)
      getScience();

    emit(NewsBottomNavState());
  }

  List<dynamic> business=[];

  void getBusiness()
  {
    emit(NewsBusinessLoadingState());
    DioHealper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country':'us',
          'category':'business',
          'apiKey':'d2a5787712c44d9bba01ca0463791392 ',
        }
    ).then((value)
    {
     // print(value.data['totalResults']);
      business=value.data['articles'];
      //print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      emit(NewsGetBusinessErrorState(error.toString()));
      print(error.toString());
    });
  }

  List<dynamic> science=[];

  void getScience()
  {
    if(science.length == 0)
      {
        emit(NewsScienceLoadingState());
        DioHealper.getData(
            url: 'v2/top-headlines',
            query:
            {
              'country':'us',
              'category':'science',
              'apiKey':'d2a5787712c44d9bba01ca0463791392 ',
            }
        ).then((value)
        {
          // print(value.data['totalResults']);
          science=value.data['articles'];
          //print(business[0]['title']);
          emit(NewsGetScienceSuccessState());
        }).catchError((error) {
          emit(NewsGetScienceErrorState(error.toString()));
          print(error.toString());
        });
      }else
        {
          emit(NewsGetScienceSuccessState());
        }

  }

  List<dynamic> sports=[];

  void getsports()
  {
    if(sports.length == 0)
      {
        emit(NewsSportsLoadingState());
        DioHealper.getData(
            url: 'v2/top-headlines',
            query:
            {
              'country':'us',
              'category':'sports',
              'apiKey':'d2a5787712c44d9bba01ca0463791392 ',
            }
        ).then((value)
        {
          // print(value.data['totalResults']);
          sports=value.data['articles'];
          //print(business[0]['title']);
          emit(NewsGetSportsSuccessState());
        }).catchError((error) {
          emit(NewsGetSportsErrorState(error.toString()));
          print(error.toString());
        });
      }
    else
      {
        emit(NewsGetSportsSuccessState());
      }
      }

  List<dynamic> search=[];

  void getSearch(String value)
  {
    emit(NewsSearchLoadingState());

    DioHealper.getData(
        url: 'v2/everything',
        query:
        {
          'q':'$value',
          'apiKey':'d2a5787712c44d9bba01ca0463791392 ',
        }
    ).then((value)
    {
      // print(value.data['totalResults']);
      search=value.data['articles'];
      //print(business[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      emit(NewsGetSearchErrorState(error.toString()));
      print(error.toString());
    });
  }

}


