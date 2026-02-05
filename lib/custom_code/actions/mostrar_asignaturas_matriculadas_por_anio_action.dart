// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<dynamic>> mostrarAsignaturasMatriculadasPorAnioAction(
  int idAlumno,
  int anio,
) async {
  try {
    final supabase = Supabase.instance.client;

    final List<dynamic> relaciones = await supabase
        .from('UsuarioAsignatura')
        .select('asignatura_id')
        .eq('usuario_id', idAlumno);

    if (relaciones.isEmpty) {
      print(
          'El usuario con id $idAlumno no está matriculado en ninguna asignatura');
      return [];
    }

    final List<dynamic> asignaturasMatriculadas = [];

    for (var fila in relaciones) {
      final int idAsignatura = fila['asignatura_id'];

      final asignatura = await supabase
          .from('Asignatura')
          .select()
          .eq('id', idAsignatura)
          .eq('anio_carrera', anio)
          .maybeSingle();

      if (asignatura != null) {
        asignaturasMatriculadas.add(asignatura);
      }
    }

    return asignaturasMatriculadas;
  } catch (e) {
    print('Error en la acción mostrarAsignaturasMatriculadasPorAnioAction: $e');
    return [];
  }
}
