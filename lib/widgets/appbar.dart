import 'dart:ui';

import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(title: Text('Mini Pokédex',style: TextStyle(
      inherit: true,
      fontSize: 32,
      color: Colors.yellow[600],
      fontFamily: 'NUnit' ,
      shadows: [
        Shadow( // bottomLeft
            offset: const Offset(-2, -2),
            color: Colors.blue[900]!
        ),
        Shadow( // bottomRight
            offset: const Offset(2, -2),
            color: Colors.blue[700]!
        ),
        Shadow( // topRight
            offset: const Offset(2, 2),
            color: Colors.blue[700]!
        ),
        Shadow( // topLeft
            offset: const Offset(-2, 2),
            color: Colors.blue[700]!
        ),
      ]
  ) ,),
    backgroundColor: Colors.red[900],
  );
}
