// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<dynamic>> listadoAsignaturasPorCarreraAction(int idCarrera) async {
  final supabase = Supabase.instance.client;

  final res =
      await supabase.from('Asignatura').select().eq('carrera_id', idCarrera);

  return res as List<dynamic>;
}
