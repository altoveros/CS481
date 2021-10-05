/*Citation:
  GoogleMaps API:
    https://codelabs.developers.google.com/codelabs/google-maps-in-flutter#2
    https://medium.com/@rajesh.muthyala/flutter-with-google-maps-and-google-place-85ccee3f0371
    https://developers.google.com/places/web-service/search
    https://stackoverflow.com/questions/56208104/get-marker-from-json-file-and-show-on-googlemap
*/

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class ParkMap extends StatefulWidget {
  @override
  _ParkMapState createState() => _ParkMapState();
}

class _ParkMapState extends State<ParkMap> {
  LatLng latlng = LatLng(
      33.132359919628875,
      -117.15980678154757
  );
  Iterable markers = [];

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    try {
      final response =
      await http.get('https://maps.googleapis.com/maps/api/place/textsearch/json?query=dog+park&location=33.1284381,-117.1578434&radius=10000&key=AIzaSyCea__1_lg7NhgchuV5YERTKpPN0s0x8Ew');

      final int statusCode = response.statusCode;

      if (statusCode == 201 || statusCode == 200) {
        Map responseBody = json.decode(response.body);
        List results = responseBody["results"];

        Iterable _markers = Iterable.generate(10, (index) {
          Map result = results[index];
          Map location = result["geometry"]["location"];
          LatLng latLngMarker = LatLng(location["lat"], location["lng"]);
          String name = result["name"].toString();
          String address = result["formatted_address"].toString();

          return Marker(
            markerId: MarkerId("marker$index"),
            position: latLngMarker,
            infoWindow: InfoWindow(title: name, snippet: address),
          );
        });

        setState(() {
          markers = _markers;
        });
      } else {
        throw Exception('Error');
      }
    } catch(e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dog Parks Nearby"),
      ),
      body: GoogleMap(
        markers: Set.from(
          markers,
        ),
        initialCameraPosition: CameraPosition(target: latlng, zoom: 11.0),
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {},
      ),
    );
  }
}

