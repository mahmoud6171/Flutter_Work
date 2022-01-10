import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projs/layout/news_app/cubit/states.dart';
import 'package:projs/modules/news_app/search/search_screen.dart';
import 'package:projs/network/remote/dio_healper.dart';
import 'package:projs/shared/component/components.dart';
import 'package:projs/shared/cubit/cubit.dart';

import 'cubit/cubit.dart';

class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        var cubit=NewsCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'News App',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions:
            [
              IconButton(onPressed: ()
              {
                navigateTo(context, SearchScrean());
              }, icon: Icon(Icons.search)),
              IconButton(onPressed: ()
              {
                AppCubit().get(context).changeAppMode();
              }, icon: Icon(Icons.dark_mode)),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items:cubit.bottomItems,

            onTap: (index)
            {
              cubit.changeBottomBar(index);
            },
            currentIndex: cubit.currentIndex,

          ),

        );
      },
    );
  }
}
