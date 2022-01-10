import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
        ),
        title: Text(
          'First App',
        ),
        actions: [
          IconButton(
              onPressed: () {
                print('icon notifiction is pressed');
              },
              icon: Icon(
                Icons.notification_important,
              )),

        ],
      ),
      body: Column(
        children:
        [
          Container(
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(20.0)
              ),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Stack(
              children: [
                Image(
                  image: NetworkImage(
                    'https://i.redd.it/7kely2iwhl351.jpg'
                  ),
                  width: 250,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Container(
                  color: Colors.black,
                  width: double.infinity,
                  padding: EdgeInsetsDirectional.only(
                    top: 5,
                    start: 5,
                    bottom: 7,
                  ),
                  child: Text(
                    'Setup Gaming',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white
                  ),
                  ),
                )
              ],
            ),
          ),
        ],

      ),
    );
  }
}
