import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_supercluster/flutter_map_supercluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:the_coffee_house_leanning/constants/extension.dart';
import 'package:the_coffee_house_leanning/pages/shop/logic.dart';

import '../../../config/theme/color/color_app.dart';
import '../../../config/theme/shape/shape_app.dart';

class MapWiget extends StatelessWidget {
  final URL_SERVER;

  final ShopController shopController;


  final mapController = MapController();

  final mapOption = MapOptions(
    keepAlive: true,
    interactiveFlags: InteractiveFlag.drag | InteractiveFlag.pinchZoom,
    center: LatLng(20.2, 105.51),
    zoom: 6.0,
    maxZoom: 18.0,
    minZoom: 5.5,
    maxBounds: LatLngBounds(
      LatLng(26.2, 95.51),
      LatLng(6.2, 115.51),
    ),
  );

  MapWiget({required this.URL_SERVER, required this.shopController});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
  }

  Widget MapContainer() {
    return FlutterMap(
      options: mapOption,
      children: [],
      mapController: mapController,
      nonRotatedChildren: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        ),
        // MarkerLayer(
        //   markers: List.generate(shopController.listStore.length, (index) {
        //     return Marker(
        //       height: 10.0.wp,
        //       width: 10.0.wp,
        //       point: LatLng(
        //           shopController.listStore
        //               .elementAt(index)
        //               .location
        //               .first
        //               .values
        //               .last,
        //           shopController.listStore
        //               .elementAt(index)
        //               .location
        //               .last
        //               .values
        //               .last),
        //       child: Icon(
        //         homePin,
        //         color: ColorApp.primaryColor,
        //         size: 7.0.wp,
        //       )
        //     );
        //   }),
        // ),
        culsterMarkerWidget(),

        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            width: 10.0.wp,
            margin: EdgeInsets.all(3.0.wp),
              child: toolWidget()),
        )
      ],
    );
  }

  Widget toolWidget() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [defineLocation(), toolZoomWidget()],
      ),
    );
  }

  Widget defineLocation() {
    return Container(
      padding: EdgeInsets.all(2.0.wp),
      decoration: BoxDecoration(
          color: ColorApp.backgourdWhite,
          borderRadius: BorderRadius.circular(ShapeApp.extraLarge),
          boxShadow: [
            BoxShadow(
                color: ColorApp.backgourdGrey.withOpacity(0.3),
                offset: Offset(1.0, 1.0),
                blurRadius: 5.0,
                blurStyle: BlurStyle.solid,
                spreadRadius: ShapeApp.small)
          ]),
      child: GestureDetector(
        onTap: () {
          mapController.move(LatLng(21.2, 105.51), 6.0);
        },
        child: Icon(
          Icons.explore_outlined,
          color: ColorApp.primaryColor,
          size: 6.0.wp,
        ),
      ),
    );
  }

  Widget toolZoomWidget() {
    return Container(
        margin: EdgeInsets.only(top: 3.0.wp),
        padding: EdgeInsets.all(2.0.wp),
        decoration: BoxDecoration(
            color: ColorApp.backgourdWhite,
            borderRadius: BorderRadius.circular(ShapeApp.extraLarge),
            boxShadow: [
              BoxShadow(
                  color: ColorApp.backgourdGrey.withOpacity(0.3),
                  offset: Offset(1.0, 1.0),
                  blurRadius: 5.0,
                  blurStyle: BlurStyle.solid,
                  spreadRadius: ShapeApp.small)
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                mapController.move(
                    mapController.center, mapController.zoom + 1.0);
              },
              child: Icon(
                Icons.add,
                color: ColorApp.primaryColor,
                size: 6.0.wp,
              ),
            ),
            Divider(),
            GestureDetector(
              onTap: () {
                mapController.move(
                    mapController.center, mapController.zoom - 1.0);
              },
              child: Icon(
                Icons.remove,
                color: ColorApp.primaryColor,
                size: 6.0.wp,
              ),
            )
          ],
        ));
  }

  Widget culsterMarkerWidget() {
    final homePin = Icons.home_filled;
    final listMarker = List.generate(shopController.listStore.length, (index) {
          return Marker(
            height: 10.0.wp,
            width: 10.0.wp,
            point: LatLng(
                shopController.listStore
                    .elementAt(index)
                    .location
                    .first
                    .values
                    .last,
                shopController.listStore
                    .elementAt(index)
                    .location
                    .last
                    .values
                    .last),
            child: GestureDetector(
              onTap: () {
                shopController.cilckAction(TypeAcotionShopPage.BLOCK_ITEM_STORE, shopController.listStore.elementAt(index));
              },
              child: Icon(
                homePin,
                color: ColorApp.primaryColor,
                size: 6.0.wp,
              ),
            )
          );
        });
    return SuperclusterLayer.mutable(
      initialMarkers: listMarker,
      clusterWidgetSize: const Size(40, 40),
      minimumClusterSize: 2,
      maxClusterRadius: 40.0.wp.toInt(),
      builder: (context, position, markerCount, extraClusterData) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.blue,
          ),
          child: Center(
            child: Text(
              markerCount.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
    },
      onMarkerTap: (marker) {
      },
      clusterSplayDelegate: SpreadClusterSplayDelegate(curve: Curves.bounceIn, duration: Durations.extralong1),
    );
  }
}
