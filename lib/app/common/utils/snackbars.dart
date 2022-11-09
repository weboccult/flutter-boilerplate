

import 'package:flutter/material.dart';


enum SnackBarType { ERROR, INFO, SUCCESS, WARNING }


///--> Get the SnackBar Color For different Response
 _getSnackBarColor(SnackBarType type) {
  return Colors.black;
  // switch (type) {
  //   case SnackBarType.ERROR:
  //     return AppColors.red;
  //   case SnackBarType.WARNING:
  //     return AppColors.red;
  //   case SnackBarType.INFO:
  //     return AppColors.darkBlue;
  //   case SnackBarType.SUCCESS:
  //     return AppColors.darkBlue;
  //   default:
  //     return AppColors.darkBlue;
  // }
}

///--> Get the SnackBar Icon For different Response
 _getSnackBarIcon(SnackBarType type) {
  /*switch (type) {
    case SnackBarType.ERROR:
      return Container(
          margin: const EdgeInsets.only(right: 10.0, bottom: 2.0),
          child: const Icon(Icons.error_rounded, color: Colors.white, size: 30.0));
    case SnackBarType.WARNING:
      return Container(
          margin: const EdgeInsets.only(right: 10.0, bottom: 2.0),
          child:
          const Icon(Icons.warning_rounded, color: Colors.white, size: 30.0));
    case SnackBarType.INFO:
      return Container(
        margin: const EdgeInsets.only(right: 10.0),
        child: SvgPicture.asset(
            AppAssets.iconCheckSquare,
            fit: BoxFit.contain,
            height: 20.0,
            color: HexColor.fromHex(AppColors.white)),
      );
    case SnackBarType.SUCCESS:
      return Container(
        margin: const EdgeInsets.only(right: 10.0),
        child: SvgPicture.asset(
            AppAssets.iconCheckSquare,
            fit: BoxFit.contain,
            height: 20.0,
            color: HexColor.fromHex(AppColors.white)),
      );
    default:
      return Container(
        margin: const EdgeInsets.only(right: 10.0),
        child: SvgPicture.asset(
            AppAssets.iconCheckSquare,
            fit: BoxFit.contain,
            height: 20.0,
            color: HexColor.fromHex(AppColors.white)),
      );
  }*/
}


///--> Show SnackBar
showSnackBar(
    {BuildContext? context,required String message, SnackBarType type = SnackBarType.SUCCESS}) {
  ///Clearing all Snack bars!!
  /*ScaffoldMessenger.of(context ?? Get.context!).clearSnackBars();
  ScaffoldMessenger.of(context ?? Get.context!).showSnackBar(
    SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          _getSnackBarIcon(type),
          Flexible(
              child: Text(message,
                  style: AppTheme.textTheme.headline5?.copyWith(color: HexColor.fromHex(AppColors.white)),
                  softWrap: true,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3)),
        ],
      ),
      backgroundColor: HexColor.fromHex(_getSnackBarColor(type)).withOpacity(0.85),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
      dismissDirection: DismissDirection.horizontal,
      duration: const Duration(milliseconds: 1500),
    ),
  );*/
}