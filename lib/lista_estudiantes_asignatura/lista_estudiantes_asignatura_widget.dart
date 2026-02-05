import '/components/estudiante_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'lista_estudiantes_asignatura_model.dart';
export 'lista_estudiantes_asignatura_model.dart';

/// Haz una pantalla donde se muestre una lista de alumnos con un título
/// general.
///
/// Este será el nombre de una asignaturast
class ListaEstudiantesAsignaturaWidget extends StatefulWidget {
  const ListaEstudiantesAsignaturaWidget({
    super.key,
    required this.asignatura,
    required this.profesor,
  });

  final dynamic asignatura;
  final dynamic profesor;

  static String routeName = 'ListaEstudiantesAsignatura';
  static String routePath = '/listaEstudiantesAsignatura';

  @override
  State<ListaEstudiantesAsignaturaWidget> createState() =>
      _ListaEstudiantesAsignaturaWidgetState();
}

class _ListaEstudiantesAsignaturaWidgetState
    extends State<ListaEstudiantesAsignaturaWidget> {
  late ListaEstudiantesAsignaturaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListaEstudiantesAsignaturaModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.alumnosDb = await actions.alumnosPorAsignaturaAction(
        getJsonField(
          widget.asignatura,
          r'''$.id''',
        ),
      );
      _model.alumnos = _model.alumnosDb!.toList().cast<dynamic>();
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.arrow_back,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
              Text(
                'Estudiantes',
                style: FlutterFlowTheme.of(context).headlineLarge.override(
                      font: GoogleFonts.interTight(
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineLarge
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineLarge
                            .fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).headlineLarge.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                    ),
              ),
            ].divide(SizedBox(width: 8.0)),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  child: Text(
                    getJsonField(
                      widget.asignatura,
                      r'''$.nombre''',
                    ).toString(),
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          font: GoogleFonts.interTight(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .fontStyle,
                          ),
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontStyle,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  child: Text(
                    'Lista de estudiantes matriculados',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final listviewAsignaturas = _model.alumnos.toList();

                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listviewAsignaturas.length,
                        separatorBuilder: (_, __) => SizedBox(height: 12.0),
                        itemBuilder: (context, listviewAsignaturasIndex) {
                          final listviewAsignaturasItem =
                              listviewAsignaturas[listviewAsignaturasIndex];
                          return EstudianteComponentWidget(
                            key: Key(
                                'Key8ky_${listviewAsignaturasIndex}_of_${listviewAsignaturas.length}'),
                            alumno: listviewAsignaturasItem,
                            asignatura: widget.asignatura!,
                            profesor: widget.profesor!,
                            callback: () async {
                              await actions.desmatricularAlumnoAction(
                                getJsonField(
                                  listviewAsignaturasItem,
                                  r'''$.id''',
                                ),
                                getJsonField(
                                  widget.asignatura,
                                  r'''$.id''',
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ]
                  .divide(SizedBox(height: 16.0))
                  .addToStart(SizedBox(height: 24.0))
                  .addToEnd(SizedBox(height: 24.0)),
            ),
          ),
        ),
      ),
    );
  }
}
