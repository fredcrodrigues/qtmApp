import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bottom_navigation_bar_theraphist_model.dart';
export 'bottom_navigation_bar_theraphist_model.dart';

class BottomNavigationBarTheraphistWidget extends StatefulWidget {
  const BottomNavigationBarTheraphistWidget({super.key});

  @override
  State<BottomNavigationBarTheraphistWidget> createState() =>
      _BottomNavigationBarTheraphistWidgetState();
}

class _BottomNavigationBarTheraphistWidgetState
    extends State<BottomNavigationBarTheraphistWidget> {
  late BottomNavigationBarTheraphistModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomNavigationBarTheraphistModel());

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
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: FFAppState().stateNotificationTheraphit
                      ? Color(0xFF9420AF)
                      : Color(0x00000000),
                  hoverColor: Color(0xFF9420AF),
                  hoverIconColor: Colors.white,
                  icon: Icon(
                    Icons.notifications,
                    color: FFAppState().stateNotificationTheraphit
                        ? Colors.white
                        : Color(0xFF9420AF),
                    size: 24.0,
                  ),
                  onPressed: () async {
                    setState(() {
                      FFAppState().stateNotificationTheraphit = true;
                      FFAppState().stateHistoryTheraphit = false;
                      FFAppState().stateHomeTheraphist = false;
                    });

                    context.pushNamed(
                      'notification_theraphist_page',
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
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: FFAppState().stateHomeTheraphist
                      ? Color(0xFF9420AF)
                      : Color(0x00000000),
                  hoverColor: Color(0xFF9420AF),
                  hoverIconColor: Colors.white,
                  icon: Icon(
                    Icons.home,
                    color: FFAppState().stateHomeTheraphist
                        ? Colors.white
                        : Color(0xFF9420AF),
                    size: 24.0,
                  ),
                  onPressed: () async {
                    setState(() {
                      FFAppState().stateHomeTheraphist = true;
                      FFAppState().stateNotificationTheraphit = false;
                      FFAppState().stateHistoryTheraphit = false;
                    });

                    context.pushNamed(
                      'home_theraphist_page',
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
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: FFAppState().stateHistoryTheraphit
                      ? Color(0xFF9420AF)
                      : Color(0x00000000),
                  icon: Icon(
                    Icons.work_history,
                    color: FFAppState().stateHistoryTheraphit
                        ? Colors.white
                        : Color(0xFF9420AF),
                    size: 24.0,
                  ),
                  onPressed: () async {
                    setState(() {
                      FFAppState().stateHomeTheraphist = false;
                      FFAppState().stateNotificationTheraphit = false;
                      FFAppState().stateHistoryTheraphit = true;
                    });

                    context.pushNamed(
                      'history_requests_theraphist_page',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
