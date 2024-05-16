import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_coffee_house_leanning/constants/extension.dart';
import 'package:toastification/toastification.dart';

enum TypeInternet { WIFI, MOBILE, NONE, NULL }

class CheckInernet extends GetxService {
  bool checkInternet = false;
  bool checkInternetCurrent = false;
  Connectivity connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> streamSubscription;
  BuildContext context;
  TypeInternet? type;

  CheckInernet({required this.context});

  @override
  Future<CheckInernet> onInit() async {
    // TODO: implement onInit
    super.onInit();

     streamSubscription = connectivity.onConnectivityChanged
             .listen((List<ConnectivityResult> result) {
               type = onCheckTypeInternet(result);
               if(checkInternet == !checkInternetCurrent ){
                 checkInternetCurrent = checkInternet;
                 onShow(type!);
               }
         });
    return this;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    streamSubscription.cancel();
  }


  Future<bool> voidCheckInternet() async {
    onCheckTypeInternet(await connectivity.checkConnectivity());
    return checkInternet;
  }

  TypeInternet? onCheckTypeInternet(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.mobile)) {
      print("Mobile");
      //onShow(TypeInternet.MOBILE);
      checkInternet = true;
      return TypeInternet.MOBILE;
      // Mobile network available.
    } else if (result.contains(ConnectivityResult.wifi)) {
      print("wifi");
      //onShow(TypeInternet.WIFI);
      checkInternet = true;
      return TypeInternet.WIFI;
      // Wi-fi is available.
      // Note for Android:
      // When both mobile and Wi-Fi are turned on system will return Wi-Fi only as active network type
    } else if (result.contains(ConnectivityResult.ethernet)) {
      // Ethernet connection available.
    } else if (result.contains(ConnectivityResult.vpn)) {
      return TypeInternet.NULL;
      // Vpn connection active.
      // Note for iOS and macOS:
      // There is no separate network interface type for [vpn].
      // It returns [other] on any device (also simulator)
    } else if (result.contains(ConnectivityResult.bluetooth)) {
      return TypeInternet.NULL;
      // Bluetooth connection available.
    } else if (result.contains(ConnectivityResult.other)) {
      return TypeInternet.NULL;
      // Connected to a network which is not in the above mentioned networks.
    } else if (result.contains(ConnectivityResult.none)) {
      checkInternet = false;
      print('none');
      return TypeInternet.NONE;
      //onShow(TypeInternet.NONE);
      // No available network types
    }
  }

  void onShow(TypeInternet typeInternet) {
    switch (typeInternet) {
      case TypeInternet.MOBILE:
        toastification.show(
          context:  context,
          title: Text("Internet by Mobile"),
          autoCloseDuration: Duration(seconds: 5),
          type: ToastificationType.success,
          style: ToastificationStyle.flatColored,
          animationDuration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          alignment: Alignment.bottomCenter,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0x07000000),
              blurRadius: 16,
              offset: Offset(0, 16),
              spreadRadius: 0,
            )
          ],
          showProgressBar: false,
          closeButtonShowType: CloseButtonShowType.always,
          closeOnClick: false,
          pauseOnHover: false,
          dragToClose: true,
          applyBlurEffect: true,

        );
      case TypeInternet.WIFI:
        toastification.show(
          context:  context,
          title: Text("Internet by Wifi"),
          autoCloseDuration: Duration(seconds: 5),
          type: ToastificationType.success,
          style: ToastificationStyle.flatColored,
          animationDuration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          alignment: Alignment.bottomCenter,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0x07000000),
              blurRadius: 16,
              offset: Offset(0, 16),
              spreadRadius: 0,
            )
          ],
          showProgressBar: false,
          closeButtonShowType: CloseButtonShowType.always,
          closeOnClick: false,
          pauseOnHover: false,
          dragToClose: true,
          applyBlurEffect: true,
        );
      case TypeInternet.NONE:
        toastification.show(
          context:  context,
          title: Text("Internet disconnet"),
          autoCloseDuration: Duration(seconds: 5),
          type: ToastificationType.error,
          style: ToastificationStyle.flatColored,
          animationDuration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          alignment: Alignment.bottomCenter,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0x07000000),
              blurRadius: 16,
              offset: Offset(0, 16),
              spreadRadius: 0,
            )
          ],
          showProgressBar: false,
          closeButtonShowType: CloseButtonShowType.always,
          closeOnClick: false,
          pauseOnHover: false,
          dragToClose: true,
          applyBlurEffect: true,
        );
      case TypeInternet.NULL:

      // TODO: Handle this case.
    }
  }
}
