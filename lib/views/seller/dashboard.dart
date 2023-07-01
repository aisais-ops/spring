//import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:spring/routes/routes.dart';
import 'package:spring/views/buyer/categorie.dart';
import 'package:spring/views/widgets/topBar.dart';
import '../widgets/appBar.dart';
import 'widgets/drawerVendeur.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DashboardLancher extends StatelessWidget {
  const DashboardLancher({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard(),
      routes: Routes.getRoutes(),
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() {
    return _Dashboard();
  }
}

class _Dashboard extends State<Dashboard> {
  late SharedPreferences prefs;
  String? userType;

  @override
  void initState() {
    super.initState();
    loadUserType();
  }

  Future<void> loadUserType() async {
    prefs = await SharedPreferences.getInstance();
    userType = prefs.getString('typeUser');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: //Stack(
          //children: [
          Scaffold(
        //appBar: myAppBar(context,'Dashboard'),

        drawer: myDrawer1(context),
        //drawer: userType == "acheteur" ? myDrawer(context) : myDrawer1(context),
        body: Column(
          children: <Widget>[
            /*top banare welcome to spring family*/
            const TopBar(),

            /*tool bar create store*/
            PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: myAppBar(context, 'dashboard',false) as Widget,
            ),

            //Expanded(
              /*child:*/ SingleChildScrollView(
                child: Column(children: [
                  /*top part Dashboard */
                  Card(
  child: Padding(
    padding: EdgeInsets.all(16.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Date',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Text 1',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Text 2',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
)


                  
                ]),
              ),
            //),

            // Rest of your widgets
          ],
        ),

      ),

      //],
      //),
    );
    ;
  }
}
