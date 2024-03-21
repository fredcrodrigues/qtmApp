import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/patient/schedule_management/components/modal_failed/modal_failed_widget.dart';
import '/pages/patient/schedule_management/components/modal_more_info/modal_more_info_widget.dart';
import '/pages/patient/schedule_management/components/modal_success_cancel/modal_success_cancel_widget.dart';
import 'package:flutter/material.dart';
import 'cancel_schedule_model.dart';
export 'cancel_schedule_model.dart';

class CancelScheduleWidget extends StatefulWidget {
  const CancelScheduleWidget({
    super.key,
    required this.paymentId,
    required this.request,
    this.refTheraphistUser,
  });

  final String? paymentId;
  final RequestsRecord? request;
  final DocumentReference? refTheraphistUser;

  @override
  State<CancelScheduleWidget> createState() => _CancelScheduleWidgetState();
}

class _CancelScheduleWidgetState extends State<CancelScheduleWidget> {
  late CancelScheduleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CancelScheduleModel());

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
      constraints: const BoxConstraints(
        maxWidth: 700.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(14.0),
          topRight: Radius.circular(14.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF1DA4D4),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(14.0),
                bottomRight: Radius.circular(14.0),
                topLeft: Radius.circular(14.0),
                topRight: Radius.circular(14.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'xnucb4it' /* Cancelar consulta */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Raleway',
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ].divide(const SizedBox(width: 10.0)),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'vi54bp5y' /* 1. Consequências */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Raleway',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '1z82vwr4' /* O cancelamento resultará na in... */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              color: const Color(0xFF9A9494),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ].divide(const SizedBox(height: 10.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        '1bscqapx' /* 2. Taxa */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Raleway',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '3nw5pl97' /* Note que será aplicada uma tax... */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              color: const Color(0xFF9A9494),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ].divide(const SizedBox(height: 10.0)),
                ),
              ),
            ].divide(const SizedBox(height: 20.0)),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 1.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 20.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            var shouldSetState = false;
                            _model.response = await StripeApiNodeGroup
                                .checkStatusPaymentIntentCall
                                .call(
                              paymentIntentId: widget.paymentId,
                            );
                            shouldSetState = true;
                            if (StripeApiNodeGroup.checkStatusPaymentIntentCall
                                    .status(
                                  (_model.response?.jsonBody ?? ''),
                                ) ==
                                'succeeded') {
                              await NotificationsRecord.collection
                                  .doc()
                                  .set(createNotificationsRecordData(
                                    description: valueOrDefault<String>(
                                      'O  ${valueOrDefault(currentUserDocument?.firstName, '')} cancelou o seu atendimento ',
                                      '0',
                                    ),
                                    nameOfNotification: 'Cancelamento ',
                                    typeOfNotitfication: 'request cancel',
                                    fkRequest: widget.request?.reference,
                                    fkUserSend: widget.refTheraphistUser,
                                    timer: getCurrentTimestamp,
                                  ));
                              triggerPushNotification(
                                notificationTitle: 'Cancelamento',
                                notificationText:
                                    'O ${valueOrDefault(currentUserDocument?.firstName, '')} cancelou o atendimento com você',
                                userRefs: [widget.refTheraphistUser!],
                                initialPageName: 'notification_theraphist_page',
                                parameterData: {},
                              );
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                useSafeArea: true,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: SizedBox(
                                      height: 500.0,
                                      child: ModalMoreInfoWidget(
                                        paymentId: widget.paymentId!,
                                        request: widget.request!,
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));

                              if (shouldSetState) setState(() {});
                              return;
                            } else {
                              _model.responseCancelPayment =
                                  await StripeApiNodeGroup
                                      .cancelPaymentIntentCall
                                      .call(
                                paymentIntentId: widget.paymentId,
                              );
                              shouldSetState = true;
                              if (StripeApiNodeGroup.cancelPaymentIntentCall
                                      .status(
                                    (_model.responseCancelPayment?.jsonBody ??
                                        ''),
                                  ) ==
                                  'canceled') {
                                await widget.request!.reference
                                    .update(createRequestsRecordData(
                                  status: 'canceled',
                                ));

                                await NotificationsRecord.collection
                                    .doc()
                                    .set(createNotificationsRecordData(
                                      description: valueOrDefault<String>(
                                        'O  ${valueOrDefault(currentUserDocument?.firstName, '')} cancelou o seu atendimento ',
                                        '0',
                                      ),
                                      nameOfNotification: 'Cancelamento ',
                                      typeOfNotitfication: 'request cancel',
                                      fkRequest: widget.request?.reference,
                                      fkUserSend: widget.refTheraphistUser,
                                      timer: getCurrentTimestamp,
                                    ));
                                triggerPushNotification(
                                  notificationTitle: 'Cancelamento',
                                  notificationText:
                                      'O ${valueOrDefault(currentUserDocument?.firstName, '')} cancelou o atendimento com você',
                                  userRefs: [widget.refTheraphistUser!],
                                  initialPageName:
                                      'notification_theraphist_page',
                                  parameterData: {},
                                );
                                Navigator.pop(context);
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  isDismissible: false,
                                  enableDrag: false,
                                  useSafeArea: true,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: const SizedBox(
                                        height: 300.0,
                                        child: ModalSuccessCancelWidget(),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));

                                if (shouldSetState) setState(() {});
                                return;
                              } else {
                                Navigator.pop(context);
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  useSafeArea: true,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: const SizedBox(
                                        height: 300.0,
                                        child: ModalFailedWidget(),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));

                                if (shouldSetState) setState(() {});
                                return;
                              }
                            }

                            if (shouldSetState) setState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            'zl033rhm' /* Confirmar cancelamento */,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0xFFD45858),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Raleway',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: FFLocalizations.of(context).getText(
                            'sd06gzhn' /* Voltar */,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0xFF4F90DB),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ].divide(const SizedBox(height: 10.0)),
                    ),
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
