import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'carrera_component_model.dart';
export 'carrera_component_model.dart';

class CarreraComponentWidget extends StatefulWidget {
  const CarreraComponentWidget({
    super.key,
    this.carreraJson,
    required this.callback,
    required this.alumno,
  });

  final dynamic carreraJson;
  final Future Function()? callback;
  final dynamic alumno;

  @override
  State<CarreraComponentWidget> createState() => _CarreraComponentWidgetState();
}

class _CarreraComponentWidgetState extends State<CarreraComponentWidget>
    with TickerProviderStateMixin {
  late CarreraComponentModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarreraComponentModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: null,
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
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
    return FlipCard(
      fill: Fill.fillBack,
      direction: FlipDirection.HORIZONTAL,
      speed: 400,
      front: Padding(
        padding: EdgeInsets.all(16.0),
        child: GestureDetector(
          onHorizontalDragEnd: (details) async {
            if (_model.offsetX > 100.0) {
              var confirmDialogResponse = await showDialog<bool>(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text('Matricularse'),
                        content: Text(
                            '¿Seguro que quieres matricularte en esta carrera?'),
                        actions: [
                          TextButton(
                            onPressed: () =>
                                Navigator.pop(alertDialogContext, false),
                            child: Text('No'),
                          ),
                          TextButton(
                            onPressed: () =>
                                Navigator.pop(alertDialogContext, true),
                            child: Text('Sí'),
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
                      'Usuario matriculado en la carrera seleccionada.',
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                    duration: Duration(milliseconds: 4000),
                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                  ),
                );

                context.pushNamed(
                  HomeAlumnoWidget.routeName,
                  queryParameters: {
                    'alumnoRegistrado': serializeParam(
                      widget.alumno,
                      ParamType.JSON,
                    ),
                  }.withoutNulls,
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'No se ha matriculado en la carrera seleccionada.',
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                    duration: Duration(milliseconds: 4000),
                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                  ),
                );
              }
            } else {
              if (animationsMap['containerOnActionTriggerAnimation1'] != null) {
                await animationsMap['containerOnActionTriggerAnimation1']!
                    .controller
                    .forward(from: 0.0)
                    .whenComplete(
                        animationsMap['containerOnActionTriggerAnimation1']!
                            .controller
                            .reverse);
              }
            }

            _model.offsetX = 0.0;
            safeSetState(() {});
          },
          onHorizontalDragUpdate: (details) async {
            _model.offsetX = _model.offsetX + details.delta.dx;
            safeSetState(() {});
            if (animationsMap['containerOnActionTriggerAnimation1'] != null) {
              await animationsMap['containerOnActionTriggerAnimation1']!
                  .controller
                  .forward(from: 0.0);
            }
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).alternate,
                width: 1.0,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFE3F2FD),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getJsonField(
                              widget.carreraJson,
                              r'''$.nombre''',
                            ).toString(),
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 20.0,
                  ),
                ].divide(SizedBox(width: 16.0)),
              ),
            ),
          ),
        ).animateOnActionTrigger(
          animationsMap['containerOnActionTriggerAnimation1']!,
          effects: [
            MoveEffect(
              curve: Curves.linear,
              delay: 0.0.ms,
              duration: 0.0.ms,
              begin: Offset(0.0, 0.0),
              end: Offset(
                  valueOrDefault<double>(
                    _model.offsetX,
                    0.0,
                  ),
                  0.0),
            ),
          ],
        ),
      ),
      back: Padding(
        padding: EdgeInsets.all(16.0),
        child: GestureDetector(
          onHorizontalDragEnd: (details) async {
            if (_model.offsetX > 100.0) {
              var confirmDialogResponse = await showDialog<bool>(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text('Matricularse'),
                        content: Text(
                            '¿Seguro que quieres matricularte en esta carrera?'),
                        actions: [
                          TextButton(
                            onPressed: () =>
                                Navigator.pop(alertDialogContext, false),
                            child: Text('No'),
                          ),
                          TextButton(
                            onPressed: () =>
                                Navigator.pop(alertDialogContext, true),
                            child: Text('Sí'),
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
                      'Usuario matriculado en la carrera seleccionada.',
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                    duration: Duration(milliseconds: 4000),
                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                  ),
                );

                context.pushNamed(
                  HomeAlumnoWidget.routeName,
                  queryParameters: {
                    'alumnoRegistrado': serializeParam(
                      widget.alumno,
                      ParamType.JSON,
                    ),
                  }.withoutNulls,
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'No se ha matriculado en la carrera seleccionada.',
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                    duration: Duration(milliseconds: 4000),
                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                  ),
                );
              }
            } else {
              if (animationsMap['containerOnActionTriggerAnimation2'] != null) {
                await animationsMap['containerOnActionTriggerAnimation2']!
                    .controller
                    .forward(from: 0.0)
                    .whenComplete(
                        animationsMap['containerOnActionTriggerAnimation2']!
                            .controller
                            .reverse);
              }
            }

            _model.offsetX = 0.0;
            safeSetState(() {});
          },
          onHorizontalDragUpdate: (details) async {
            _model.offsetX = _model.offsetX + details.delta.dx;
            safeSetState(() {});
            if (animationsMap['containerOnActionTriggerAnimation2'] != null) {
              await animationsMap['containerOnActionTriggerAnimation2']!
                  .controller
                  .forward(from: 0.0);
            }
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).alternate,
                width: 1.0,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFE3F2FD),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getJsonField(
                            widget.carreraJson,
                            r'''$.descripcion''',
                          ).toString(),
                          maxLines: 2,
                          style: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                font: GoogleFonts.interTight(
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontStyle,
                              ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 20.0,
                  ),
                ].divide(SizedBox(width: 16.0)),
              ),
            ),
          ),
        ).animateOnActionTrigger(
          animationsMap['containerOnActionTriggerAnimation2']!,
          effects: [
            MoveEffect(
              curve: Curves.linear,
              delay: 0.0.ms,
              duration: 0.0.ms,
              begin: Offset(0.0, 0.0),
              end: Offset(
                  valueOrDefault<double>(
                    _model.offsetX,
                    0.0,
                  ),
                  0.0),
            ),
          ],
        ),
      ),
    );
  }
}
