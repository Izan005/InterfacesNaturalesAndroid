// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<dynamic>> asignaturasProfesorAction(int idProfe) async {
  final supabase = Supabase.instance.client;

  final res =
      await supabase.from('Asignatura').select().eq('profesor_id', idProfe);

  return res as List<dynamic>;
}
