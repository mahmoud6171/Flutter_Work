import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projs/layout/shop_app/cubit/states.dart';
import 'package:projs/models/shop_app/home_model.dart';
import 'package:projs/modules/news_app/settings/settings_screen.dart';
import 'package:projs/modules/shop_app/catogries/catogries_screen.dart';
import 'package:projs/modules/shop_app/favourits/favourits_screen.dart';
import 'package:projs/modules/shop_app/products/products_screen.dart';
import 'package:projs/network/end_points.dart';
import 'package:projs/network/remote/dio_healper.dart';
import 'package:projs/shared/component/components.dart';

class ShopCubit extends Cubit<ShopStates>
{
  ShopCubit():super (ShopInitalState());

  static ShopCubit get(context) =>BlocProvider.of(context);

  int currentIndex=0;

  List<Widget> bottomScreens=
  [
    ProductsScreen(),
    CatogriesScreen(),
    FavouritsScreen(),
    SettingsScreen(),
  ];

  void changeIndex(int index)
  {
    currentIndex=index;
    emit(ShopChangeBottomNavState());
  }

  HomeModel? homeModel;

  void getHomeData()
  {
    emit(ShopLoadingHomeDataState());

    DioHealper.getData(url: HOME).then((value){
      homeModel=HomeModel.FromJson(value.data);

      //printFullText(homeModel.toString());
      print(homeModel.toString());

      emit(ShopSuccessHomeDataState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorHomeDataState());
    });
  }

}