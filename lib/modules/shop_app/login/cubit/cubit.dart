import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projs/models/shop_app/login_model.dart';
import 'package:projs/modules/shop_app/login/cubit/states.dart';
import 'package:projs/network/end_points.dart';
import 'package:projs/network/remote/dio_healper.dart';

class ShopLoginCubit extends Cubit<ShopLoginState>
{
  ShopLoginCubit():super (ShopLoginInitialState());

  static ShopLoginCubit get(context)=>BlocProvider.of(context);

  ShopLoginModel? loginModel;

  void userLogin({
  required String email,
    required String password,
})
  {
    emit(ShopLoginLoadingState());
    DioHealper.postData(
        url: LOGIN,
        data:
        {
          'email':email,
          'password':password,
        }
        ).then((value) {
      print(value.data);

      loginModel= ShopLoginModel.FromJson(value.data);
      print(loginModel!.status);
      print(loginModel!.message);
      print(loginModel!.data!.token);

          emit(ShopLoginSuccessState(loginModel!));
    }).catchError( (error){
      print(error.toString());
      emit(ShopLoginErrorState(error.toString()));
    });
  }

  IconData suffix= Icons.visibility_outlined;
  bool isPassword=true;

  void changePasswordvisibilty()
  {
    isPassword=!isPassword;

    suffix= isPassword? Icons.visibility_outlined:Icons.visibility_off_outlined;

    emit(ShopChangePasswordVisibiltyState())  ;

  }

}