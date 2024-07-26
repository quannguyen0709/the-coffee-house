import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapAddressStore {
  final mapController = MapController();
  final URL_MAP_SERVER ;
  final MapOptions mapOptions =  MapOptions(
    keepAlive: true,

  );

  MapAddressStore({required this.URL_MAP_SERVER});

   Widget mapAddressWidget(LatLng latLng){
    return FlutterMap(options: mapOptions, children: [
      TileLayer(
        urlTemplate: URL_MAP_SERVER,
      ),
    ], mapController: mapController,

    );
  }




}



