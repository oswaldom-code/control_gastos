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

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);
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
}

Widget _selector() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox.fromSize(
      size: Size.fromHeight(15),
      child: PageView(
        children: [
          Text('Enero',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          Text('Febrero',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          Text('Marzo',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          Text('Abril',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          Text('Mayo',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          Text('Junio',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          Text('Julio',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          Text('Agosto',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          Text('Septiembre',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          Text('Octubre',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          Text('Noviembre',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          Text('Diciembre',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
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

Widget _list() {
  return Expanded(
      child: ListView.separated(
          itemCount: 15,
          itemBuilder: (BuildContext contexto, int index) =>
              _item(FontAwesomeIcons.shoppingCart, 'Hola mundo', 14, 2325.2),
          separatorBuilder: (BuildContext contexto, int index) {
            return Container(
              //Linea divisoria items
              color: Colors.blueAccent.withOpacity(0.15),
              height: 3.0,
            );
          }));
}
