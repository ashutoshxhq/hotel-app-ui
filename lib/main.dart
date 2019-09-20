import 'package:flutter/material.dart';
import 'login.dart';
import 'welcome.dart';
import 'package:provider/provider.dart';
import 'models/auth.dart';
import 'models/tabs.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(Hatkestays());

class Hatkestays extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      MultiProvider(
        providers: [
          ChangeNotifierProvider(builder: (_) => Auth()),
          ChangeNotifierProvider(builder: (_) => Tabs()),
        ],
        child: Consumer<Auth>(
          builder: (context, counter, _) {
            return MaterialApp(
              title: 'Hatke Stays',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.teal,
              ),
              home: App(),
            );
          },
        ),
      );
  }
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  checkAuth() async{
    final prefs = await SharedPreferences.getInstance();
    if(prefs.getString('token') != null) {
      final token = prefs.getString('token');
      Provider.of<Auth>(context).changeToken(token);
      Provider.of<Auth>(context).login();
    }
    else{
      Provider.of<Auth>(context).logout();
    }
  }
  @override
  void initState(){
    super.initState();
    checkAuth();
  }
  @override
  Widget build(BuildContext context) {



    final auth = Provider.of<Auth>(context);
    return auth.state? WelcomeScreen() : LoginPage();
  }
}
