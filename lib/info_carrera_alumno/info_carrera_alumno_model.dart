import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'info_carrera_alumno_widget.dart' show InfoCarreraAlumnoWidget;
import 'package:flutter/material.dart';

class InfoCarreraAlumnoModel extends FlutterFlowModel<InfoCarreraAlumnoWidget> {
  ///  Local state fields for this page.

  List<dynamic> listaMatriculadas = [];
  void addToListaMatriculadas(dynamic item) => listaMatriculadas.add(item);
  void removeFromListaMatriculadas(dynamic item) =>
      listaMatriculadas.remove(item);
  void removeAtIndexFromListaMatriculadas(int index) =>
      listaMatriculadas.removeAt(index);
  void insertAtIndexInListaMatriculadas(int index, dynamic item) =>
      listaMatriculadas.insert(index, item);
  void updateListaMatriculadasAtIndex(int index, Function(dynamic) updateFn) =>
      listaMatriculadas[index] = updateFn(listaMatriculadas[index]);

  List<dynamic> listaNoMatriculadas = [];
  void addToListaNoMatriculadas(dynamic item) => listaNoMatriculadas.add(item);
  void removeFromListaNoMatriculadas(dynamic item) =>
      listaNoMatriculadas.remove(item);
  void removeAtIndexFromListaNoMatriculadas(int index) =>
      listaNoMatriculadas.removeAt(index);
  void insertAtIndexInListaNoMatriculadas(int index, dynamic item) =>
      listaNoMatriculadas.insert(index, item);
  void updateListaNoMatriculadasAtIndex(
          int index, Function(dynamic) updateFn) =>
      listaNoMatriculadas[index] = updateFn(listaNoMatriculadas[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - asignaturasPorAnioMatriculadasAction] action in InfoCarreraAlumno widget.
  List<dynamic>? matriculadas;
  // Stores action output result for [Custom Action - asignaturasPorAnioMatriculadasAction] action in InfoCarreraAlumno widget.
  List<dynamic>? noMatriculadas;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
