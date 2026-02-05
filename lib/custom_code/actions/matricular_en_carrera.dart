// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future matricularEnCarrera(
  int idCarrera,
  int idAlumno,
) async {
  final supabase = Supabase.instance.client;

  try {
    final List<dynamic> asignaturas = await supabase
        .from('Asignatura')
        .select('id')
        .eq('carrera_id', idCarrera)
        .eq('anio_carrera', 1);

    print('Asignaturas encontradas: ${asignaturas.length}');

    if (asignaturas.isEmpty) {
      print(
          'ALERTA: No hay asignaturas para la carrera $idCarrera en el año 1');
      return;
    }

    List<Map<String, dynamic>> listaUsuarioAsignatura = [];

    for (var fila in asignaturas) {
      listaUsuarioAsignatura.add({
        'usuario_id': idAlumno,
        'asignatura_id': fila['id'],
      });
    }

    await supabase.from('UsuarioAsignatura').insert(listaUsuarioAsignatura);
    print(
        'Éxito: Se han matriculado ${listaUsuarioAsignatura.length} asignaturas.');

    final List<dynamic> matriculasRealizadas = await supabase
        .from('UsuarioAsignatura')
        .insert(listaUsuarioAsignatura)
        .select();

    List<Map<String, dynamic>> listaNotas = [
      for (var matricula in matriculasRealizadas)
        {
          'matricula_id': matricula['id'],
          'nota': 0,
        }
    ];

    await supabase.from('Nota').insert(listaNotas);
  } catch (e) {
    print('Error en la base de datos: $e');
  }
}
