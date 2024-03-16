import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bottomnavigationbar_patient_model.dart';
export 'bottomnavigationbar_patient_model.dart';

class BottomnavigationbarPatientWidget extends StatefulWidget {
  const BottomnavigationbarPatientWidget({super.key});

  @override
  State<BottomnavigationbarPatientWidget> createState() =>
      _BottomnavigationbarPatientWidgetState();
}

class _BottomnavigationbarPatientWidgetState
    extends State<BottomnavigationbarPatientWidget> {
  late BottomnavigationbarPatientModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomnavigationbarPatientModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Material(
        color: Colors.transparent,
        elevation: 2.0,
        child: Container(
          width: double.infinity,
          height: 80.0,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: FFAppState().stateNotificationPatient
                      ? Color(0xFF0DA0D4)
                      : Color(0x00000000),
                  hoverColor: Color(0x8F2876DC),
                  hoverIconColor: Colors.white,
                  icon: Icon(
                    Icons.notifications,
                    color: FFAppState().stateNotificationPatient
                        ? Colors.white
                        : Color(0xFF0DA0D4),
                    size: 24.0,
                  ),
                  onPressed: () async {
                    setState(() {
                      FFAppState().stateNotificationPatient = true;
                      FFAppState().stateHomePatient = false;
                      FFAppState().stateHistoryPatient = false;
                    });

                    context.pushNamed(
                      'notification_patient_page',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: FFAppState().stateHomePatient
                      ? Color(0xFF0DA0D4)
                      : Color(0x00000000),
                  hoverColor: Color(0x8F2876DC),
                  hoverIconColor: Colors.white,
                  icon: Icon(
                    Icons.home,
                    color: FFAppState().stateHomePatient
                        ? Colors.white
                        : Color(0xFF0DA0D4),
                    size: 24.0,
                  ),
                  onPressed: () async {
                    setState(() {
                      FFAppState().stateHomePatient = true;
                      FFAppState().stateHistoryPatient = false;
                      FFAppState().stateNotificationPatient = false;
                    });

                    context.pushNamed(
                      'home_patient_page',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.white,
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: FFAppState().stateHistoryPatient
                      ? Color(0xFF0DA0D4)
                      : Color(0x00000000),
                  hoverColor: Color(0x8F2876DC),
                  hoverIconColor: Colors.white,
                  icon: Icon(
                    Icons.work_history,
                    color: FFAppState().stateHistoryPatient
                        ? Colors.white
                        : Color(0xFF0DA0D4),
                    size: 24.0,
                  ),
                  onPressed: () async {
                    setState(() {
                      FFAppState().stateHomePatient = false;
                      FFAppState().stateHistoryPatient = true;
                      FFAppState().stateNotificationPatient = false;
                    });

                    context.pushNamed('history_requests_patients_page');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
