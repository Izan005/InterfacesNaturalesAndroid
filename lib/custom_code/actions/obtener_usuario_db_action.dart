// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:supabase_flutter/supabase_flutter.dart';

Future<dynamic> obtenerUsuarioDbAction(
  String nombre,
  String pass,
) async {
  final supabase = Supabase.instance.client;

  final res = await supabase
      .from('Usuario')
      .select()
      .eq('nombre', nombre)
      .eq('pass', pass)
      .limit(1)
      .single();

  return res as dynamic;
}
