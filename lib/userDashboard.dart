import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'main.dart';
import 'test.dart';

class UserDashboard extends StatefulWidget {
  UserDashboard({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    screen1(),
    Text(
      'Index 1: Search',
      style: optionStyle,
    ),
    Text(
      'Index 2: Account',
      style: optionStyle,
    ),
  ];

  static int i;

  @override
  Widget build(BuildContext context) {
    final backButton = MaterialButton(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      },
      child: Text("Go Back to Home",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
    );
    final iconList = DefaultTextStyle.merge(
      style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),
      child: Container(
        // padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text('Deliver features faster', textAlign: TextAlign.center),
              ],
            ),
            Column(
              children: [
                Text('Craft beautiful UIs', textAlign: TextAlign.center),
              ],
            ),
            Column(
              children: [
                FittedBox(
                  fit: BoxFit.contain, // otherwise the logo will be tiny
                  child: const FlutterLogo(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return MaterialApp(
      title: 'My Dashboard',
      theme: ThemeData.light().copyWith(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout demo'),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('Settings'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  // final Widget searchPage = Widget searchPage(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //         title: Text('Search Store'),
  //         actions: <Widget>[IconButton(icon: Icon(Icons.search))]),
  //     body: Center(
  //       child: Container(
  //         color: Colors.white,
  //         margin: new EdgeInsets.all(15.0),
  //         child: new Form(
  //           key: _formKey,
  //           //autovalidate: _autoValidate,
  //           child: Text('Search Page'),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  static Widget screen1() {
    final descTextStyle = TextStyle(
      color: Colors.deepOrange,
      fontWeight: FontWeight.w800,
      fontFamily: 'Monsterrat',
      letterSpacing: 0.5,
      fontSize: 10,
      //height: 2,
    );
    final labelTextStyle = TextStyle(
      color: Colors.black,
      //fontWeight: FontWeight.w800,
      fontFamily: 'Monsterrat',
      letterSpacing: 0.5,
      fontSize: 10,
      //height: 2,
    );
    final lightTextStyle = TextStyle(
      color: Colors.blueGrey,
      // fontWeight: FontWeight.w800,
      fontFamily: 'Monsterrat',
      letterSpacing: 0.5,
      fontSize: 10,
      //height: 2,
    );
    // final googleMaps = new Container(
    //   child: Icon(Icons.location_on, color: Colors.blueGrey[300]),
    //   // IconButton(
    //   //   color: Colors.deepOrange,
    //   //   focusColor: Colors.lightGreenAccent,
    //   //   icon: Icon(Icons.location_on),
    //   //   onPressed: () {},
    //   // ),
    // );

    launchURL() async {
      const url = 'https://flutter.dev';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    final bookSlotBtn = new Container(
      width: 20.0,
      height: 20.0,
      child: IconButton(
        //minWidth: MediaQuery.of(context).size.width,,
        //iconSize: 1,
        //minWidth: 5.0,
        alignment: Alignment.center,
        //color: Colors.greenAccent,
        padding: EdgeInsets.all(0),
        onPressed: () => {},
        highlightColor: Colors.deepOrange[300],
        //padding: EdgeInsets.all(10.0),
        icon: Icon(
          Icons.date_range,
          color: Colors.blueGrey,
        ),
        //Text("Open Maps"),
      ),
    );
    final iconList =
        //  DefaultTextStyle.merge(
        //   style: descTextStyle,
        //   child:
        new Container(
      // padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      //margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Icon(Icons.play_circle_filled, color: Colors.blueGrey[300]),
              Text('Opens at:', style: labelTextStyle),
              Text('9:00 am', style: lightTextStyle),
            ],
          ),
          Row(
            children: [
              //Icon(Icons.pause_circle_filled, color: Colors.blueGrey[300]),
              Text('Closes at:', style: labelTextStyle),
              Text('10:00 pm', style: lightTextStyle),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                width: 20.0,
                height: 20.0,
                child: IconButton(
                  //minWidth: MediaQuery.of(context).size.width,,
                  //iconSize: 1,
                  //minWidth: 5.0,
                  alignment: Alignment.center,
                  //color: Colors.greenAccent,
                  padding: EdgeInsets.all(0),
                  onPressed: () => {
                    launchURL(),
                  },
                  highlightColor: Colors.deepOrange[300],
                  //padding: EdgeInsets.all(10.0),
                  icon: Icon(
                    Icons.location_on,
                    color: Colors.blueGrey,
                  ),
                  //Text("Open Maps"),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[bookSlotBtn],
          ),
        ],
      ),
    );
    final storeIcon = new Container(
        // decoration: new BoxDecoration(
        //   border: Border.all(
        //     color: Colors.deepOrangeAccent,
        //   ),
        // ),
        child: new Container(
      margin: EdgeInsets.all(10),
      //color: Colors.grey[200],

      //width: 440,
      alignment: Alignment.center,
      decoration: ShapeDecoration(
        shape: CircleBorder(),
        color: Colors.deepOrange[300],
      ),

      child: Icon(
        Icons.shopping_cart,
        color: Colors.white,
        size: 40,
      ),
    ));

    final storeDetailsText = Container(
      padding: EdgeInsets.fromLTRB(0, 5, 5, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Vijetha store in vihanga',
            style: TextStyle(
              color: Colors.black87,
              //fontWeight: FontWeight.w800,
              fontFamily: 'Monsterrat',
              letterSpacing: 0.5,
              fontSize: 20,
            ),
          ),
          Text(
            'My Home Vihanga, Financial district, Gachibowli',
            style: TextStyle(
              color: Colors.grey[150],
              //fontWeight: FontWeight.w800,
              fontFamily: 'Monsterrat',
              letterSpacing: 0.5,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
    final storeDaysOpen = DefaultTextStyle.merge(
      style: descTextStyle,
      child: Container(
        //padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Icon(Icons.remove_circle, color: Colors.blueGrey[300]),
              ],
            ),
            Column(
              children: [
                Icon(Icons.add_circle, color: Colors.lightGreen[300]),
              ],
            ),
            Column(
              children: [
                Icon(Icons.remove_circle, color: Colors.blueGrey[300]),
              ],
            ),
            Column(
              children: [
                Icon(Icons.remove_circle, color: Colors.blueGrey[300]),
              ],
            ),
            Column(
              children: [
                Icon(Icons.remove_circle, color: Colors.blueGrey[300]),
              ],
            ),
            Column(
              children: [
                Icon(Icons.remove_circle, color: Colors.blueGrey[300]),
              ],
            ),
            Column(
              children: [
                Icon(Icons.remove_circle, color: Colors.blueGrey[300]),
              ],
            ),
          ],
        ),
      ),
    );
    final storeInfo = new Container(
        padding: EdgeInsets.fromLTRB(10.0, 5.0, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            storeDetailsText,
            storeDaysOpen,
          ],
        ));
    final firstRow = new Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          storeIcon,
          storeInfo,
        ],
      ),
    );

    final secondRow = new Container(
      //margin: EdgeInsets.all(5),

      child: iconList,
      // Row(
      //   //crossAxisAlignment: CrossAxisAlignment.,
      //   //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: [
      //     iconList,
      //   ],
      // ),
    );

    return Center(
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
        height: 120,
        child: Card(
          elevation: 10,
          child: new Column(
            children: <Widget>[firstRow, secondRow],
          ),
        ),
      ),
    );

    //     Text('In Cont Screen 1'),
    //   alignment: Alignment.center,
    // );
  }
}
