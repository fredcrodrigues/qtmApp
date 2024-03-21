import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/therapist/patients/components/information_modal/information_modal_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'prescription_modal_model.dart';
export 'prescription_modal_model.dart';

class PrescriptionModalWidget extends StatefulWidget {
  const PrescriptionModalWidget({
    super.key,
    this.refPatient,
    this.refRequest,
    required this.refPatientUser,
    required this.paymentId,
    required this.refTheraphist,
  });

  final DocumentReference? refPatient;
  final DocumentReference? refRequest;
  final DocumentReference? refPatientUser;
  final String? paymentId;
  final DocumentReference? refTheraphist;

  @override
  State<PrescriptionModalWidget> createState() =>
      _PrescriptionModalWidgetState();
}

class _PrescriptionModalWidgetState extends State<PrescriptionModalWidget> {
  late PrescriptionModalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrescriptionModalModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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

    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 445.0,
        decoration: BoxDecoration(
          color: Color(0xFFFEFEFE),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: SingleChildScrollView(
          primary: false,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Container(
                              width: 50.0,
                              height: 4.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'q6xlv8eg' /* Prescrição terapeuta */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF14181B),
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 20.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  Navigator.pop(context);
                                },
                                child: FaIcon(
                                  FontAwesomeIcons.times,
                                  color: Color(0xC357636C),
                                  size: 25.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'gdwlge4u' /* Paciente Ausente */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Color(0xFF484848),
                                    ),
                              ),
                            ),
                            Switch.adaptive(
                              value: _model.switchPatientValue ??= false,
                              onChanged: (newValue) async {
                                setState(() =>
                                    _model.switchPatientValue = newValue!);
                              },
                              activeColor: Color(0xFF95489D),
                              activeTrackColor: Color(0xAB95489D),
                              inactiveTrackColor:
                                  FlutterFlowTheme.of(context).alternate,
                              inactiveThumbColor: Color(0xFFB0B0B0),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 12.0, 0.0),
                        child: Form(
                          key: _model.formKey,
                          autovalidateMode: AutovalidateMode.always,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              autofocus: true,
                              readOnly: _model.switchPatientValue == true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: FFLocalizations.of(context).getText(
                                  'wnewzw7j' /* Prescrição Terapeûtica */,
                                ),
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
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
                                  borderSide: BorderSide(
                                    color: Color(0xFF95489D),
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
                                prefixIcon: Icon(
                                  Icons.assignment_rounded,
                                  color: Color(0xFF95489D),
                                  size: 14.0,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Color(0xFF484848),
                                  ),
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  6.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'nm4077qv' /* Retorno  */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Color(0xFF484848),
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  38.0, 0.0, 0.0, 0.0),
                              child: Switch.adaptive(
                                value: _model.switchReturnValue ??= false,
                                onChanged: (newValue) async {
                                  setState(() =>
                                      _model.switchReturnValue = newValue!);
                                },
                                activeColor: Color(0xFF95489D),
                                activeTrackColor: Color(0x8995489D),
                                inactiveTrackColor:
                                    FlutterFlowTheme.of(context).alternate,
                                inactiveThumbColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (_model.switchReturnValue == true)
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      final _datePicked1Date =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: getCurrentTimestamp,
                                        firstDate: getCurrentTimestamp,
                                        lastDate: DateTime(2050),
                                      );

                                      if (_datePicked1Date != null) {
                                        safeSetState(() {
                                          _model.datePicked1 = DateTime(
                                            _datePicked1Date.year,
                                            _datePicked1Date.month,
                                            _datePicked1Date.day,
                                          );
                                        });
                                      }
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeIn,
                                      width: 442.0,
                                      height: 54.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        border: Border.all(
                                          color: Color(0xFFE0E3E7),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.calendar_month,
                                              color: Color(0xFF95489D),
                                              size: 14.0,
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                dateTimeFormat(
                                                  'd/M/y',
                                                  _model.datePicked1,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                'Data',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Color(0xFF484848),
                                                  ),
                                            ),
                                          ].divide(SizedBox(width: 10.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      final _datePicked2Time =
                                          await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.fromDateTime(
                                            getCurrentTimestamp),
                                      );
                                      if (_datePicked2Time != null) {
                                        safeSetState(() {
                                          _model.datePicked2 = DateTime(
                                            getCurrentTimestamp.year,
                                            getCurrentTimestamp.month,
                                            getCurrentTimestamp.day,
                                            _datePicked2Time.hour,
                                            _datePicked2Time.minute,
                                          );
                                        });
                                      }
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeIn,
                                      width: 442.0,
                                      height: 54.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        border: Border.all(
                                          color: Color(0xFFE0E3E7),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.access_time_filled,
                                              color: Color(0xFF95489D),
                                              size: 14.0,
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                dateTimeFormat(
                                                  'Hm',
                                                  _model.datePicked2,
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
                                                    fontFamily: 'Readex Pro',
                                                    color: Color(0xFF484848),
                                                  ),
                                            ),
                                          ].divide(SizedBox(width: 10.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 10.0)),
                            ),
                          ),
                        ),
                      if (_model.switchReturnValue == false)
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 442.0,
                                  height: 54.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100.0),
                                    border: Border.all(
                                      color: Colors.white,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[]
                                          .divide(SizedBox(width: 10.0)),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  width: 347.0,
                                  height: 49.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ].divide(SizedBox(height: 7.0)),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Builder(
                          builder: (context) => FFButtonWidget(
                            onPressed: ((_model.textController.text == null ||
                                        _model.textController.text == '') &&
                                    (_model.switchPatientValue == false))
                                ? null
                                : () async {
                                    var _shouldSetState = false;
                                    _model.theraphist =
                                        await TheraphistRecord.getDocumentOnce(
                                            widget.refTheraphist!);
                                    _shouldSetState = true;
                                    if (_model.formKey.currentState == null ||
                                        !_model.formKey.currentState!
                                            .validate()) {
                                      return;
                                    }

                                    var prescriptionRecordReference =
                                        PrescriptionRecord.collection.doc();
                                    await prescriptionRecordReference
                                        .set(createPrescriptionRecordData(
                                      field: _model.textController.text,
                                      fkPatient: widget.refPatient,
                                      fkRequest: widget.refRequest,
                                      fkTheraphist: FFAppState().refTheraphist,
                                    ));
                                    _model.collectionPrescription =
                                        PrescriptionRecord.getDocumentFromData(
                                            createPrescriptionRecordData(
                                              field: _model.textController.text,
                                              fkPatient: widget.refPatient,
                                              fkRequest: widget.refRequest,
                                              fkTheraphist:
                                                  FFAppState().refTheraphist,
                                            ),
                                            prescriptionRecordReference);
                                    _shouldSetState = true;
                                    _model.singleRequest =
                                        await RequestsRecord.getDocumentOnce(
                                            widget.refRequest!);
                                    _shouldSetState = true;

                                    await InvoicingRecord.collection
                                        .doc()
                                        .set(createInvoicingRecordData(
                                          fkRequest: widget.refRequest,
                                          paymentId: widget.paymentId,
                                          fkTheraphit: valueOrDefault<String>(
                                            widget.refTheraphist?.id,
                                            '0',
                                          ),
                                          totalAgain: valueOrDefault<double>(
                                            functions.calculatePercente(_model
                                                .singleRequest!.valueSession),
                                            0.0,
                                          ),
                                          status: 'finished',
                                        ));
                                    if (_model.switchReturnValue == true) {
                                      await widget.refRequest!
                                          .update(createRequestsRecordData(
                                        status: 'return',
                                        dateOfRequest: _model.datePicked1,
                                        timer: _model.datePicked2,
                                      ));

                                      await NotificationsRecord.collection
                                          .doc()
                                          .set(createNotificationsRecordData(
                                            description: valueOrDefault<String>(
                                              'Um retorno foi agendado para o dia ${valueOrDefault<String>(
                                                dateTimeFormat(
                                                  'd/M/y',
                                                  _model.datePicked1,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                '0',
                                              )}ás ${valueOrDefault<String>(
                                                dateTimeFormat(
                                                  'jm',
                                                  _model.datePicked2,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                '0',
                                              )} com o terapeuta ${valueOrDefault(currentUserDocument?.firstName, '')}',
                                              '0',
                                            ),
                                            nameOfNotification:
                                                'Retorno agendado',
                                            typeOfNotitfication: 'return',
                                            fkRequest: widget.refRequest,
                                            fkUserSend: widget.refPatientUser,
                                            timer: getCurrentTimestamp,
                                          ));
                                      triggerPushNotification(
                                        notificationTitle: 'Retorno ',
                                        notificationText:
                                            valueOrDefault<String>(
                                          'Seu retorno foi agendado com${valueOrDefault<String>(
                                            valueOrDefault(
                                                currentUserDocument?.firstName,
                                                ''),
                                            '0',
                                          )}para o dia ${valueOrDefault<String>(
                                            dateTimeFormat(
                                              'd/M/y',
                                              _model.datePicked1,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            '0',
                                          )} ás ${valueOrDefault<String>(
                                            dateTimeFormat(
                                              'Hm',
                                              _model.datePicked2,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            '0',
                                          )}',
                                          '0',
                                        ),
                                        userRefs: [widget.refPatientUser!],
                                        initialPageName:
                                            'notification_patient_page',
                                        parameterData: {},
                                      );
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: InformationModalWidget(),
                                          );
                                        },
                                      ).then((value) => setState(() {}));

                                      if (_shouldSetState) setState(() {});
                                      return;
                                    } else {
                                      await widget.refRequest!
                                          .update(createRequestsRecordData(
                                        status: 'finalized',
                                      ));

                                      await NotificationsRecord.collection
                                          .doc()
                                          .set(createNotificationsRecordData(
                                            description:
                                                'Seu atendimento com o terapeuta ${valueOrDefault(currentUserDocument?.firstName, '')} foi finalizado com sucesso!',
                                            nameOfNotification:
                                                'Atendimento Finalizado',
                                            typeOfNotitfication:
                                                'request finished',
                                            fkRequest: widget.refRequest,
                                            fkUserSend: widget.refPatientUser,
                                            timer: getCurrentTimestamp,
                                          ));
                                      triggerPushNotification(
                                        notificationTitle:
                                            'Atendimento Finalizado',
                                        notificationText:
                                            valueOrDefault<String>(
                                          'Seu atendimento com  o terapeuta ${valueOrDefault<String>(
                                            valueOrDefault(
                                                currentUserDocument?.firstName,
                                                ''),
                                            '0',
                                          )}foi  concluido com sucesso',
                                          '0',
                                        ),
                                        userRefs: [widget.refPatientUser!],
                                        initialPageName:
                                            'notification_patient_page',
                                        parameterData: {},
                                      );
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: InformationModalWidget(),
                                          );
                                        },
                                      ).then((value) => setState(() {}));

                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }

                                    if (_shouldSetState) setState(() {});
                                  },
                            text: FFLocalizations.of(context).getText(
                              'azn33tsk' /* Finalizar */,
                            ),
                            options: FFButtonOptions(
                              width: 279.0,
                              height: 48.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFF95489D),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                              disabledColor: Color(0xFFB0B0B0),
                              disabledTextColor: Color(0xCAFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ].divide(SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}
