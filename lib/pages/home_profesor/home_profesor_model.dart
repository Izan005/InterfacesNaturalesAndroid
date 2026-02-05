import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_profesor_widget.dart' show HomeProfesorWidget;
import 'package:flutter/material.dart';

class HomeProfesorModel extends FlutterFlowModel<HomeProfesorWidget> {
  ///  Local state fields for this page.

  bool estaDepart = true;

  dynamic departamento;

  List<dynamic> asignaturas = [];
  void addToAsignaturas(dynamic item) => asignaturas.add(item);
  void removeFromAsignaturas(dynamic item) => asignaturas.remove(item);
  void removeAtIndexFromAsignaturas(int index) => asignaturas.removeAt(index);
  void insertAtIndexInAsignaturas(int index, dynamic item) =>
      asignaturas.insert(index, item);
  void updateAsignaturasAtIndex(int index, Function(dynamic) updateFn) =>
      asignaturas[index] = updateFn(asignaturas[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - departamentoProfesorAction] action in HomeProfesor widget.
  dynamic departamentoDb;
  // Stores action output result for [Custom Action - asignaturasProfesorAction] action in HomeProfesor widget.
  List<dynamic>? asignaturasDb;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
