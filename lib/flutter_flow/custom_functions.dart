import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/supabase/supabase.dart';

List<dynamic> filtrarAsignaturas(
  List<dynamic> todasAsign,
  List<int> matriculadas,
  int anio,
  bool esMatriculada,
) {
  List<dynamic> resultado = [];

  for (var asignatura in todasAsign) {
    if (asignatura['anio_carrera'] == anio) {
      bool yaEsta = matriculadas.contains(asignatura['id']);

      if (esMatriculada == true && yaEsta == true) {
        resultado.add(asignatura);
      }

      if (esMatriculada == false && yaEsta == false) {
        resultado.add(asignatura);
      }
    }
  }

  return resultado;
}

String intAString(int num) {
  return num.toString();
}
