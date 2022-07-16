import 'dart:convert';
import 'dart:html';
import 'dart:ui' as ui;
import 'dart:js' as js;

import 'package:flutter/material.dart';

class MMap {
  var uid;
  late IFrameElement _element;
  late js.JsObject _connector;

  void _registerViewFactory(Function(int) callback, int identifier) {
    js.context["connect_content_to_flutter"] = (content) {
      _connector = content;
    };
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory('map_$identifier', (int viewId) {
      _element = IFrameElement()
        ..src = 'assets/m_map.html'
        ..style.border = 'none'
        ..id = 'map_$identifier';

      return _element;
    });
  }

  Widget buildMap() {
    _registerViewFactory((p0) => null, hashCode);
    uid = 'map_$hashCode';
    print("uid : $uid");
    return HtmlElementView(viewType: 'map_$hashCode');
    // return Column(
    //   children: [
    //     SizedBox(
    //       child:
    //     ),
    //     ElevatedButton(
    //         onPressed: () {
    //           var jsonSource = {
    //             "type": "geojson",
    //             "data": {
    //               "type": "FeatureCollection",
    //               "features": [
    //                 {
    //                   "type": "Feature",
    //                   "properties": {
    //                     "iconImage": "017",
    //                     "textField": "Symbol",
    //                     "textSize": 17,
    //                     "textAnchor": "top",
    //                     "textOffset": [0, 0.8],
    //                     "textColor": "#000000",
    //                     "textHaloColor": "#ffffff",
    //                     "textHaloWidth": 2.8,
    //                     "textHaloBlur": 1,
    //                     "id": "QYlN9rfU1a"
    //                   },
    //                   "geometry": {
    //                     "type": "Point",
    //                     "coordinates": [126.89630699999998, 37.483169]
    //                   },
    //                   "id": "QYlN9rfU1a"
    //                 }
    //               ]
    //             }
    //           };

    //           var jsonLayer = {
    //             "id": "point",
    //             "type": "circle",
    //             "source": "my-data",
    //             "paint": {
    //               "circle-radius": 10,
    //               "circle-color": "#F84C4C", // red color
    //             },
    //           };
    //           js.JsObject.fromBrowserObject(_element)['contentWindow'].callMethod("setSource", ['my-data', jsonEncode(jsonSource)]);
    //           // js.JsObject.fromBrowserObject(_element)['contentWindow'].callMethod("getRouteV5", []);

    //           js.JsObject.fromBrowserObject(_element)['contentWindow'].callMethod("addLayer", [jsonEncode(jsonLayer)]);
    //         },
    //         child: Text('Call'))
  }
}
