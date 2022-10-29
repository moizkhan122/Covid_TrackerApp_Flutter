import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/WorldStateModel.dart';
import 'package:flutter_application_1/models/services/utilities/AppUrls.dart';

import 'package:http/http.dart' as http;

class StateServices{
          //with model
  Future<WorldStateModel> FetchWorldStateRecord()async{
    final responce = await http.get(Uri.parse(AppUrl.worldStateUri));

    if(responce.statusCode ==  200){
      var data = jsonDecode(responce.body);
      return WorldStateModel.fromJson(data);
    }else{
      throw Exception("Error");
    }
  }
      //without model
  Future <List<dynamic>> FetchCountryRecord()async{
    var data;
    final responce = await http.get(Uri.parse(AppUrl.countryList));

    if(responce.statusCode ==  200){
      data = jsonDecode(responce.body);
      return data;
    }else{
      throw Exception("Error");
    }
  }
}