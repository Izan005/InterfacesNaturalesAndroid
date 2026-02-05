import '/flutter_flow/flutter_flow_util.dart';
import 'detalles_asignatura_widget.dart' show DetallesAsignaturaWidget;
import 'package:flutter/material.dart';

class DetallesAsignaturaModel
    extends FlutterFlowModel<DetallesAsignaturaWidget> {
  ///  Local state fields for this page.

  dynamic profesor;

  int nota = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - buscarProfesorAction] action in DetallesAsignatura widget.
  dynamic profesorDb;
  // Stores action output result for [Custom Action - buscarNotaAction] action in DetallesAsignatura widget.
  dynamic notaDb;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
