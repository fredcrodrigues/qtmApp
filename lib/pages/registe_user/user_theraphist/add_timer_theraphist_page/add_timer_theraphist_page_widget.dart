import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/registe_user/components/alert_register_user_theraphist_modal/alert_register_user_theraphist_modal_widget.dart';
import '/pages/registe_user/user_theraphist/introduction/turorial_theraphist_03_page/turorial_theraphist03_page_widget.dart';
import '/pages/registe_user/user_theraphist/introduction/turorial_theraphist_05_page/turorial_theraphist05_page_widget.dart';
import '/pages/registe_user/user_theraphist/introduction/turorial_theraphist_06_intro_page/turorial_theraphist06_intro_page_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'add_timer_theraphist_page_model.dart';
export 'add_timer_theraphist_page_model.dart';

class AddTimerTheraphistPageWidget extends StatefulWidget {
  const AddTimerTheraphistPageWidget({super.key});

  @override
  State<AddTimerTheraphistPageWidget> createState() =>
      _AddTimerTheraphistPageWidgetState();
}

class _AddTimerTheraphistPageWidgetState
    extends State<AddTimerTheraphistPageWidget> {
  late AddTimerTheraphistPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool expandableListenerRegistered1 = false;
  bool expandableListenerRegistered2 = false;
  bool expandableListenerRegistered3 = false;
  bool expandableListenerRegistered4 = false;
  bool expandableListenerRegistered5 = false;
  bool expandableListenerRegistered6 = false;
  bool expandableListenerRegistered7 = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddTimerTheraphistPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.flagRegister = false;
      });
      await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        enableDrag: false,
        context: context,
        builder: (context) {
          return GestureDetector(
            onTap: () => _model.unfocusNode.canRequestFocus
                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                : FocusScope.of(context).unfocus(),
            child: Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: TurorialTheraphist03PageWidget(),
            ),
          );
        },
      ).then((value) => safeSetState(() {}));
    });

    _model.expandableController1 = ExpandableController(initialExpanded: false);
    _model.expandableController2 = ExpandableController(initialExpanded: false);
    _model.expandableController3 = ExpandableController(initialExpanded: false);
    _model.expandableController4 = ExpandableController(initialExpanded: false);
    _model.expandableController5 = ExpandableController(initialExpanded: false);
    _model.expandableController6 = ExpandableController(initialExpanded: false);
    _model.expandableController7 = ExpandableController(initialExpanded: false);
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: Color(0xFFA954B2),
            automaticallyImplyLeading: false,
            title: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'imgevf99' /* Adicionar Horários de Atendime... */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
              ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 532.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(11.0),
                                  border: Border.all(
                                    color: Color(0x359A4C95),
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(11.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Builder(builder: (_) {
                                      if (!expandableListenerRegistered1) {
                                        expandableListenerRegistered1 = true;
                                        _model.expandableController1
                                            .addListener(
                                          () async {
                                            if (_model.expandableController1
                                                .expanded!) {
                                              setState(() {
                                                _model.activeMondayValue = true;
                                              });
                                            }
                                          },
                                        );
                                      }
                                      return Container(
                                        width: double.infinity,
                                        color: Color(0x00000000),
                                        child: ExpandableNotifier(
                                          controller:
                                              _model.expandableController1,
                                          child: ExpandablePanel(
                                            header: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Switch.adaptive(
                                                    value: _model
                                                            .activeMondayValue ??=
                                                        false,
                                                    onChanged:
                                                        (newValue) async {
                                                      setState(() => _model
                                                              .activeMondayValue =
                                                          newValue!);
                                                      if (newValue!) {
                                                        if (_model
                                                                .activeMondayValue ==
                                                            true) {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () => _model
                                                                        .unfocusNode
                                                                        .canRequestFocus
                                                                    ? FocusScope.of(
                                                                            context)
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      TurorialTheraphist05PageWidget(),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        }
                                                      }
                                                    },
                                                    activeColor:
                                                        Color(0xFFA954B2),
                                                    activeTrackColor:
                                                        Color(0x729A4C95),
                                                    inactiveTrackColor:
                                                        Color(0xFFEBEDEE),
                                                    inactiveThumbColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'dokepjk3' /* Segunda */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            collapsed: Opacity(
                                              opacity: 0.8,
                                              child: Container(),
                                            ),
                                            expanded: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          if (_model
                                                                  .activeMondayValue !=
                                                              true) {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return GestureDetector(
                                                                  onTap: () => _model
                                                                          .unfocusNode
                                                                          .canRequestFocus
                                                                      ? FocusScope.of(
                                                                              context)
                                                                          .requestFocus(_model
                                                                              .unfocusNode)
                                                                      : FocusScope.of(
                                                                              context)
                                                                          .unfocus(),
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        TurorialTheraphist06IntroPageWidget(),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));
                                                          } else {
                                                            final _datePicked1Time =
                                                                await showTimePicker(
                                                              context: context,
                                                              initialTime: TimeOfDay
                                                                  .fromDateTime(
                                                                      getCurrentTimestamp),
                                                            );
                                                            if (_datePicked1Time !=
                                                                null) {
                                                              safeSetState(() {
                                                                _model.datePicked1 =
                                                                    DateTime(
                                                                  getCurrentTimestamp
                                                                      .year,
                                                                  getCurrentTimestamp
                                                                      .month,
                                                                  getCurrentTimestamp
                                                                      .day,
                                                                  _datePicked1Time
                                                                      .hour,
                                                                  _datePicked1Time
                                                                      .minute,
                                                                );
                                                              });
                                                            }
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked1,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked2Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked2Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked2 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked2Time
                                                                    .hour,
                                                                _datePicked2Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked2,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked3Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked3Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked3 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked3Time
                                                                    .hour,
                                                                _datePicked3Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked3,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked4Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked4Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked4 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked4Time
                                                                    .hour,
                                                                _datePicked4Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked4,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked5Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked5Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked5 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked5Time
                                                                    .hour,
                                                                _datePicked5Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked5,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked6Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked6Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked6 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked6Time
                                                                    .hour,
                                                                _datePicked6Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked6,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            theme: ExpandableThemeData(
                                              tapHeaderToExpand: true,
                                              tapBodyToExpand: false,
                                              tapBodyToCollapse: false,
                                              headerAlignment:
                                                  ExpandablePanelHeaderAlignment
                                                      .center,
                                              hasIcon: true,
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(11.0),
                                  border: Border.all(
                                    color: Color(0x359A4C95),
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(11.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Builder(builder: (_) {
                                      if (!expandableListenerRegistered2) {
                                        expandableListenerRegistered2 = true;
                                        _model.expandableController2
                                            .addListener(
                                          () async {
                                            if (_model.expandableController2
                                                .expanded!) {
                                              setState(() {
                                                _model.activeTuesdayValue =
                                                    true;
                                              });
                                            }
                                          },
                                        );
                                      }
                                      return Container(
                                        width: double.infinity,
                                        color: Color(0x00000000),
                                        child: ExpandableNotifier(
                                          controller:
                                              _model.expandableController2,
                                          child: ExpandablePanel(
                                            header: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Switch.adaptive(
                                                    value: _model
                                                            .activeTuesdayValue ??=
                                                        false,
                                                    onChanged:
                                                        (newValue) async {
                                                      setState(() => _model
                                                              .activeTuesdayValue =
                                                          newValue!);
                                                    },
                                                    activeColor:
                                                        Color(0xFFA954B2),
                                                    activeTrackColor:
                                                        Color(0x729A4C95),
                                                    inactiveTrackColor:
                                                        Color(0xFFEBEDEE),
                                                    inactiveThumbColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'kdtk9uxd' /* Terça */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            collapsed: Opacity(
                                              opacity: 0.8,
                                              child: Container(),
                                            ),
                                            expanded: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked7Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked7Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked7 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked7Time
                                                                    .hour,
                                                                _datePicked7Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked7,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked8Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked8Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked8 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked8Time
                                                                    .hour,
                                                                _datePicked8Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked8,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked9Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked9Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked9 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked9Time
                                                                    .hour,
                                                                _datePicked9Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked9,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked10Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked10Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked10 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked10Time
                                                                    .hour,
                                                                _datePicked10Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked10,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked11Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked11Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked11 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked11Time
                                                                    .hour,
                                                                _datePicked11Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked11,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked12Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked12Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked12 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked12Time
                                                                    .hour,
                                                                _datePicked12Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked12,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            theme: ExpandableThemeData(
                                              tapHeaderToExpand: true,
                                              tapBodyToExpand: false,
                                              tapBodyToCollapse: false,
                                              headerAlignment:
                                                  ExpandablePanelHeaderAlignment
                                                      .center,
                                              hasIcon: true,
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(11.0),
                                  border: Border.all(
                                    color: Color(0x359A4C95),
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(11.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Builder(builder: (_) {
                                      if (!expandableListenerRegistered3) {
                                        expandableListenerRegistered3 = true;
                                        _model.expandableController3
                                            .addListener(
                                          () async {
                                            if (_model.expandableController3
                                                .expanded!) {
                                              setState(() {
                                                _model.activeWendnesDayValue =
                                                    true;
                                              });
                                            }
                                          },
                                        );
                                      }
                                      return Container(
                                        width: double.infinity,
                                        color: Color(0x00000000),
                                        child: ExpandableNotifier(
                                          controller:
                                              _model.expandableController3,
                                          child: ExpandablePanel(
                                            header: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Switch.adaptive(
                                                    value: _model
                                                            .activeWendnesDayValue ??=
                                                        false,
                                                    onChanged:
                                                        (newValue) async {
                                                      setState(() => _model
                                                              .activeWendnesDayValue =
                                                          newValue!);
                                                    },
                                                    activeColor:
                                                        Color(0xFFA954B2),
                                                    activeTrackColor:
                                                        Color(0x729A4C95),
                                                    inactiveTrackColor:
                                                        Color(0xFFEBEDEE),
                                                    inactiveThumbColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'ubr6216k' /* Quarta */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            collapsed: Opacity(
                                              opacity: 0.8,
                                              child: Container(),
                                            ),
                                            expanded: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked13Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked13Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked13 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked13Time
                                                                    .hour,
                                                                _datePicked13Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked13,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked14Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked14Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked14 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked14Time
                                                                    .hour,
                                                                _datePicked14Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked14,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked15Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked15Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked15 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked15Time
                                                                    .hour,
                                                                _datePicked15Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked15,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked16Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked16Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked16 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked16Time
                                                                    .hour,
                                                                _datePicked16Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked16,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked17Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked17Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked17 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked17Time
                                                                    .hour,
                                                                _datePicked17Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked17,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked18Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked18Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked18 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked18Time
                                                                    .hour,
                                                                _datePicked18Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked18,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            theme: ExpandableThemeData(
                                              tapHeaderToExpand: true,
                                              tapBodyToExpand: false,
                                              tapBodyToCollapse: false,
                                              headerAlignment:
                                                  ExpandablePanelHeaderAlignment
                                                      .center,
                                              hasIcon: true,
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(11.0),
                                  border: Border.all(
                                    color: Color(0x359A4C95),
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(11.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Builder(builder: (_) {
                                      if (!expandableListenerRegistered4) {
                                        expandableListenerRegistered4 = true;
                                        _model.expandableController4
                                            .addListener(
                                          () async {
                                            if (_model.expandableController4
                                                .expanded!) {
                                              setState(() {
                                                _model.activeThursdayValue =
                                                    true;
                                              });
                                            }
                                          },
                                        );
                                      }
                                      return Container(
                                        width: double.infinity,
                                        color: Color(0x00000000),
                                        child: ExpandableNotifier(
                                          controller:
                                              _model.expandableController4,
                                          child: ExpandablePanel(
                                            header: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Switch.adaptive(
                                                    value: _model
                                                            .activeThursdayValue ??=
                                                        false,
                                                    onChanged:
                                                        (newValue) async {
                                                      setState(() => _model
                                                              .activeThursdayValue =
                                                          newValue!);
                                                    },
                                                    activeColor:
                                                        Color(0xFFA954B2),
                                                    activeTrackColor:
                                                        Color(0x729A4C95),
                                                    inactiveTrackColor:
                                                        Color(0xFFEBEDEE),
                                                    inactiveThumbColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '7nv5ux2g' /* Quinta */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            collapsed: Opacity(
                                              opacity: 0.8,
                                              child: Container(),
                                            ),
                                            expanded: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked19Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked19Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked19 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked19Time
                                                                    .hour,
                                                                _datePicked19Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked19,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked20Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked20Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked20 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked20Time
                                                                    .hour,
                                                                _datePicked20Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked20,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked21Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked21Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked21 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked21Time
                                                                    .hour,
                                                                _datePicked21Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked21,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked22Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked22Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked22 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked22Time
                                                                    .hour,
                                                                _datePicked22Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked22,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked23Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked23Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked23 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked23Time
                                                                    .hour,
                                                                _datePicked23Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked23,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked24Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked24Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked24 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked24Time
                                                                    .hour,
                                                                _datePicked24Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked24,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            theme: ExpandableThemeData(
                                              tapHeaderToExpand: true,
                                              tapBodyToExpand: false,
                                              tapBodyToCollapse: false,
                                              headerAlignment:
                                                  ExpandablePanelHeaderAlignment
                                                      .center,
                                              hasIcon: true,
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(11.0),
                                  border: Border.all(
                                    color: Color(0x359A4C95),
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(11.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Builder(builder: (_) {
                                      if (!expandableListenerRegistered5) {
                                        expandableListenerRegistered5 = true;
                                        _model.expandableController5
                                            .addListener(
                                          () async {
                                            if (_model.expandableController5
                                                .expanded!) {
                                              setState(() {
                                                _model.activeFridayValue = true;
                                              });
                                            }
                                          },
                                        );
                                      }
                                      return Container(
                                        width: double.infinity,
                                        color: Color(0x00000000),
                                        child: ExpandableNotifier(
                                          controller:
                                              _model.expandableController5,
                                          child: ExpandablePanel(
                                            header: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Switch.adaptive(
                                                    value: _model
                                                            .activeFridayValue ??=
                                                        false,
                                                    onChanged:
                                                        (newValue) async {
                                                      setState(() => _model
                                                              .activeFridayValue =
                                                          newValue!);
                                                    },
                                                    activeColor:
                                                        Color(0xFFA954B2),
                                                    activeTrackColor:
                                                        Color(0x729A4C95),
                                                    inactiveTrackColor:
                                                        Color(0xFFEBEDEE),
                                                    inactiveThumbColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'ryoy0y8l' /* Sexta */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            collapsed: Opacity(
                                              opacity: 0.8,
                                              child: Container(),
                                            ),
                                            expanded: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked25Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked25Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked25 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked25Time
                                                                    .hour,
                                                                _datePicked25Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked25,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked26Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked26Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked26 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked26Time
                                                                    .hour,
                                                                _datePicked26Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked26,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked27Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked27Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked27 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked27Time
                                                                    .hour,
                                                                _datePicked27Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked27,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked28Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked28Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked28 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked28Time
                                                                    .hour,
                                                                _datePicked28Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked28,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked29Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked29Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked29 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked29Time
                                                                    .hour,
                                                                _datePicked29Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked29,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked30Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked30Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked30 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked30Time
                                                                    .hour,
                                                                _datePicked30Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked30,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            theme: ExpandableThemeData(
                                              tapHeaderToExpand: true,
                                              tapBodyToExpand: false,
                                              tapBodyToCollapse: false,
                                              headerAlignment:
                                                  ExpandablePanelHeaderAlignment
                                                      .center,
                                              hasIcon: true,
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(11.0),
                                  border: Border.all(
                                    color: Color(0x359A4C95),
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(11.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Builder(builder: (_) {
                                      if (!expandableListenerRegistered6) {
                                        expandableListenerRegistered6 = true;
                                        _model.expandableController6
                                            .addListener(
                                          () async {
                                            if (_model.expandableController6
                                                .expanded!) {
                                              setState(() {
                                                _model.activeSaturdayValue =
                                                    true;
                                              });
                                            }
                                          },
                                        );
                                      }
                                      return Container(
                                        width: double.infinity,
                                        color: Color(0x00000000),
                                        child: ExpandableNotifier(
                                          controller:
                                              _model.expandableController6,
                                          child: ExpandablePanel(
                                            header: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Switch.adaptive(
                                                    value: _model
                                                            .activeSaturdayValue ??=
                                                        false,
                                                    onChanged:
                                                        (newValue) async {
                                                      setState(() => _model
                                                              .activeSaturdayValue =
                                                          newValue!);
                                                    },
                                                    activeColor:
                                                        Color(0xFFAD53B6),
                                                    activeTrackColor:
                                                        Color(0x72964991),
                                                    inactiveTrackColor:
                                                        Color(0xFFEBEDEE),
                                                    inactiveThumbColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'e3fz2rii' /* Sábado */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            collapsed: Opacity(
                                              opacity: 0.8,
                                              child: Container(),
                                            ),
                                            expanded: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked31Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked31Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked31 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked31Time
                                                                    .hour,
                                                                _datePicked31Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked31,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked32Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked32Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked32 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked32Time
                                                                    .hour,
                                                                _datePicked32Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked32,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked33Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked33Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked33 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked33Time
                                                                    .hour,
                                                                _datePicked33Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked33,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked34Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked34Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked34 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked34Time
                                                                    .hour,
                                                                _datePicked34Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked34,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked35Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked35Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked35 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked35Time
                                                                    .hour,
                                                                _datePicked35Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked35,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked36Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked36Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked36 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked36Time
                                                                    .hour,
                                                                _datePicked36Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked36,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            theme: ExpandableThemeData(
                                              tapHeaderToExpand: true,
                                              tapBodyToExpand: false,
                                              tapBodyToCollapse: false,
                                              headerAlignment:
                                                  ExpandablePanelHeaderAlignment
                                                      .center,
                                              hasIcon: true,
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(11.0),
                                  border: Border.all(
                                    color: Color(0x359A4C95),
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(11.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Builder(builder: (_) {
                                      if (!expandableListenerRegistered7) {
                                        expandableListenerRegistered7 = true;
                                        _model.expandableController7
                                            .addListener(
                                          () async {
                                            if (_model.expandableController7
                                                .expanded!) {
                                              setState(() {
                                                _model.activeSundayValue = true;
                                              });
                                            }
                                          },
                                        );
                                      }
                                      return Container(
                                        width: double.infinity,
                                        color: Color(0x00000000),
                                        child: ExpandableNotifier(
                                          controller:
                                              _model.expandableController7,
                                          child: ExpandablePanel(
                                            header: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Switch.adaptive(
                                                    value: _model
                                                            .activeSundayValue ??=
                                                        false,
                                                    onChanged:
                                                        (newValue) async {
                                                      setState(() => _model
                                                              .activeSundayValue =
                                                          newValue!);
                                                    },
                                                    activeColor:
                                                        Color(0xFFA954B2),
                                                    activeTrackColor:
                                                        Color(0x729A4C95),
                                                    inactiveTrackColor:
                                                        Color(0xFFEBEDEE),
                                                    inactiveThumbColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'kfh1sp3i' /* Domingo */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            collapsed: Opacity(
                                              opacity: 0.8,
                                              child: Container(),
                                            ),
                                            expanded: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked37Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked37Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked37 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked37Time
                                                                    .hour,
                                                                _datePicked37Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked37,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked38Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked38Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked38 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked38Time
                                                                    .hour,
                                                                _datePicked38Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked38,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked39Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked39Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked39 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked39Time
                                                                    .hour,
                                                                _datePicked39Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked39,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked40Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked40Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked40 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked40Time
                                                                    .hour,
                                                                _datePicked40Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked40,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked41Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked41Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked41 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked41Time
                                                                    .hour,
                                                                _datePicked41Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked41,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final _datePicked42Time =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                          if (_datePicked42Time !=
                                                              null) {
                                                            safeSetState(() {
                                                              _model.datePicked42 =
                                                                  DateTime(
                                                                getCurrentTimestamp
                                                                    .year,
                                                                getCurrentTimestamp
                                                                    .month,
                                                                getCurrentTimestamp
                                                                    .day,
                                                                _datePicked42Time
                                                                    .hour,
                                                                _datePicked42Time
                                                                    .minute,
                                                              );
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 328.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x47737373),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  'jm',
                                                                  _model
                                                                      .datePicked42,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Selecionar um horário de atendimento',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Color(
                                                                        0xE257636C),
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            theme: ExpandableThemeData(
                                              tapHeaderToExpand: true,
                                              tapBodyToExpand: false,
                                              tapBodyToCollapse: false,
                                              headerAlignment:
                                                  ExpandablePanelHeaderAlignment
                                                      .center,
                                              hasIcon: true,
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ].divide(SizedBox(height: 10.0)),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            autofocus: true,
                            textCapitalization: TextCapitalization.none,
                            textInputAction: TextInputAction.send,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                'sv3zxrpx' /* Valor por Sessão */,
                              ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Color(0xFF626B73),
                                    fontSize: 12.0,
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Color(0xFFE0E3E7),
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xFF161A1C),
                                ),
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            validator: _model.textControllerValidator
                                .asValidator(context),
                            inputFormatters: [_model.textFieldMask],
                          ),
                        ),
                      ),
                      FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController ??=
                            FormFieldController<String>(
                          _model.dropDownValue ??=
                              FFLocalizations.of(context).getText(
                            'c2k0pmha' /* 50 min */,
                          ),
                        ),
                        options: [
                          FFLocalizations.of(context).getText(
                            'u6apq7y7' /* 50 min */,
                          )
                        ],
                        onChanged: (val) =>
                            setState(() => _model.dropDownValue = val),
                        width: 180.0,
                        height: 50.0,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                        hintText: FFLocalizations.of(context).getText(
                          'fbki6oes' /* Tempo da sessão */,
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor: Colors.white,
                        elevation: 1.0,
                        borderColor: FlutterFlowTheme.of(context).alternate,
                        borderWidth: 1.0,
                        borderRadius: 100.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
                            16.0, 4.0, 16.0, 4.0),
                        hidesUnderline: true,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: ((_model.textController.text == null ||
                                  _model.textController.text == '') ||
                              (((_model.activeMondayValue == false) ||
                                      (_model.datePicked1 == null)) &&
                                  ((_model.activeTuesdayValue == false) ||
                                      (_model.datePicked7 == null)) &&
                                  ((_model.activeWendnesDayValue == false) ||
                                      (_model.datePicked13 == null)) &&
                                  ((_model.activeThursdayValue == false) ||
                                      (_model.datePicked19 == null)) &&
                                  ((_model.activeFridayValue == false) ||
                                      (_model.datePicked25 == null)) &&
                                  ((_model.activeSaturdayValue == false) ||
                                      (_model.datePicked31 == null)) &&
                                  ((_model.activeSundayValue == false) ||
                                      (_model.datePicked37 == null))))
                          ? null
                          : () async {
                              var horaryRecordReference =
                                  HoraryRecord.collection.doc();
                              await horaryRecordReference
                                  .set(createHoraryRecordData(
                                fkUser: currentUserReference,
                                days: updateTimersStruct(
                                  TimersStruct(
                                    timeMonday: DayStruct(
                                      name: 'Segunda',
                                      fieldOne: _model.datePicked1,
                                      fieldTwo: _model.datePicked2,
                                      fieldThree: _model.datePicked3,
                                      fieldFour: _model.datePicked4,
                                      fieldFive: _model.datePicked5,
                                      fieldSix: _model.datePicked6,
                                      activate: _model.activeMondayValue,
                                    ),
                                    timeTuesday: DayStruct(
                                      name: 'Terça',
                                      fieldOne: _model.datePicked7,
                                      fieldTwo: _model.datePicked8,
                                      fieldThree: _model.datePicked9,
                                      fieldFour: _model.datePicked10,
                                      fieldFive: _model.datePicked11,
                                      fieldSix: _model.datePicked12,
                                      activate: _model.activeTuesdayValue,
                                    ),
                                    timeWednesday: DayStruct(
                                      name: 'Quarta',
                                      fieldOne: _model.datePicked13,
                                      fieldTwo: _model.datePicked14,
                                      fieldThree: _model.datePicked15,
                                      fieldFour: _model.datePicked16,
                                      fieldFive: _model.datePicked17,
                                      fieldSix: _model.datePicked18,
                                      activate: _model.activeWendnesDayValue,
                                    ),
                                    timeThursday: DayStruct(
                                      name: 'Quinta',
                                      fieldOne: _model.datePicked19,
                                      fieldTwo: _model.datePicked20,
                                      fieldThree: _model.datePicked21,
                                      fieldFour: _model.datePicked22,
                                      fieldFive: _model.datePicked23,
                                      fieldSix: _model.datePicked24,
                                      activate: _model.activeThursdayValue,
                                    ),
                                    timeFriday: DayStruct(
                                      name: 'Sexta',
                                      fieldOne: _model.datePicked25,
                                      fieldTwo: _model.datePicked26,
                                      fieldThree: _model.datePicked27,
                                      fieldFour: _model.datePicked28,
                                      fieldFive: _model.datePicked29,
                                      fieldSix: _model.datePicked30,
                                      activate: _model.activeFridayValue,
                                    ),
                                    timeSaturday: DayStruct(
                                      name: 'Sábado',
                                      fieldOne: _model.datePicked31,
                                      fieldTwo: _model.datePicked32,
                                      fieldThree: _model.datePicked33,
                                      fieldFour: _model.datePicked34,
                                      fieldFive: _model.datePicked35,
                                      fieldSix: _model.datePicked36,
                                      activate: _model.activeSaturdayValue,
                                    ),
                                    timeSunday: DayStruct(
                                      name: 'Domingo',
                                      fieldOne: _model.datePicked37,
                                      fieldTwo: _model.datePicked38,
                                      fieldThree: _model.datePicked39,
                                      fieldFour: _model.datePicked40,
                                      fieldFive: _model.datePicked41,
                                      fieldSix: _model.datePicked42,
                                      activate: _model.activeSundayValue,
                                    ),
                                  ),
                                  clearUnsetFields: false,
                                  create: true,
                                ),
                              ));
                              _model.horaryCollection =
                                  HoraryRecord.getDocumentFromData(
                                      createHoraryRecordData(
                                        fkUser: currentUserReference,
                                        days: updateTimersStruct(
                                          TimersStruct(
                                            timeMonday: DayStruct(
                                              name: 'Segunda',
                                              fieldOne: _model.datePicked1,
                                              fieldTwo: _model.datePicked2,
                                              fieldThree: _model.datePicked3,
                                              fieldFour: _model.datePicked4,
                                              fieldFive: _model.datePicked5,
                                              fieldSix: _model.datePicked6,
                                              activate:
                                                  _model.activeMondayValue,
                                            ),
                                            timeTuesday: DayStruct(
                                              name: 'Terça',
                                              fieldOne: _model.datePicked7,
                                              fieldTwo: _model.datePicked8,
                                              fieldThree: _model.datePicked9,
                                              fieldFour: _model.datePicked10,
                                              fieldFive: _model.datePicked11,
                                              fieldSix: _model.datePicked12,
                                              activate:
                                                  _model.activeTuesdayValue,
                                            ),
                                            timeWednesday: DayStruct(
                                              name: 'Quarta',
                                              fieldOne: _model.datePicked13,
                                              fieldTwo: _model.datePicked14,
                                              fieldThree: _model.datePicked15,
                                              fieldFour: _model.datePicked16,
                                              fieldFive: _model.datePicked17,
                                              fieldSix: _model.datePicked18,
                                              activate:
                                                  _model.activeWendnesDayValue,
                                            ),
                                            timeThursday: DayStruct(
                                              name: 'Quinta',
                                              fieldOne: _model.datePicked19,
                                              fieldTwo: _model.datePicked20,
                                              fieldThree: _model.datePicked21,
                                              fieldFour: _model.datePicked22,
                                              fieldFive: _model.datePicked23,
                                              fieldSix: _model.datePicked24,
                                              activate:
                                                  _model.activeThursdayValue,
                                            ),
                                            timeFriday: DayStruct(
                                              name: 'Sexta',
                                              fieldOne: _model.datePicked25,
                                              fieldTwo: _model.datePicked26,
                                              fieldThree: _model.datePicked27,
                                              fieldFour: _model.datePicked28,
                                              fieldFive: _model.datePicked29,
                                              fieldSix: _model.datePicked30,
                                              activate:
                                                  _model.activeFridayValue,
                                            ),
                                            timeSaturday: DayStruct(
                                              name: 'Sábado',
                                              fieldOne: _model.datePicked31,
                                              fieldTwo: _model.datePicked32,
                                              fieldThree: _model.datePicked33,
                                              fieldFour: _model.datePicked34,
                                              fieldFive: _model.datePicked35,
                                              fieldSix: _model.datePicked36,
                                              activate:
                                                  _model.activeSaturdayValue,
                                            ),
                                            timeSunday: DayStruct(
                                              name: 'Domingo',
                                              fieldOne: _model.datePicked37,
                                              fieldTwo: _model.datePicked38,
                                              fieldThree: _model.datePicked39,
                                              fieldFour: _model.datePicked40,
                                              fieldFive: _model.datePicked41,
                                              fieldSix: _model.datePicked42,
                                              activate:
                                                  _model.activeSundayValue,
                                            ),
                                          ),
                                          clearUnsetFields: false,
                                          create: true,
                                        ),
                                      ),
                                      horaryRecordReference);
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child:
                                          AlertRegisterUserTheraphistModalWidget(
                                        refValueSession:
                                            functions.convertValuePratice(
                                                _model.textController.text),
                                        refHorary:
                                            _model.horaryCollection?.reference,
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));

                              setState(() {});
                            },
                      text: FFLocalizations.of(context).getText(
                        'j293iee4' /* Finalizar */,
                      ),
                      options: FFButtonOptions(
                        width: 352.0,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFF9420AF),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        disabledColor: Color(0xFFB0B0B0),
                        disabledTextColor: Color(0x82FFFFFF),
                      ),
                    ),
                  ],
                ),
              ].divide(SizedBox(height: 10.0)),
            ),
          ),
        ),
      ),
    );
  }
}
