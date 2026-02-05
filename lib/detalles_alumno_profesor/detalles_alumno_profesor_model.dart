import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'detalles_alumno_profesor_widget.dart' show DetallesAlumnoProfesorWidget;
import 'package:flutter/material.dart';

class DetallesAlumnoProfesorModel
    extends FlutterFlowModel<DetallesAlumnoProfesorWidget> {
  ///  Local state fields for this page.

  dynamic nota;

  String notaString = '0';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - buscarNotaAction] action in DetallesAlumnoProfesor widget.
  dynamic notaDb;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
