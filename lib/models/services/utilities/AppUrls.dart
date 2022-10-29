import 'package:flutter/material.dart';

class AppUrl{
  //our base url
  static const String baseurl = 'https://disease.sh/v3/covid-19/';

  //fetch world covid state
  static const String worldStateUri = baseurl+'all';
  static const String countryList = baseurl+'countries';

}