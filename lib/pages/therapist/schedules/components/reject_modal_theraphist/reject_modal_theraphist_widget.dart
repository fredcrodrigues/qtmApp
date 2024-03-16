import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/therapist/schedules/components/alert_reject_theraphist/alert_reject_theraphist_widget.dart';
import '/pages/therapist/schedules/components/erro_moda_refund_theraphist/erro_moda_refund_theraphist_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reject_modal_theraphist_model.dart';
export 'reject_modal_theraphist_model.dart';

class RejectModalTheraphistWidget extends StatefulWidget {
  const RejectModalTheraphistWidget({
    super.key,
    this.refRequest,
    this.refTheraphist,
    required this.refPatientUser,
    required this.paymentId,
  });

  final DocumentReference? refRequest;
  final DocumentReference? refTheraphist;
  final DocumentReference? refPatientUser;
  final String? paymentId;

  @override
  State<RejectModalTheraphistWidget> createState() =>
      _RejectModalTheraphistWidgetState();
}

class _RejectModalTheraphistWidgetState
    extends State<RejectModalTheraphistWidget> {
  late RejectModalTheraphistModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RejectModalTheraphistModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Material(
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
          height: 560.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'pt0k86si' /* Tem certeza que deseja */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '1or7boai' /* recusar esta solicitação?! */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/astronautatriste.png',
                        width: 153.0,
                        height: 131.0,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.safePop();
                              },
                              text: FFLocalizations.of(context).getText(
                                'd1kvia5u' /* Cancelar */,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 49.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Colors.white,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Color(0xFFA54EAF),
                                      fontWeight: FontWeight.w500,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Color(0xFF95489D),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Builder(
                            builder: (context) => Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  var _shouldSetState = false;
                                  _model.responseApiRefund =
                                      await StripeApiNodeGroup
                                          .cancelPaymentIntentCall
                                          .call(
                                    paymentIntentId: widget.paymentId,
                                  );
                                  _shouldSetState = true;
                                  if ((_model.responseApiRefund?.statusCode ??
                                          200) ==
                                      200) {
                                    await widget.refRequest!
                                        .update(createRequestsRecordData(
                                      status: 'refused',
                                    ));

                                    await NotificationsRecord.collection
                                        .doc()
                                        .set(createNotificationsRecordData(
                                          description:
                                              'Sua solicitação foi recusada por ${valueOrDefault(currentUserDocument?.firstName, '')}',
                                          nameOfNotification:
                                              'Solicitação de atendimento recusada',
                                          typeOfNotitfication:
                                              'request refused',
                                          fkRequest: widget.refRequest,
                                          fkUserSend: widget.refPatientUser,
                                          timer: getCurrentTimestamp,
                                        ));
                                    triggerPushNotification(
                                      notificationTitle: 'Solicitação Recusada',
                                      notificationText: valueOrDefault<String>(
                                        'Sua solicitação foi recusada por ${valueOrDefault(currentUserDocument?.firstName, '')}',
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
                                          child: AlertRejectTheraphistWidget(),
                                        );
                                      },
                                    ).then((value) => setState(() {}));

                                    context.pushNamed(
                                      'schedules_theraphist_page',
                                      queryParameters: {
                                        'refTheraphist': serializeParam(
                                          widget.refTheraphist,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );

                                    if (_shouldSetState) setState(() {});
                                    return;
                                  } else {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child:
                                              ErroModaRefundTheraphistWidget(),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));

                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }

                                  if (_shouldSetState) setState(() {});
                                },
                                text: FFLocalizations.of(context).getText(
                                  'tk0nvp15' /* Recusar */,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 49.0,
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
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 6.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
