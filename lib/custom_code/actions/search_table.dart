// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:supabase_flutter/supabase_flutter.dart';

Future<List<dynamic>> searchTable(String search, String competitionId) async {
  try {
    final supabase = SupaFlow.client;
    final response = await supabase.rpc('search_table', params: {
      'p_search_term': search,
      'p_competition_id': competitionId, // Add competitionId as parameter
    });
    // Print the raw response for debugging purposes
    print('Raw Response: $response');

    return response;
  } catch (e) {
    print('Exception: $e');
    // Return an empty list in case of an exception
    return [];
  }
}
