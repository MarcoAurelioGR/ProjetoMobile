import 'package:flutter/material.dart';

class Footer {
  AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromRGBO(21, 198, 237, 1.0),
      toolbarHeight: 80.0,
      actions: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                // do something
              },
            ),
            Text('Home'),
          ],
        ),
        Padding(padding: EdgeInsets.only(right: 80)),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Transform.rotate(
              angle: 180 * 3.14 / 180,
              child: IconButton(
                icon: Icon(
                  IconData(62649, fontFamily: 'MaterialIcons'),
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  // do something
                },
              ),
            ),
            Text('Dicas'),
          ],
        ),
        Padding(padding: EdgeInsets.only(right: 80)),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: Icon(
                IconData(58447, fontFamily: 'MaterialIcons'),
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                //
              },
            ),
            Text('Notificacoes'),
          ],
        ),
        Padding(padding: EdgeInsets.only(right: 30)),
      ],
    );
  }
}
