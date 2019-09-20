import 'package:flutter/material.dart';
import '../invite.dart';
import 'package:provider/provider.dart';
import '../models/tabs.dart';
import '../models/auth.dart';
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(87.5),
                      border: Border.all(
                          color: Colors.white,
                          style: BorderStyle.solid,
                          width: 3.0),
                      image: DecorationImage(
                          image: AssetImage('assets/images/ashutosh.jpg'))),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Ashutosh Dubey',
                        style: TextStyle(
                            fontFamily: 'poppins-regular',
                            fontSize: 25.0,
                            //fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
          ),
          ListTile(
            title: Text('My Bookings'),
            leading: Icon(Icons.card_travel),
            onTap: () {
              Provider.of<Tabs>(context).changeIndex(2);
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            title: Text('Saved Hotels'),
            leading: Icon(Icons.folder_open),
            onTap: () {
              Provider.of<Tabs>(context).changeIndex(1);
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            title: Text('Invite and Earn'),
            leading: Icon(Icons.whatshot),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Invite()),
              );

            },
          ),
          Divider(),
          ListTile(
            title: Text('Profile'),
            leading: Icon(Icons.face),
            onTap: () {
              Provider.of<Tabs>(context).changeIndex(3);
              Navigator.pop(context);
            },
          ),

          Divider(),
          ListTile(
            title: Text('Logout'),
            leading: Icon(Icons.lock_open),
            onTap: () {
              Provider.of<Auth>(context).logout();
              Navigator.pop(context);
            },
          ),
          Divider()
        ],
      ),
    );
  }
}
