import 'package:flutter/material.dart';

class Defaulter {
  final String name;
  final String address;
  final String sr_name;
  final String schedule_date;
  final String schedule_amount;
  final String total_outstanding;
  final String aging;

  Defaulter(
      {this.name,
      this.address,
      this.sr_name,
      this.schedule_date,
      this.schedule_amount,
      this.total_outstanding,
      this.aging});

  factory Defaulter.fromJson(Map<String, dynamic> json) {
    return Defaulter(
        name: json['name'].toString(),
        address: json['address'].toString(),
        sr_name: json['sr_name'].toString(),
        schedule_date: json['schedule_date'].toString(),
        schedule_amount: json['schedule_amount'].toString(),
        total_outstanding: json['total_outstanding'].toString(),
        aging: json['aging'].toString());
  }
}
