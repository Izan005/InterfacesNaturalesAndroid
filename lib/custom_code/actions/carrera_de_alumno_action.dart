// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<dynamic> carreraDeAlumnoAction(int idAlumno) async {
  final supabase = Supabase.instance.client;

  try {
    final resAsignatura = await supabase
        .from('UsuarioAsignatura')
        .select('asignatura_id')
        .eq('usuario_id', idAlumno)
        .limit(1)
        .maybeSingle();

    if (resAsignatura == null) {
      print("El usuario $idAlumno no tiene registros en UsuarioAsignatura");
      return null;
    }

    final int idAsignatura = resAsignatura['asignatura_id'];

    final resCarreraId = await supabase
        .from('Asignatura')
        .select('carrera_id')
        .eq('id', idAsignatura)
        .maybeSingle();

    if (resCarreraId == null) {
      print("No se encontró la carrera para la asignatura $idAsignatura");
      return null;
    }

    final int idCarrera = resCarreraId['carrera_id'];

    final resCarrera = await supabase
        .from('Carrera')
        .select()
        .eq('id', idCarrera)
        .maybeSingle();

    return resCarrera;
  } catch (e) {
    print('Error en carreraDeAlumnoAction: $e');
    return null;
  }
}
