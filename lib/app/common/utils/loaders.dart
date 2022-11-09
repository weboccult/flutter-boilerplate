import 'package:flutter/material.dart';

import '../services/navigation/navigation.dart';


abstract class CustomLoaders {

  static customLoader() {
    return Center(
      child: Container(
        width: 50.0,
        height: 50.0,
        alignment: Alignment.center,
        child:  const CircularProgressIndicator(
          valueColor:  AlwaysStoppedAnimation<Color>(Colors.black),
        ) ,
      ),
    );
  }


  static bool isLoading = false;
  static getXLoader({bool? show}) {
    if (show!) {
      isLoading = show;
      showDialog(context: navigationService.context, builder: (context) {
        return WillPopScope(
          onWillPop: () => Future.value(false),
          child: const Center(
            child:  CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            ) ,
          ),
        );
      },);
    } else {
      if(isLoading) {
        isLoading = show;
        navigationService.back();
      }
    }
  }



  static Widget imageLoadingBuilder(BuildContext context, Widget child,
      ImageChunkEvent? loadingProgress) {
    if (loadingProgress == null) return child;
    return Center(
      child: SizedBox(
        width: 20.0,
        height: 20.0,
        child: CircularProgressIndicator(
          color: Colors.black,
          value: loadingProgress.expectedTotalBytes != null
              ? loadingProgress.cumulativeBytesLoaded /
              loadingProgress.expectedTotalBytes!
              : null,
          strokeWidth: 1.5,
        ),
      ),
    );
  }




}
