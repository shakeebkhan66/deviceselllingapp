import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//Todo in this way you can design your Drawer
class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final imageUrl = "https://scontent.fmux2-1.fna.fbcdn.net/v/t1.6435-9/120306382_2881307795447737_7351099727672325329_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=19026a&_nc_eui2=AeHuJsfJDZrX3Rj2RPhGGmDUeGcvd6eGyZB4Zy93p4bJkKdr48jjtDyfsXcmsg5HPVUMPlBTjZy8sVFzsvYZ8IYr&_nc_ohc=XxsnWOT6BzUAX8VgKAR&_nc_ht=scontent.fmux2-1.fna&oh=14f7c843237dc85ef17f4dec0316a09b&oe=61662DE5";

    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                    margin: EdgeInsets.zero,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple
                    ),
                    accountName: Text(
                      "Shakeeb Khan",
                      style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black, fontSize: 17),
                      textScaleFactor: 1.0,
                    ),
                    accountEmail: Text("shakeebsun@gmail.com"),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(imageUrl),
                    )
                )
            ),
            Divider(
              height: 5.0,
              color: Colors.white,
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home, color: Colors.white,),
              title: Text("Home",
                textScaleFactor: 1.3,
                style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled, color: Colors.white,),
              title: Text("Profile",
                textScaleFactor: 1.3,
                style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail, color: Colors.white,),
              title: Text("Email me",
                textScaleFactor: 1.3,
                style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
