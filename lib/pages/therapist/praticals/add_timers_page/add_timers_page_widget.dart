import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/therapist/praticals/components/alert_timer_modal/alert_timer_modal_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'add_timers_page_model.dart';
export 'add_timers_page_model.dart';

class AddTimersPageWidget extends StatefulWidget {
  const AddTimersPageWidget({super.key});

  @override
  State<AddTimersPageWidget> createState() => _AddTimersPageWidgetState();
}

class _AddTimersPageWidgetState extends State<AddTimersPageWidget> {
  late AddTimersPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddTimersPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.singleTheraphist =
          await TheraphistRecord.getDocumentOnce(FFAppState().refTheraphist!);
      setState(() {
        _model.textController?.text = valueOrDefault<String>(
          functions
              .convertNumberCurrency(_model.singleTheraphist!.valueSession),
          '0',
        );
      });
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
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: const Color(0xFFA54EAF),
            automaticallyImplyLeading: false,
            leading: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 100.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
            ),
            title: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 22.0, 0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  '3flmu2to' /* Adicionar Horários */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
              ),
            ),
            actions: const [],
            centerTitle: true,
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: StreamBuilder<List<HoraryRecord>>(
            stream: queryHoraryRecord(
              queryBuilder: (horaryRecord) => horaryRecord.where(
                'fk_user',
                isEqualTo: currentUserReference,
              ),
              singleRecord: true,
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              List<HoraryRecord> columnHoraryRecordList = snapshot.data!;
              // Return an empty Container when the item does not exist.
              if (snapshot.data!.isEmpty) {
                return Container();
              }
              final columnHoraryRecord = columnHoraryRecordList.isNotEmpty
                  ? columnHoraryRecordList.first
                  : null;
              return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 546.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
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
                                      color: const Color(0x359A4C95),
                                    ),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(11.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        width: double.infinity,
                                        color: const Color(0x00000000),
                                        child: ExpandableNotifier(
                                          controller:
                                              _model.expandableController1,
                                          child: ExpandablePanel(
                                            header: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Switch.adaptive(
                                                    value: _model
                                                            .activeMondayValue ??=
                                                        columnHoraryRecord!
                                                            .days
                                                            .timeMonday
                                                            .activate,
                                                    onChanged:
                                                        (newValue) async {
                                                      setState(() => _model
                                                              .activeMondayValue =
                                                          newValue);
                                                    },
                                                    activeColor:
                                                        const Color(0xFFA954B2),
                                                    activeTrackColor:
                                                        const Color(0x729A4C95),
                                                    inactiveTrackColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    inactiveThumbColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'qgl6ti48' /* Segunda */,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                if (_model.activeMondayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeMonday
                                                                          .fieldOne,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked1Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked1Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked1 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked1Time
                                                                        .hour,
                                                                    datePicked1Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeMonday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldOne:
                                                                          _model
                                                                              .datePicked1,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if (_model.activeMondayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeMonday
                                                                          .fieldTwo,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked2Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked2Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked2 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked2Time
                                                                        .hour,
                                                                    datePicked2Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeMonday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldTwo:
                                                                          _model
                                                                              .datePicked2,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if (_model.activeMondayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeMonday
                                                                          .fieldThree,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked3Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked3Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked3 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked3Time
                                                                        .hour,
                                                                    datePicked3Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeMonday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldThree:
                                                                          _model
                                                                              .datePicked3,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if (_model.activeMondayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeMonday
                                                                          .fieldFour,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked4Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked4Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked4 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked4Time
                                                                        .hour,
                                                                    datePicked4Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeMonday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldFour:
                                                                          _model
                                                                              .datePicked4,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if (_model.activeMondayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeMonday
                                                                          .fieldFive,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked5Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked5Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked5 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked5Time
                                                                        .hour,
                                                                    datePicked5Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeMonday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldFive:
                                                                          _model
                                                                              .datePicked5,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if (_model.activeMondayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeMonday
                                                                          .fieldSix,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked6Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked6Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked6 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked6Time
                                                                        .hour,
                                                                    datePicked6Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeMonday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldSix:
                                                                          _model
                                                                              .datePicked6,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            theme: const ExpandableThemeData(
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
                                      ),
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
                                      color: const Color(0x359A4C95),
                                    ),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(11.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        width: double.infinity,
                                        color: const Color(0x00000000),
                                        child: ExpandableNotifier(
                                          controller:
                                              _model.expandableController2,
                                          child: ExpandablePanel(
                                            header: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Switch.adaptive(
                                                    value: _model
                                                            .activeTuesdayValue ??=
                                                        columnHoraryRecord!
                                                            .days
                                                            .timeTuesday
                                                            .activate,
                                                    onChanged:
                                                        (newValue) async {
                                                      setState(() => _model
                                                              .activeTuesdayValue =
                                                          newValue);
                                                    },
                                                    activeColor:
                                                        const Color(0xFFA954B2),
                                                    activeTrackColor:
                                                        const Color(0x729A4C95),
                                                    inactiveTrackColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    inactiveThumbColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '1zf39clt' /* Terça */,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                if (_model.activeTuesdayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeTuesday
                                                                          .fieldOne,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await columnHoraryRecord!
                                                                .reference
                                                                .update(
                                                                    createHoraryRecordData(
                                                              days:
                                                                  createTimersStruct(
                                                                timeTuesday:
                                                                    updateDayStruct(
                                                                  DayStruct(
                                                                    fieldOne: _model
                                                                        .datePicked7,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                                clearUnsetFields:
                                                                    false,
                                                              ),
                                                            ));
                                                          },
                                                          child: Container(
                                                            width: 32.0,
                                                            height: 32.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100.0),
                                                              shape: BoxShape
                                                                  .rectangle,
                                                              border:
                                                                  Border.all(
                                                                color: const Color(
                                                                    0xD3229BF6),
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                final datePicked7Time =
                                                                    await showTimePicker(
                                                                  context:
                                                                      context,
                                                                  initialTime: TimeOfDay
                                                                      .fromDateTime(
                                                                          getCurrentTimestamp),
                                                                );
                                                                if (datePicked7Time !=
                                                                    null) {
                                                                  safeSetState(
                                                                      () {
                                                                    _model.datePicked7 =
                                                                        DateTime(
                                                                      getCurrentTimestamp
                                                                          .year,
                                                                      getCurrentTimestamp
                                                                          .month,
                                                                      getCurrentTimestamp
                                                                          .day,
                                                                      datePicked7Time
                                                                          .hour,
                                                                      datePicked7Time
                                                                          .minute,
                                                                    );
                                                                  });
                                                                }

                                                                await columnHoraryRecord!
                                                                    .reference
                                                                    .update(
                                                                        createHoraryRecordData(
                                                                  days:
                                                                      createTimersStruct(
                                                                    timeTuesday:
                                                                        updateDayStruct(
                                                                      DayStruct(
                                                                        fieldOne:
                                                                            _model.datePicked7,
                                                                      ),
                                                                      clearUnsetFields:
                                                                          false,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                ));
                                                              },
                                                              child: const Icon(
                                                                Icons.edit,
                                                                color: Color(
                                                                    0xD3229BF6),
                                                                size: 14.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if (_model.activeTuesdayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeTuesday
                                                                          .fieldTwo,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked8Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked8Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked8 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked8Time
                                                                        .hour,
                                                                    datePicked8Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeTuesday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldTwo:
                                                                          _model
                                                                              .datePicked8,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if (_model.activeTuesdayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeTuesday
                                                                          .fieldThree,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked9Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked9Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked9 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked9Time
                                                                        .hour,
                                                                    datePicked9Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeWednesday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldThree:
                                                                          _model
                                                                              .datePicked9,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if (_model.activeTuesdayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeTuesday
                                                                          .fieldFour,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked10Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked10Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked10 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked10Time
                                                                        .hour,
                                                                    datePicked10Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeTuesday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldFour:
                                                                          _model
                                                                              .datePicked10,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if (_model.activeTuesdayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeTuesday
                                                                          .fieldFive,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked11Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked11Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked11 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked11Time
                                                                        .hour,
                                                                    datePicked11Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeTuesday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldFive:
                                                                          _model
                                                                              .datePicked11,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if (_model.activeTuesdayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeTuesday
                                                                          .fieldSix,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked12Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked12Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked12 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked12Time
                                                                        .hour,
                                                                    datePicked12Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeTuesday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldSix:
                                                                          _model
                                                                              .datePicked12,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            theme: const ExpandableThemeData(
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
                                      ),
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
                                      color: const Color(0x359A4C95),
                                    ),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(11.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        width: double.infinity,
                                        color: const Color(0x00000000),
                                        child: ExpandableNotifier(
                                          controller:
                                              _model.expandableController3,
                                          child: ExpandablePanel(
                                            header: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Switch.adaptive(
                                                    value: _model
                                                            .activeWednesdayValue ??=
                                                        columnHoraryRecord!
                                                            .days
                                                            .timeWednesday
                                                            .activate,
                                                    onChanged:
                                                        (newValue) async {
                                                      setState(() => _model
                                                              .activeWednesdayValue =
                                                          newValue);
                                                    },
                                                    activeColor:
                                                        const Color(0xFFA954B2),
                                                    activeTrackColor:
                                                        const Color(0x729A4C95),
                                                    inactiveTrackColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    inactiveThumbColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'shu0je7c' /* Quarta */,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                if (_model
                                                        .activeWednesdayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeWednesday
                                                                          .fieldOne,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked13Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked13Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked13 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked13Time
                                                                        .hour,
                                                                    datePicked13Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeWednesday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldOne:
                                                                          _model
                                                                              .datePicked13,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if (_model
                                                        .activeWednesdayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeWednesday
                                                                          .fieldTwo,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked14Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked14Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked14 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked14Time
                                                                        .hour,
                                                                    datePicked14Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeWednesday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldTwo:
                                                                          _model
                                                                              .datePicked14,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if (_model
                                                        .activeWednesdayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeWednesday
                                                                          .fieldThree,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked15Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked15Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked15 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked15Time
                                                                        .hour,
                                                                    datePicked15Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeWednesday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldThree:
                                                                          _model
                                                                              .datePicked15,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if (_model
                                                        .activeWednesdayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeWednesday
                                                                          .fieldFour,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked16Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked16Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked16 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked16Time
                                                                        .hour,
                                                                    datePicked16Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeWednesday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldFour:
                                                                          _model
                                                                              .datePicked16,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if (_model
                                                        .activeWednesdayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeWednesday
                                                                          .fieldFive,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked17Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked17Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked17 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked17Time
                                                                        .hour,
                                                                    datePicked17Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeWednesday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldFive:
                                                                          _model
                                                                              .datePicked17,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if (_model
                                                        .activeWednesdayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeWednesday
                                                                          .fieldSix,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked18Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked18Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked18 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked18Time
                                                                        .hour,
                                                                    datePicked18Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeWednesday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldSix:
                                                                          _model
                                                                              .datePicked18,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            theme: const ExpandableThemeData(
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
                                      ),
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
                                      color: const Color(0x359A4C95),
                                    ),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(11.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        width: double.infinity,
                                        color: const Color(0x00000000),
                                        child: ExpandableNotifier(
                                          controller:
                                              _model.expandableController4,
                                          child: ExpandablePanel(
                                            header: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Switch.adaptive(
                                                    value: _model
                                                            .activeThursdayValue ??=
                                                        columnHoraryRecord!
                                                            .days
                                                            .timeThursday
                                                            .activate,
                                                    onChanged:
                                                        (newValue) async {
                                                      setState(() => _model
                                                              .activeThursdayValue =
                                                          newValue);
                                                    },
                                                    activeColor:
                                                        const Color(0xFFA954B2),
                                                    activeTrackColor:
                                                        const Color(0x729A4C95),
                                                    inactiveTrackColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    inactiveThumbColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'i68ewny4' /* Quinta */,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                if (_model
                                                        .activeThursdayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeThursday
                                                                          .fieldOne,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked19Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked19Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked19 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked19Time
                                                                        .hour,
                                                                    datePicked19Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeThursday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldOne:
                                                                          _model
                                                                              .datePicked19,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if (_model
                                                        .activeThursdayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeThursday
                                                                          .fieldTwo,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked20Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked20Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked20 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked20Time
                                                                        .hour,
                                                                    datePicked20Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeThursday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldTwo:
                                                                          _model
                                                                              .datePicked20,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if (_model
                                                        .activeThursdayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeThursday
                                                                          .fieldThree,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked21Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked21Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked21 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked21Time
                                                                        .hour,
                                                                    datePicked21Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeThursday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldThree:
                                                                          _model
                                                                              .datePicked21,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if (_model
                                                        .activeThursdayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeThursday
                                                                          .fieldFour,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked22Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked22Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked22 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked22Time
                                                                        .hour,
                                                                    datePicked22Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeThursday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldFour:
                                                                          _model
                                                                              .datePicked22,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if (_model
                                                        .activeThursdayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeThursday
                                                                          .fieldFive,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked23Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked23Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked23 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked23Time
                                                                        .hour,
                                                                    datePicked23Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeThursday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldFive:
                                                                          _model
                                                                              .datePicked23,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if (_model
                                                        .activeThursdayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeThursday
                                                                          .fieldSix,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked24Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked24Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked24 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked24Time
                                                                        .hour,
                                                                    datePicked24Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeThursday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldSix:
                                                                          _model
                                                                              .datePicked24,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            theme: const ExpandableThemeData(
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
                                      ),
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
                                      color: const Color(0x359A4C95),
                                    ),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(11.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        width: double.infinity,
                                        color: const Color(0x00000000),
                                        child: ExpandableNotifier(
                                          controller:
                                              _model.expandableController5,
                                          child: ExpandablePanel(
                                            header: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Switch.adaptive(
                                                    value: _model
                                                            .activeFridayValue ??=
                                                        columnHoraryRecord!
                                                            .days
                                                            .timeFriday
                                                            .activate,
                                                    onChanged:
                                                        (newValue) async {
                                                      setState(() => _model
                                                              .activeFridayValue =
                                                          newValue);
                                                    },
                                                    activeColor:
                                                        const Color(0xFFA954B2),
                                                    activeTrackColor:
                                                        const Color(0x729A4C95),
                                                    inactiveTrackColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    inactiveThumbColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'npf2cvw2' /* Sexta */,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                if (_model.activeFridayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeFriday
                                                                          .fieldOne,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked25Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked25Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked25 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked25Time
                                                                        .hour,
                                                                    datePicked25Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeFriday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldOne:
                                                                          _model
                                                                              .datePicked25,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if (_model.activeFridayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeFriday
                                                                          .fieldTwo,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked26Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked26Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked26 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked26Time
                                                                        .hour,
                                                                    datePicked26Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeFriday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldTwo:
                                                                          _model
                                                                              .datePicked26,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if (_model.activeFridayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeSaturday
                                                                          .fieldThree,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked27Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked27Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked27 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked27Time
                                                                        .hour,
                                                                    datePicked27Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeFriday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldThree:
                                                                          _model
                                                                              .datePicked27,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if (_model.activeFridayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeFriday
                                                                          .fieldFour,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked28Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked28Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked28 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked28Time
                                                                        .hour,
                                                                    datePicked28Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeFriday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldFour:
                                                                          _model
                                                                              .datePicked28,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if (_model.activeFridayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeFriday
                                                                          .fieldFive,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked29Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked29Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked29 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked29Time
                                                                        .hour,
                                                                    datePicked29Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeFriday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldFive:
                                                                          _model
                                                                              .datePicked29,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if (_model.activeFridayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeFriday
                                                                          .fieldSix,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked30Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked30Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked30 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked30Time
                                                                        .hour,
                                                                    datePicked30Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeFriday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldSix:
                                                                          _model
                                                                              .datePicked30,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            theme: const ExpandableThemeData(
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
                                      ),
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
                                      color: const Color(0x359A4C95),
                                    ),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(11.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        width: double.infinity,
                                        color: const Color(0x00000000),
                                        child: ExpandableNotifier(
                                          controller:
                                              _model.expandableController6,
                                          child: ExpandablePanel(
                                            header: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Switch.adaptive(
                                                    value: _model
                                                            .activeSartudayValue ??=
                                                        false,
                                                    onChanged:
                                                        (newValue) async {
                                                      setState(() => _model
                                                              .activeSartudayValue =
                                                          newValue);
                                                    },
                                                    activeColor:
                                                        const Color(0xFFA954B2),
                                                    activeTrackColor:
                                                        const Color(0x729A4C95),
                                                    inactiveTrackColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    inactiveThumbColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'te8vxfjz' /* Sábado */,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                if (_model
                                                        .activeSartudayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeSaturday
                                                                          .fieldOne,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked31Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked31Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked31 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked31Time
                                                                        .hour,
                                                                    datePicked31Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeSaturday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldOne:
                                                                          _model
                                                                              .datePicked31,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if (_model
                                                        .activeSartudayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeSaturday
                                                                          .fieldTwo,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked32Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked32Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked32 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked32Time
                                                                        .hour,
                                                                    datePicked32Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeSaturday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldTwo:
                                                                          _model
                                                                              .datePicked32,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if (_model
                                                        .activeSartudayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeSaturday
                                                                          .fieldThree,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked33Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked33Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked33 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked33Time
                                                                        .hour,
                                                                    datePicked33Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeSaturday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldThree:
                                                                          _model
                                                                              .datePicked33,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if (_model
                                                        .activeSartudayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeSaturday
                                                                          .fieldFour,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked34Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked34Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked34 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked34Time
                                                                        .hour,
                                                                    datePicked34Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeSaturday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldFour:
                                                                          _model
                                                                              .datePicked34,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if (_model
                                                        .activeSartudayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeSaturday
                                                                          .fieldFive,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked35Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked35Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked35 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked35Time
                                                                        .hour,
                                                                    datePicked35Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeSaturday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldFive:
                                                                          _model
                                                                              .datePicked35,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if (_model
                                                        .activeSartudayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeSaturday
                                                                          .fieldSix,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked36Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked36Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked36 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked36Time
                                                                        .hour,
                                                                    datePicked36Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeSaturday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldSix:
                                                                          _model
                                                                              .datePicked36,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            theme: const ExpandableThemeData(
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
                                      ),
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
                                      color: const Color(0x359A4C95),
                                    ),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(11.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        width: double.infinity,
                                        color: const Color(0x00000000),
                                        child: ExpandableNotifier(
                                          controller:
                                              _model.expandableController7,
                                          child: ExpandablePanel(
                                            header: Align(
                                              alignment: const AlignmentDirectional(
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
                                                          newValue);
                                                    },
                                                    activeColor:
                                                        const Color(0xFFA954B2),
                                                    activeTrackColor:
                                                        const Color(0x729A4C95),
                                                    inactiveTrackColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    inactiveThumbColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'hqusqbr0' /* Domingo */,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                if (_model.activeSundayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeSunday
                                                                          .fieldOne,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked37Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked37Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked37 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked37Time
                                                                        .hour,
                                                                    datePicked37Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeSunday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldOne:
                                                                          _model
                                                                              .datePicked37,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if (_model.activeSundayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeSunday
                                                                          .fieldTwo,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked38Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked38Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked38 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked38Time
                                                                        .hour,
                                                                    datePicked38Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeSunday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldTwo:
                                                                          _model
                                                                              .datePicked38,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if (_model.activeSundayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeSunday
                                                                          .fieldThree,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked39Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked39Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked39 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked39Time
                                                                        .hour,
                                                                    datePicked39Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeSunday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldThree:
                                                                          _model
                                                                              .datePicked33,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if (_model.activeSundayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeSunday
                                                                          .fieldFour,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked40Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked40Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked40 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked40Time
                                                                        .hour,
                                                                    datePicked40Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeSunday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldFive:
                                                                          _model
                                                                              .datePicked41,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if (_model.activeSundayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeSunday
                                                                          .fieldFive,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked41Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked41Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked41 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked41Time
                                                                        .hour,
                                                                    datePicked41Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                if (_model.activeSundayValue ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 39.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFE0E3E7),
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    dateTimeFormat(
                                                                      'Hm',
                                                                      columnHoraryRecord
                                                                          ?.days
                                                                          .timeSunday
                                                                          .fieldSix,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    'Horário',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xD3229BF6),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              final datePicked42Time =
                                                                  await showTimePicker(
                                                                context:
                                                                    context,
                                                                initialTime: TimeOfDay
                                                                    .fromDateTime(
                                                                        getCurrentTimestamp),
                                                              );
                                                              if (datePicked42Time !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.datePicked42 =
                                                                      DateTime(
                                                                    getCurrentTimestamp
                                                                        .year,
                                                                    getCurrentTimestamp
                                                                        .month,
                                                                    getCurrentTimestamp
                                                                        .day,
                                                                    datePicked42Time
                                                                        .hour,
                                                                    datePicked42Time
                                                                        .minute,
                                                                  );
                                                                });
                                                              }

                                                              await columnHoraryRecord!
                                                                  .reference
                                                                  .update(
                                                                      createHoraryRecordData(
                                                                days:
                                                                    createTimersStruct(
                                                                  timeSunday:
                                                                      updateDayStruct(
                                                                    DayStruct(
                                                                      fieldSix:
                                                                          _model
                                                                              .datePicked42,
                                                                    ),
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            },
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color: Color(
                                                                  0xD3229BF6),
                                                              size: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            theme: const ExpandableThemeData(
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
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ].divide(const SizedBox(height: 10.0)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              autofocus: true,
                              textCapitalization: TextCapitalization.none,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: FFLocalizations.of(context).getText(
                                  'g5t32vse' /* Valor por Sessão */,
                                ),
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 12.0,
                                    ),
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFFA954B2),
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
                                    color: const Color(0xFF171B1E),
                                  ),
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        FlutterFlowDropDown<String>(
                          controller: _model.dropDownValueController ??=
                              FormFieldController<String>(
                            _model.dropDownValue ??=
                                FFLocalizations.of(context).getText(
                              'wlfs0f1p' /* 50 min */,
                            ),
                          ),
                          options: [
                            FFLocalizations.of(context).getText(
                              'a9ro49u3' /* 50 min */,
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
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                          hintText: FFLocalizations.of(context).getText(
                            'i30awoo9' /* Tempo da sessão */,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor: Colors.white,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 1.0,
                          borderRadius: 100.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
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
                        onPressed: (_model.textController.text == '')
                            ? null
                            : () async {
                                final firestoreBatch =
                                    FirebaseFirestore.instance.batch();
                                try {
                                  _model.singsleTheraphistFinished =
                                      await TheraphistRecord.getDocumentOnce(
                                          FFAppState().refTheraphist!);

                                  firestoreBatch.update(
                                      columnHoraryRecord!.reference,
                                      createHoraryRecordData(
                                        days: createTimersStruct(
                                          timeMonday: updateDayStruct(
                                            DayStruct(
                                              activate:
                                                  _model.activeMondayValue,
                                            ),
                                            clearUnsetFields: false,
                                          ),
                                          timeTuesday: updateDayStruct(
                                            DayStruct(
                                              activate:
                                                  _model.activeTuesdayValue,
                                            ),
                                            clearUnsetFields: false,
                                          ),
                                          timeWednesday: updateDayStruct(
                                            DayStruct(
                                              activate:
                                                  _model.activeWednesdayValue,
                                            ),
                                            clearUnsetFields: false,
                                          ),
                                          timeThursday: updateDayStruct(
                                            DayStruct(
                                              activate:
                                                  _model.activeThursdayValue,
                                            ),
                                            clearUnsetFields: false,
                                          ),
                                          timeSaturday: updateDayStruct(
                                            DayStruct(
                                              activate:
                                                  _model.activeSartudayValue,
                                            ),
                                            clearUnsetFields: false,
                                          ),
                                          timeSunday: updateDayStruct(
                                            DayStruct(
                                              activate:
                                                  _model.activeSundayValue,
                                            ),
                                            clearUnsetFields: false,
                                          ),
                                          timeFriday: updateDayStruct(
                                            DayStruct(
                                              activate:
                                                  _model.activeFridayValue,
                                            ),
                                            clearUnsetFields: false,
                                          ),
                                          clearUnsetFields: false,
                                        ),
                                      ));

                                  firestoreBatch.update(
                                      _model
                                          .singsleTheraphistFinished!.reference,
                                      createTheraphistRecordData(
                                        valueSession: valueOrDefault<double>(
                                          functions.convertValuePratice(
                                              _model.textController.text),
                                          0.0,
                                        ),
                                      ));
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
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: const AlertTimerModalWidget(),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                } finally {
                                  await firestoreBatch.commit();
                                }

                                setState(() {});
                              },
                        text: FFLocalizations.of(context).getText(
                          'x6xcy52c' /* Finalizar */,
                        ),
                        options: FFButtonOptions(
                          width: 352.0,
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: const Color(0xFFA954B2),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                          elevation: 0.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                          disabledColor: const Color(0xD6A54EAF),
                          disabledTextColor: const Color(0xAEFFFFFF),
                        ),
                      ),
                    ],
                  ),
                ].divide(const SizedBox(height: 10.0)),
              );
            },
          ),
        ),
      ),
    );
  }
}
