import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Container(
          height: 100,
          width: double.infinity,
          padding: EdgeInsets.only(top: 20, left: 20),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromRGBO(11, 193, 191, 1),
                const Color(0xFF00CCFF),
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 2.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
          child: Text(
            'Cooking UP',
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize: 28, color: Colors.white),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ListTile(
          leading: Icon(Icons.restaurant, size: 26),
          title: Text(
            'Meals',
            style: TextStyle(fontFamily: 'RobotoCondensed', fontSize: 22),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        ListTile(
          leading: Icon(Icons.settings, size: 26),
          title: Text(
            'Filters',
            style: TextStyle(fontFamily: 'RobotoCondensed', fontSize: 22),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/filters');
          },
        )
      ],
    ));
  }
}
