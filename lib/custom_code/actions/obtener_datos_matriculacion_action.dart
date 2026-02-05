// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<dynamic> obtenerDatosMatriculacionAction(
  int idCarrera,
  int idAlumno,
) async {
  final supabase = Supabase.instance.client;

  try {
    // 1. Obtenemos todas las asignaturas de la carrera solicitada
    final List<dynamic> todasAsignaturas = await supabase
        .from('Asignatura')
        .select()
        .eq('carrera_id', idCarrera)
        .order('anio_carrera', ascending: true);

    // 2. Obtenemos las relaciones de UsuarioAsignatura para este alumno
    final List<dynamic> relaciones = await supabase
        .from('UsuarioAsignatura')
        .select('asignatura_id')
        .eq('usuario_id', idAlumno);

    // 3. Extraemos los IDs manualmente usando un bucle FOR en lugar de MAP
    List<int> matriculadasIds = [];

    for (var fila in relaciones) {
      // Extraemos el ID y lo añadimos a nuestra lista de enteros
      final int id = fila['asignatura_id'] as int;
      matriculadasIds.add(id);
    }

    // 4. Retornamos el objeto JSON con ambas listas
    return {
      'todas': todasAsignaturas,
      'matriculadas_ids': matriculadasIds,
    };
  } catch (e) {
    print('Error en obtenerDatosMatriculacion: $e');
    // Retornamos listas vacías en caso de error para no romper la UI
    return {
      'todas': [],
      'matriculadas_ids': [],
    };
  }
}
