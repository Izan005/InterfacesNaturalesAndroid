// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<dynamic>> alumnosPorAsignaturaAction(int idAsignatura) async {
  final supabase = Supabase.instance.client;

  final relacion = await supabase
      .from('UsuarioAsignatura')
      .select('usuario_id')
      .eq('asignatura_id', idAsignatura);

  if (relacion == null || relacion.isEmpty) return [];

  List<int> idsAlumnos = [for (var r in relacion) r['usuario_id'] as int];

  List<dynamic> alumnos = [];

  for (var fila in idsAlumnos) {
    final alumno =
        await supabase.from('Usuario').select().eq('id', fila).maybeSingle();

    if (fila != null) {
      alumnos.add(alumno);
    }
  }

  if (alumnos.isEmpty) return [];

  return alumnos;
}
