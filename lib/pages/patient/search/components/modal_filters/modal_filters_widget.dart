import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'modal_filters_model.dart';
export 'modal_filters_model.dart';

class ModalFiltersWidget extends StatefulWidget {
  const ModalFiltersWidget({
    super.key,
    required this.searchState,
  });

  final List<TheraphistRecord>? searchState;

  @override
  State<ModalFiltersWidget> createState() => _ModalFiltersWidgetState();
}

class _ModalFiltersWidgetState extends State<ModalFiltersWidget> {
  late ModalFiltersModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalFiltersModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.test = await querySpecialtyRecordOnce(
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      setState(() {
        _model.specialtyLocal = _model.test;
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F2),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        shape: BoxShape.rectangle,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: Color(0xFF1DA4D4),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.filter_list,
                  color: Colors.white,
                  size: 28.0,
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    'ygbn0wyf' /* Filtros */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Raleway',
                        color: Colors.white,
                        fontSize: 26.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ].divide(SizedBox(width: 10.0)),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 5.0, 5.0, 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.price_change,
                                color: Color(0xFF0083B1),
                                size: 24.0,
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'neyf84np' /* preços */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Raleway',
                                      color: Color(0xFF0083B1),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ].divide(SizedBox(width: 10.0)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'R\$ ${formatNumber(
                                _model.priceRangeLocal,
                                formatType: FormatType.decimal,
                                decimalType: DecimalType.automatic,
                              )}',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Expanded(
                              child: SliderTheme(
                                data: SliderThemeData(
                                  showValueIndicator: ShowValueIndicator.always,
                                ),
                                child: Slider(
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  inactiveColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  min: 1.0,
                                  max: 1000.0,
                                  value: _model.sliderValue ??=
                                      _model.priceRangeLocal!,
                                  label: _model.sliderValue.toString(),
                                  onChanged: (newValue) async {
                                    newValue = double.parse(
                                        newValue.toStringAsFixed(2));
                                    setState(
                                        () => _model.sliderValue = newValue);
                                    _model.updatePage(() {
                                      _model.priceRangeLocal =
                                          _model.sliderValue;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 5.0, 5.0, 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.person,
                                color: Color(0xFF0083B1),
                                size: 24.0,
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'q8sw3sth' /* práticas */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Raleway',
                                      color: Color(0xFF0083B1),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ].divide(SizedBox(width: 10.0)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: StreamBuilder<List<SpecialtyRecord>>(
                          stream: querySpecialtyRecord(),
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
                            List<SpecialtyRecord> columnSpecialtyRecordList =
                                snapshot.data!;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                  columnSpecialtyRecordList.length,
                                  (columnIndex) {
                                final columnSpecialtyRecord =
                                    columnSpecialtyRecordList[columnIndex];
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          _model.specialtyLocal =
                                              columnSpecialtyRecord;
                                        });
                                        await actions.filterBySpecialty(
                                          widget.searchState!.toList(),
                                          columnSpecialtyRecord,
                                        );
                                      },
                                      child: Builder(
                                        builder: (context) {
                                          if (columnSpecialtyRecord.name ==
                                              _model.specialtyLocal?.name) {
                                            return Icon(
                                              Icons.check_box_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            );
                                          } else {
                                            return Icon(
                                              Icons.check_box_outline_blank,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                    Text(
                                      columnSpecialtyRecord.name,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ].divide(SizedBox(width: 5.0)),
                                );
                              }),
                            );
                          },
                        ),
                      ),
                      Text(
                        valueOrDefault<String>(
                          _model.specialtyLocal?.name,
                          'd',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
