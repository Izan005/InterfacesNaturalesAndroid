import '/flutter_flow/flutter_flow_util.dart';
import 'lista_estudiantes_asignatura_widget.dart'
    show ListaEstudiantesAsignaturaWidget;
import 'package:flutter/material.dart';

class ListaEstudiantesAsignaturaModel
    extends FlutterFlowModel<ListaEstudiantesAsignaturaWidget> {
  ///  Local state fields for this page.

  List<dynamic> alumnos = [];
  void addToAlumnos(dynamic item) => alumnos.add(item);
  void removeFromAlumnos(dynamic item) => alumnos.remove(item);
  void removeAtIndexFromAlumnos(int index) => alumnos.removeAt(index);
  void insertAtIndexInAlumnos(int index, dynamic item) =>
      alumnos.insert(index, item);
  void updateAlumnosAtIndex(int index, Function(dynamic) updateFn) =>
      alumnos[index] = updateFn(alumnos[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - alumnosPorAsignaturaAction] action in ListaEstudiantesAsignatura widget.
  List<dynamic>? alumnosDb;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
