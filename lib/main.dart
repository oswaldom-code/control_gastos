//import 'dart:html';

//import 'dart:html';

import 'package:control_gastos/graph_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _controller;
  int currentPage = 9;

  @override
  void initState() {
    super.initState();
    _controller =
        PageController(initialPage: currentPage, viewportFraction: 0.40);
  }

  Widget _helperBottomAppBarAction(IconData icon) {
    return ClipOval(
      child: Material(
        color: Colors.white,
        child: InkWell(
          splashColor: Colors.grey[500], // inkwell color
          child: SizedBox(width: 50, height: 50, child: Icon(icon)),
          onTap: () {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10.0,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _helperBottomAppBarAction(FontAwesomeIcons.chartBar),
            _helperBottomAppBarAction(FontAwesomeIcons.chartPie),
            SizedBox(
              width: 30,
            ),
            _helperBottomAppBarAction(FontAwesomeIcons.wallet),
            _helperBottomAppBarAction(FontAwesomeIcons.cog),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: null),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          _selector(),
          _expenses(),
          _graph(),
          Container(
            color: Colors.blueAccent.withOpacity(0.15),
            height: 10.0,
          ),
          _list(),
        ],
      )),
    );
  }

  Widget _helperpageItem(String name, position) {
    var _alignment;
    if (position == currentPage) {
      _alignment = Alignment.center;
    } else {
      if (position < currentPage) {
        _alignment = Alignment.centerLeft;
      } else {
        _alignment = Alignment.centerRight;
      }
    }
    return Align(
      alignment: _alignment,
      child: position == currentPage
          ? Text(
              name,
              style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            )
          : Text(
              name,
              style: TextStyle(
                color: Colors.blueGrey.withOpacity(0.25),
                fontSize: 16,
              ),
            ),
    );
  }

  Widget _selector() {
    // ->> PageView
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox.fromSize(
        size: Size.fromHeight(25),
        child: PageView(
          onPageChanged: (newPage) {
            setState(() {
              currentPage = newPage;
            });
          },
          controller: _controller,
          children: [
            _helperpageItem('Enero', 0),
            _helperpageItem('Febrero', 1),
            _helperpageItem('Marzo', 2),
            _helperpageItem('Abril', 3),
            _helperpageItem('Mayo', 4),
            _helperpageItem('Junio', 5),
            _helperpageItem('Julio', 6),
            _helperpageItem('Agosto', 7),
            _helperpageItem('Septiembre', 8),
            _helperpageItem('Octubre', 9),
            _helperpageItem('Noviembre', 10),
            _helperpageItem('Diciembre', 11),
          ],
        ),
      ),
    );
  }
}

Widget _expenses() {
  return Column(
    children: <Widget>[
      Text(
        '\$2361.41',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
      ),
      Text(
        'Total expenses',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16),
      ),
    ],
  );
}

Widget _graph() {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Container(height: 200, child: GraphWidget()),
  );
}

Widget _item(IconData icon, String nombre, int percent, double value) {
  return Container(
    height: 60,
    child: ListTile(
      leading: Icon(
        icon,
        size: 25,
      ),
      title: Text(
        nombre,
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        '$percent% de expenses',
        style: TextStyle(color: Colors.blueGrey, fontSize: 14),
      ),
      trailing: Container(
        decoration: BoxDecoration(
            color: Colors.blueAccent.withOpacity(0.3),
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            value.toString() + ' \$',
            style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    ),
  );
}

int articuloItem = 1;

Widget _list() {
  return Expanded(
      child: ListView.separated(
          itemCount: 15,
          itemBuilder: (BuildContext contexto, int index) => _item(
              FontAwesomeIcons.shoppingCart, 'Nombre de articulo', 14, 2325.2),
          separatorBuilder: (BuildContext contexto, int index) {
            return Container(
              //Linea divisoria items
              color: Colors.blueAccent.withOpacity(0.15),
              height: 3.0,
            );
          }));
}
