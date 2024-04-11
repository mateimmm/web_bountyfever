import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

int addtoprice(
  int currentprice,
  double newvalue,
) {
  // add a total value as result of currentprice + newvalue
  return currentprice + newvalue.toInt();
}

int addtopriceinteger(
  int currentprice,
  int newvalue,
) {
  // add a total value as result of currentprice + newvalue
  return currentprice + newvalue;
}

double totalpricetickets(
  int counter,
  double price,
) {
  // return a value for counter * price
  double totalPrice = counter * price;
  return double.parse(totalPrice.toStringAsFixed(1));
}

double progressbarvalue(
  double totalnumberoftickets,
  double ticketssold,
) {
  // add to the existing function % after the returned result
// return the result for dividing ticketssold with totalnumberoftickets and add % symbol after the result
  return (ticketssold / totalnumberoftickets);
}

double progressbar(
  double totalnumberoftickets,
  double ticketssold,
) {
  // return the result for divideing totalnumberoftickets with ticketssold
  return ticketssold / totalnumberoftickets;
}

double supabaseFunctions(List<double> totalprice) {
  // sum of totalprice
// use the reduce method to sum up all the values in the totalprice list
  double sum = totalprice.reduce((value, element) => value + element);
  return sum;
}

int convertdoubletoint(double doubleinput) {
  // return doubleinput into integer
// convert doubleinput to integer and return the result
  return doubleinput.toInt();
}

dynamic texttojson(String tickets) {
  // convert text into json
// Use the json.decode() method to convert the tickets string into a JSON object
  return json.decode(tickets);
}
