import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class ApiProvider {
  final String _baseUrl = "https://dev.sortstring.in/api/";

  Future<dynamic> get(String url) async {
      final responseJson = await http.get(_baseUrl + url);
      return responseJson;
  }
}