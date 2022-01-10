import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projs/modules/todo_app/archived_task/archived_task_screen.dart';
import 'package:projs/modules/todo_app/done_task/done_task_screen.dart';
import 'package:projs/modules/todo_app/new_task/new_task_screen.dart';

import 'package:projs/shared/cubit/states.dart';
import 'package:projs/shared/network/local/cache_healper.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitalStates());

  AppCubit get(context) => BlocProvider.of(context);

  int curindex = 0;

  List<Widget> screens = [
    NewTask(),
    DoneTask(),
    ArchivedTask(),
  ];

  List<String> titles = [
    'New Task',
    'Done Task',
    'Archived Task',
  ];


  void changeIndex(index)
  {
    curindex = index;
    emit(AppChangeBottomNavBarState());
  }

  late Database database;
  List<Map>newtasks=[];
  List<Map>donetasks=[];
  List<Map>archivetasks=[];

  void createDatebase()  {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) async {
        database
            .execute(
            'CREATE TABLE Tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT,status TEXT)')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('Error when creating Table${error.toString()}');
        });
        print('Database created');
      },
      onOpen: (database) {
         getDataFromDatabase(database);
        print('Database opened');
      },
    );
  }

  Future insearttoDatebase({
    required String title,
    required String time,
    required String date,
  }) async {
    await database.transaction((txn) {
      txn.rawInsert(
          'INSERT INTO tasks(title,date,time,status)VALUES("$title","$date","$time","new")'
      ).then((value) {
        print('$value inserted succesfully');
        emit(AppInsertDateBaseState());
        getDataFromDatabase(database);
      }).catchError((error) {
        print('Error when Inserting new record ${error.toString()}');
      });
      throw '';
      // return null;
    });
  }

  void getDataFromDatabase(database) async {
    emit(AppGetDataBaseLoadingState());

    database.rawQuery('SELECT * FROM tasks').then((value)
    {

      value.forEach((element)
      {
        if(element['status']=='new')
          newtasks.add(element);
        else if(element['status']=='done')
          donetasks.add(element);
        else
          archivetasks.add(element);
      });

      emit(AppCreateDateBaseState());
    });
  }

  void UpdateData(
  {
    required String status,
    required int id,
}) async
  {
     database.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id]
     ).then((value)
     {
       emit(AppUpdateDateBaseState());
     });
  }

  bool isBottomSheet = false;

  bool isDark=false;

  void changeAppMode({bool? fromShare})
  {
    if(fromShare != null)
      {
        isDark=fromShare;
        emit(AppChangwModeState());
      }
    else
      {
        isDark=!isDark;
        CacheHelper.putData(key: 'isDark', value: isDark).then((value)
        {
          emit(AppChangwModeState());
        });
      }
  }


}


