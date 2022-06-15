import 'package:flutter/material.dart';


Color kBackgroundColor =  const Color(0XFF1A2232);

Map<int,Color> _primaryColor = {
  50: const Color(0XFFFCDF03).withOpacity(0.1),
  100: const Color(0XFFFCDF03).withOpacity(0.2),
  200: const Color(0XFFFCDF03).withOpacity(0.3),
  300: const Color(0XFFFCDF03).withOpacity(0.4),
  400: const Color(0XFFFCDF03).withOpacity(0.5),
  500: const Color(0XFFFCDF03).withOpacity(0.6),
  600: const Color(0XFFFCDF03).withOpacity(0.7),
  700: const Color(0XFFFCDF03).withOpacity(0.8),
  800: const Color(0XFFFCDF03).withOpacity(0.9),
  900: const Color(0XFFFCDF03)
};

final MaterialColor kPrimaryColor = MaterialColor(0XFFFCDF03, _primaryColor);

Map<int,Color> _secondaryColor = {
  50: const Color(0XFF070D30).withOpacity(0.1),
  100: const Color(0XFF070D30).withOpacity(0.2),
  200: const Color(0XFF070D30).withOpacity(0.3),
  300: const Color(0XFF070D30).withOpacity(0.4),
  400: const Color(0XFF070D30).withOpacity(0.5),
  500: const Color(0XFF070D30).withOpacity(0.6),
  600: const Color(0XFF070D30).withOpacity(0.7),
  700: const Color(0XFF070D30).withOpacity(0.8),
  800: const Color(0XFF070D30).withOpacity(0.9),
  900: const Color(0XFF070D30)
};

final MaterialColor kSecondaryColor = MaterialColor(0XFF070D30, _secondaryColor);

Color kSkelenton = Colors.black.withOpacity(0.4);

Color kBGColor = const Color(0XFF1A2232);