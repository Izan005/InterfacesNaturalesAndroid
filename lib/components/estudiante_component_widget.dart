import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'estudiante_component_model.dart';
export 'estudiante_component_model.dart';

class EstudianteComponentWidget extends StatefulWidget {
  const EstudianteComponentWidget({
    super.key,
    required this.alumno,
    required this.asignatura,
    required this.callback,
    required this.profesor,
  });

  final dynamic alumno;
  final dynamic asignatura;
  final Future Function()? callback;
  final dynamic profesor;

  @override
  State<EstudianteComponentWidget> createState() =>
      _EstudianteComponentWidgetState();
}

class _EstudianteComponentWidgetState extends State<EstudianteComponentWidget>
    with TickerProviderStateMixin {
  late EstudianteComponentModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EstudianteComponentModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: null,
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        context.pushNamed(
          DetallesAlumnoProfesorWidget.routeName,
          queryParameters: {
            'alumno': serializeParam(
              widget.alumno,
              ParamType.JSON,
            ),
            'asignatura': serializeParam(
              widget.asignatura,
              ParamType.JSON,
            ),
            'profesor': serializeParam(
              widget.profesor,
              ParamType.JSON,
            ),
          }.withoutNulls,
        );
      },
      onHorizontalDragEnd: (details) async {
        if (_model.offsetX > 100.0) {
          var confirmDialogResponse = await showDialog<bool>(
                context: context,
                builder: (alertDialogContext) {
                  return AlertDialog(
                    title: Text('Desmatricular alumno'),
                    content: Text(
                        '¿Seguro que quieres desmatricular al alumno seleccionado?'),
                    actions: [
                      TextButton(
                        onPressed: () =>
                            Navigator.pop(alertDialogContext, false),
                        child: Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.pop(alertDialogContext, true),
                        child: Text('Aceptar'),
                      ),
                    ],
                  );
                },
              ) ??
              false;
          if (confirmDialogResponse) {
            await widget.callback?.call();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Se ha desmatriculado al alumno seleccionado.',
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).secondary,
              ),
            );

            context.pushNamed(
              HomeProfesorWidget.routeName,
              queryParameters: {
                'profesorRegistrado': serializeParam(
                  widget.profesor,
                  ParamType.JSON,
                ),
              }.withoutNulls,
            );
          }
        } else {
          if (animationsMap['containerOnActionTriggerAnimation'] != null) {
            await animationsMap['containerOnActionTriggerAnimation']!
                .controller
                .forward(from: 0.0);
          }
        }

        _model.offsetX = 0.0;
        safeSetState(() {});
      },
      onHorizontalDragUpdate: (details) async {
        _model.offsetX = _model.offsetX + details.delta.dx;
        safeSetState(() {});
        if (animationsMap['containerOnActionTriggerAnimation'] != null) {
          await animationsMap['containerOnActionTriggerAnimation']!
              .controller
              .forward(from: 0.0);
        }
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getJsonField(
                          widget.alumno,
                          r'''$.nombre''',
                        ).toString(),
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: Text(
                          getJsonField(
                            widget.alumno,
                            r'''$.fecha_nacimiento''',
                          ).toString(),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ).animateOnActionTrigger(
      animationsMap['containerOnActionTriggerAnimation']!,
      effects: [
        MoveEffect(
          curve: Curves.linear,
          delay: 0.0.ms,
          duration: 600.0.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(
              valueOrDefault<double>(
                _model.offsetX,
                0.0,
              ),
              0.0),
        ),
      ],
    );
  }
}
