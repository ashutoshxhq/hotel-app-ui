import 'package:flutter/material.dart';

class Invite extends StatefulWidget {
  @override
  _InviteState createState() => _InviteState();
}

class _InviteState extends State<Invite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invite & Earn',style: TextStyle(fontFamily: 'poppins-regular',fontWeight: FontWeight.w500),),
      ),
    );
  }
}
