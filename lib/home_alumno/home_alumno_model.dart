import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_alumno_widget.dart' show HomeAlumnoWidget;
import 'package:flutter/material.dart';

class HomeAlumnoModel extends FlutterFlowModel<HomeAlumnoWidget> {
  ///  Local state fields for this page.

  bool matriculado = false;

  List<dynamic> listadoCarreras = [];
  void addToListadoCarreras(dynamic item) => listadoCarreras.add(item);
  void removeFromListadoCarreras(dynamic item) => listadoCarreras.remove(item);
  void removeAtIndexFromListadoCarreras(int index) =>
      listadoCarreras.removeAt(index);
  void insertAtIndexInListadoCarreras(int index, dynamic item) =>
      listadoCarreras.insert(index, item);
  void updateListadoCarrerasAtIndex(int index, Function(dynamic) updateFn) =>
      listadoCarreras[index] = updateFn(listadoCarreras[index]);

  dynamic carreraAlumno;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - listadoCarrerasAction] action in HomeAlumno widget.
  List<dynamic>? listadoCarrerasDb;
  // Stores action output result for [Custom Action - estaMatriculadoAction] action in HomeAlumno widget.
  dynamic asignaturaMatriculada;
  // Stores action output result for [Custom Action - carreraDeAlumnoAction] action in Button widget.
  dynamic carreraDb;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
