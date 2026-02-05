// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<dynamic> departamentoProfesorAction(int idDep) async {
  final supabase = Supabase.instance.client;

  final res = await supabase
      .from('Departamento')
      .select()
      .eq('id', idDep)
      .limit(1)
      .single();

  return res as dynamic;
}
