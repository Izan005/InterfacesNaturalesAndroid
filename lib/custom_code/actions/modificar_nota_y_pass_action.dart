// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future modificarNotaYPassAction(
  int idAlumno,
  int idNota,
  String pass,
  //String nota,
) async {
  //int notaNum = int.parse(nota);

  final supabase = Supabase.instance.client;

  await supabase.from('Usuario').update({'pass': pass}).eq('id', idAlumno);

  /**await supabase
      .from('Nota')
      .update({'nota': notaNum}).eq('matricula_id', idNota);**/
}
