import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mapbox_call_js/widgets/map.dart';

class MapboxMap extends StatefulWidget {
  MapboxMap({Key? key}) : super(key: key);
  String? uid;

  get getUid => uid;
  @override
  State<MapboxMap> createState() => _MOGOSMapState();
}

class _MOGOSMapState extends State<MapboxMap> {
  @override
  Widget build(BuildContext context) {
    var fclass = MMap();
    var buildedWidget = fclass.buildMap();
    print("ff ${fclass.uid}");
    widget.uid = fclass.uid;
    return buildedWidget;
  }
}
