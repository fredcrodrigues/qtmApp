import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/therapist/patients/components/erro_refused_modal/erro_refused_modal_widget.dart';
import '/pages/therapist/patients/components/refused_modal/refused_modal_widget.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'cancel_schedule_modal_model.dart';
export 'cancel_schedule_modal_model.dart';

class CancelScheduleModalWidget extends StatefulWidget {
  const CancelScheduleModalWidget({
    super.key,
    this.refRequest,
    this.refPatientUser,
    String? refpaymentid,
  }) : refpaymentid = refpaymentid ?? '0';

  final DocumentReference? refRequest;
  final DocumentReference? refPatientUser;
  final String refpaymentid;

  @override
  State<CancelScheduleModalWidget> createState() =>
      _CancelScheduleModalWidgetState();
}

class _CancelScheduleModalWidgetState extends State<CancelScheduleModalWidget> {
  late CancelScheduleModalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CancelScheduleModalModel());

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
      width: double.infinity,
      height: 270.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(0.0, -3.0),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Align(
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'drgswm9n' /* Deseja cancelar o atendimento? */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: const Color(0xFF14181B),
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.pop();
                        },
                        text: FFLocalizations.of(context).getText(
                          '0xx7n0ev' /* Não */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 48.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Colors.white,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Lexend Deca',
                                    color: const Color(0xFFA54EAF),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                          elevation: 0.0,
                          borderSide: const BorderSide(
                            color: Color(0xFFA54EAF),
                            width: 0.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          _model.responseCanceled = await StripeApiNodeGroup
                              .cancelPaymentIntentCall
                              .call(
                            paymentIntentId: widget.refpaymentid,
                          );
                          if ((_model.responseCanceled?.statusCode ?? 200) ==
                              200) {
                            await widget.refRequest!
                                .update(createRequestsRecordData(
                              status: 'canceled',
                            ));

                            await NotificationsRecord.collection
                                .doc()
                                .set(createNotificationsRecordData(
                                  description:
                                      'A sua solicitção com o terapeuta ${valueOrDefault(currentUserDocument?.firstName, '')}foi cancelada!',
                                  nameOfNotification: 'request cancel',
                                  typeOfNotitfication: 'request cancel',
                                  fkRequest: widget.refRequest,
                                  fkUserSend: widget.refPatientUser,
                                  timer: getCurrentTimestamp,
                                ));
                            triggerPushNotification(
                              notificationTitle:
                                  'Solicitação de atendemnto cancelado',
                              notificationText: valueOrDefault<String>(
                                'Sua solicitação de atendimento foi cancelada por ${valueOrDefault(currentUserDocument?.firstName, '')}',
                                '0',
                              ),
                              userRefs: [widget.refPatientUser!],
                              initialPageName: 'requests_page',
                              parameterData: {
                                'filterParam': false,
                              },
                            );
                            _model.singleCalendar =
                                await queryCalendarRecordOnce(
                              queryBuilder: (calendarRecord) => calendarRecord
                                  .where(
                                    'fk_user',
                                    isEqualTo: currentUserReference,
                                  )
                                  .where(
                                    'fk_request',
                                    isEqualTo: widget.refRequest,
                                  ),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);
                            await _model.singleCalendar!.reference.delete();
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: const RefusedModalWidget(),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          } else {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: const ErroRefusedModalWidget(),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          }

                          setState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          'yuv5hmay' /* Sim */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 48.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: const Color(0xFFA54EAF),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                  ),
                          elevation: 2.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ].divide(const SizedBox(width: 20.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
