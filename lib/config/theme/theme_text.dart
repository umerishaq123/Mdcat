import 'package:flutter/material.dart';
import 'package:mdcat_kawiish/all_imports.dart';

class Themetext {
  Themetext._();
  static const double smallSize = 12.0;
  static const double mediumeSize = 14.0;
  static const double largeSize = 18.0;
  static const double extraLargeSize = 24.0;

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge:const TextStyle().copyWith(fontSize: 32.0, fontWeight: FontWeight.bold, color: Themecolor.black,),
    headlineMedium:const TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w600, color: Themecolor.black,),
 headlineSmall:const TextStyle().copyWith(fontSize: 18.0, fontWeight: FontWeight.w600, color: Themecolor.black,),
   
   
    titleLarge:const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w600, color: Themecolor.black,),
    titleMedium:const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w500, color: Themecolor.black,),
    titleSmall:const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w400, color: Themecolor.black,),
   
    bodyLarge:const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: Themecolor.black,),
    bodyMedium:const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.normal, color: Themecolor.black,),
    bodySmall:const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: Themecolor.black.withOpacity(0.5),),
    
    labelLarge:const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: Themecolor.black),
    labelMedium:const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: Themecolor.black.withOpacity(0.5),),
    
    
   
  );

  static TextTheme darkTextTheme =  TextTheme(
    headlineLarge:const TextStyle().copyWith(fontSize: 32.0, fontWeight: FontWeight.bold, color: Themecolor.white,),
    headlineMedium:const TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w600, color: Themecolor.white,),
    headlineSmall:const TextStyle().copyWith(fontSize: 18.0, fontWeight: FontWeight.w600, color: Themecolor.white,),
   
   
    titleLarge:const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w600, color: Themecolor.white,),
    titleMedium:const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w500, color: Themecolor.white,),
    titleSmall:const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w400, color: Themecolor.white,),
   
    bodyLarge:const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: Themecolor.white,),
    bodyMedium:const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.normal, color: Themecolor.white,),
    bodySmall:const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: Themecolor.white.withOpacity(0.5),),
    
    labelLarge:const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: Themecolor.white),
    labelMedium:const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: Themecolor.white.withOpacity(0.5),),
    
    
   
  );

}