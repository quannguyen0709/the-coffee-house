import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

enum TypeInternet { WIFI, MOBILE, NONE }

class CheckInernet extends GetxService {
  bool isShoDialog = false;
  Connectivity connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> streamSubscription;
  @override
  Future<CheckInernet> onInit() async{
    // TODO: implement onInit
    super.onInit();
    streamSubscription = connectivity.onConnectivityChanged
            .listen((List<ConnectivityResult> result) {
              onCheckTypeInternet(result);
        });
    return this;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    streamSubscription.cancel();
  }

  void onCheckTypeInternet(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.mobile)) {
      print("Mobile");
      onShow(TypeInternet.MOBILE);
      // Mobile network available.
    } else if (result.contains(ConnectivityResult.wifi)) {
      print("wifi");
      onShow(TypeInternet.WIFI);
      // Wi-fi is available.
      // Note for Android:
      // When both mobile and Wi-Fi are turned on system will return Wi-Fi only as active network type
    } else if (result.contains(ConnectivityResult.ethernet)) {
      // Ethernet connection available.
    } else if (result.contains(ConnectivityResult.vpn)) {
      // Vpn connection active.
      // Note for iOS and macOS:
      // There is no separate network interface type for [vpn].
      // It returns [other] on any device (also simulator)
    } else if (result.contains(ConnectivityResult.bluetooth)) {
      // Bluetooth connection available.
    } else if (result.contains(ConnectivityResult.other)) {
      // Connected to a network which is not in the above mentioned networks.
    } else if (result.contains(ConnectivityResult.none)) {
      print('none');
      onShow(TypeInternet.NONE);
      // No available network types
    }
  }


  void onShow(TypeInternet typeInternet){
    switch (typeInternet){
      case TypeInternet.MOBILE:
         Fluttertoast.showToast(msg: "internet by 3g", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      case TypeInternet.WIFI:
        Fluttertoast.showToast(msg: "internet by wifi", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      case TypeInternet.NONE:
        Fluttertoast.showToast(msg: "internet disconect", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);

        // TODO: Handle this case.
    }


  }
}
