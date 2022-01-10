import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MassangerScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Row(
          children:
          [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage('https://scontent.fcai19-4.fna.fbcdn.net/v/t1.6435-9/203974730_2025836737558137_3449797998166222470_n.jpg?_nc_cat=102&ccb=1-4&_nc_sid=09cbfe&_nc_ohc=BaI3_M0RYp0AX8xuXJw&_nc_ht=scontent.fcai19-4.fna&oh=c812b4ea95214378b3db52273d569c96&oe=613793CB'),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
              ),
            )
          ],
        ),
        actions:
        [
          IconButton(onPressed: (){}, icon: CircleAvatar(
            radius: 15.0,
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.camera_alt,
              size:16.0,
              color: Colors.white,
            ),
          )),
          IconButton(onPressed: (){}, icon: CircleAvatar(
            radius: 15.0,
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.edit,
              size:16.0,
              color: Colors.white,
            ),
          ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey[300],
                ),
                padding: EdgeInsets.all(5.0),
                child: Row(
                  children:
                  [
                    Icon(
                        Icons.search
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Search',
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 100.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                    itemBuilder: ( context , index )
                    {
                      return buildStory();
                    },separatorBuilder: (context,index)
                  {
                    return SizedBox(
                      width: 10.0,
                    );
                  },
                  itemCount: 6,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemBuilder: (context,index)=>buildChatItem(),
                  separatorBuilder:(context,index)=> SizedBox(
                    height: 20.0,
                  ),
                  itemCount:15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildChatItem() {
  return Row(
    children:
    [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 29.0,
            backgroundImage: NetworkImage('https://scontent.fcai19-4.fna.fbcdn.net/v/t1.6435-9/203974730_2025836737558137_3449797998166222470_n.jpg?_nc_cat=102&ccb=1-4&_nc_sid=09cbfe&_nc_ohc=BaI3_M0RYp0AX8xuXJw&_nc_ht=scontent.fcai19-4.fna&oh=c812b4ea95214378b3db52273d569c96&oe=613793CB'),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              bottom: 3.0,
              end: 3.0,
            ),
            child: CircleAvatar(
              radius: 7.0,
              backgroundColor: Colors.green,
            ),
          ),

        ],
      ),
      SizedBox(
        width: 15.0,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Text(
              'Mahmoud Saeed',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              children:
              [
                Text(
                  'Hello my name is mahmoud.',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    width: 7.0,
                    height: 7.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Text(
                  '02.00 pm',
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

Widget buildStory(){
  return Container(
    width: 60.0,
    child: Column(
      children:
      [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 29.0,
              backgroundImage: NetworkImage('https://scontent.fcai19-4.fna.fbcdn.net/v/t1.6435-9/203974730_2025836737558137_3449797998166222470_n.jpg?_nc_cat=102&ccb=1-4&_nc_sid=09cbfe&_nc_ohc=BaI3_M0RYp0AX8xuXJw&_nc_ht=scontent.fcai19-4.fna&oh=c812b4ea95214378b3db52273d569c96&oe=613793CB'),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3.0,
                end: 3.0,
              ),
              child: CircleAvatar(
                radius: 7.0,
                backgroundColor: Colors.green,
              ),
            ),

          ],
        ),
        SizedBox(
          height: 6.0,
        ),
        Text(
          'Mahmoud Saeed',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}

