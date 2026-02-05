// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<dynamic> buscarNotaAction(int idAlumno, int idAsignatura) async {
  final supabase = Supabase.instance.client;

  final idRelacion = await supabase
      .from('UsuarioAsignatura')
      .select('id')
      .eq('usuario_id', idAlumno)
      .eq('asignatura_id', idAsignatura)
      .single();

  final int idMatricula = idRelacion['id'] as int;

  final nota = await supabase
      .from('Nota')
      .select()
      .eq('matricula_id', idMatricula)
      .maybeSingle();

  if (nota == null) {
    return null;
  }

  return nota;
}
