// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:supabase_flutter/supabase_flutter.dart';

Future newCustomAction(
  String tablee,
  Future Function() actione,
) async {
  // Add your function code here!
  final supabase = SupaFlow.client;
  String table = tablee;
  final channelName = 'public:' + table;
  final channel = supabase.channel(channelName);

  channel.on(
    RealtimeListenTypes.postgresChanges,
    ChannelFilter(event: '*', schema: 'public', table: table),
    (payload, [ref]) {
      actione();
      print('Reloaded');
    },
  ).subscribe();
}
