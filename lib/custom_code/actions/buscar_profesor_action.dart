// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<dynamic> buscarProfesorAction(int idAsignatura) async {
  final supabase = Supabase.instance.client;

  try {
    final resAsignatura = await supabase
        .from('Asignatura')
        .select('profesor_id')
        .eq('id', idAsignatura)
        .maybeSingle();

    if (resAsignatura == null || resAsignatura['profesor_id'] == null) {
      print("No se encontró profesor para la asignatura $idAsignatura");
      return null;
    }

    final int idProfesor = resAsignatura['profesor_id'];

    final profesor = await supabase
        .from('Usuario')
        .select()
        .eq('id', idProfesor)
        .maybeSingle();

    return profesor;
  } catch (e) {
    print('Error en buscarProfesorAction: $e');
    return null;
  }
}
