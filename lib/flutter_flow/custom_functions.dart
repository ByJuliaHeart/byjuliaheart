import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

bool conditions(
  List<String> idmembergame,
  String? userid,
) {
  // takes an array and a user ID, returns true if it contains a user ID and false if it does not
  return idmembergame.contains(userid);
}

int? timer() {
  // the function takes int 60000 and subtracts one second and returns the change until it is zero
  int time = 60000;
  while (time > 0) {
    time -= 1000;
  }
  return time;
}

int? newCustomFunction(int time) {
  // takes int and in milliseconds and returns a string in minutes and seconds 00:00
  int minutes = (time / 60000).floor();
  int seconds = ((time % 60000) / 1000).floor();
  String minutesStr = minutes.toString().padLeft(2, '0');
  String secondsStr = seconds.toString().padLeft(2, '0');
  return int.parse('$minutesStr$secondsStr');
}

String? datecut(String? date) {
  // applay string and retern only first  ten simbol
  String? input = 'This is a sample string';
  if (input != null && input.length > 10) {
    return input.substring(0, 10);
  } else {
    return input;
  }
}
