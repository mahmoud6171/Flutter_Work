import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projs/layout/news_app/cubit/cubit.dart';
import 'package:projs/layout/news_app/news_layout.dart';
import 'package:projs/layout/shop_app/cubit/cubit.dart';
import 'package:projs/layout/shop_app/shop_layout.dart';
import 'package:projs/layout/todo_app/home_layout.dart';
import 'package:projs/modules/counter_screen/counter_screen.dart';
import 'package:projs/modules/home_screen/home_screen.dart';
import 'package:projs/modules/login/login_screen.dart';
import 'package:projs/modules/messenger/massanger_screen.dart';
import 'package:projs/modules/shop_app/login/login_screen.dart';
import 'package:projs/modules/shop_app/on_boarding/onboarding_app.dart';
import 'package:projs/modules/users/users_screen.dart';
import 'package:projs/shared/bloc_observed.dart';
import 'package:projs/shared/cubit/cubit.dart';
import 'package:projs/shared/cubit/states.dart';
import 'package:projs/shared/network/local/cache_healper.dart';
import 'package:projs/shared/styles/themes.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();

  Widget widget;

  bool isDark =CacheHelper.getData(key: 'isDark');

  bool onBoarding=CacheHelper.getData(key: 'onBoarding');
  String token=CacheHelper.getData(key: 'token');

  if(onBoarding != null)
    {
      if(token != null)
        widget=ShopLayout();
      else
        widget=ShopLoginScreen();
    }
  else
    widget = OnBoardingScreen();

  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {

  final bool isDark;
  final Widget startWidget;

  MyApp({
     required this.isDark,
     required this.startWidget,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (context) => NewsCubit()..getBusiness()..getScience()..getsports()),
        BlocProvider(create: (BuildContext context) =>AppCubit()..changeAppMode(fromShare: isDark,)),
        BlocProvider(create: (BuildContext context) =>ShopCubit()..getHomeData()),
      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state) {},
        builder: (context,state)
        {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: AppCubit().get(context).isDark? ThemeMode.dark : ThemeMode.light,
            home:startWidget,
          );
        },
      ),
    );
  }
}


