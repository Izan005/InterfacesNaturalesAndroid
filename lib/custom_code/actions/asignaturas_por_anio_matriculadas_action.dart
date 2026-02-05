// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<dynamic>> asignaturasPorAnioMatriculadasAction(
    int idAlumno, int idCarrera, int anio, bool esMatriculada) async {
  final supabase = Supabase.instance.client;

  try {
    final relaciones = await supabase
        .from('UsuarioAsignatura')
        .select('asignatura_id')
        .eq('usuario_id', idAlumno);

    if (relaciones == null || relaciones.isEmpty) return [];

    List<int> idsMatriculados = [];
    for (var r in relaciones) {
      if (r['asignatura_id'] != null) {
        idsMatriculados.add(r['asignatura_id'] as int);
      }
    }

    final todasDelAnio = await supabase
        .from('Asignatura')
        .select()
        .eq('anio_carrera', anio)
        .eq('carrera_id', idCarrera);

    if (todasDelAnio == null) return [];

    List<dynamic> matriculadasDelAnio = [];
    List<dynamic> noMatriculadasDelAnio = [];

    for (var asignatura in todasDelAnio) {
      if (idsMatriculados.contains(asignatura['id'])) {
        matriculadasDelAnio.add(asignatura);
      } else {
        noMatriculadasDelAnio.add(asignatura);
      }
    }

    if (esMatriculada) {
      return matriculadasDelAnio;
    } else {
      return noMatriculadasDelAnio;
    }
  } catch (e) {
    print('ERROR EN LA ACCIÓN: $e');
    return [];
  }
}
