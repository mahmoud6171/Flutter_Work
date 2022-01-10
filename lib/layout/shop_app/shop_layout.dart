import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projs/layout/shop_app/cubit/cubit.dart';
import 'package:projs/layout/shop_app/cubit/states.dart';
import 'package:projs/modules/shop_app/search/search_screen.dart';
import 'package:projs/shared/component/components.dart';

class ShopLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        var cubit=ShopCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Taswak',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            actions:
            [
              IconButton(
                  onPressed: ()
                  {
                    navigateTo(context, SearchScreen());
                  }
                  , icon: Icon(Icons.search),
              ),
            ],
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index)
            {
              cubit.changeIndex(index);
            },
            currentIndex: cubit.currentIndex,
            items:
            [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
              label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.apps),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favourite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              )
            ],
          ),
        );
      },
    );
  }
}
