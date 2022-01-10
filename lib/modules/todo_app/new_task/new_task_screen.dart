import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projs/shared/component/components.dart';
import 'package:projs/shared/component/constaints.dart';
import 'package:projs/shared/cubit/cubit.dart';
import 'package:projs/shared/cubit/states.dart';

class NewTask extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     return BlocConsumer<AppCubit,AppStates>(
       listener: (context,state){},
       builder:(context,state)
       {
         var tasks= AppCubit().get(context).newtasks;
         return ListView.separated(
             itemBuilder: (context,index)=>buildTaskItem(tasks[index],context),
             separatorBuilder: (context,index)=>Container(
               width: double.infinity,
               height: 1.0,
               color: Colors.grey[300],
             ),
             itemCount:tasks.length);
       },
     );
  }
}
