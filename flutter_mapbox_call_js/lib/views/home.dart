import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mapbox_call_js/widgets/mapbox_map.dart';
import 'package:location/location.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text('Home'),
        SizedBox(
          width: 400,
          height: 400,
          child: MapboxMap(),
        ),
        SizedBox(
          width: 400,
          height: 400,
          child: MapboxMap(),
        )
      ],
    ));
  }
}
