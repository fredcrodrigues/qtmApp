import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/drawer/components_general/bottom_navigation_bar_theraphist/bottom_navigation_bar_theraphist_widget.dart';
import '/pages/drawer/modal_languge/modal_languge_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'history_requests_theraphist_page_model.dart';
export 'history_requests_theraphist_page_model.dart';

class HistoryRequestsTheraphistPageWidget extends StatefulWidget {
  const HistoryRequestsTheraphistPageWidget({super.key});

  @override
  State<HistoryRequestsTheraphistPageWidget> createState() =>
      _HistoryRequestsTheraphistPageWidgetState();
}

class _HistoryRequestsTheraphistPageWidgetState
    extends State<HistoryRequestsTheraphistPageWidget>
    with TickerProviderStateMixin {
  late HistoryRequestsTheraphistPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: 0.2,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: 0.2,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: 0.2,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: 0.2,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistoryRequestsTheraphistPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.loadRequests = true;
      });
      _model.requests = await queryRequestsRecordOnce(
        queryBuilder: (requestsRecord) => requestsRecord
            .whereIn('status', ['canceled', 'finalized', 'refused']).where(
          'fk_theraphist',
          isEqualTo: FFAppState().refTheraphist,
        ),
      );
      setState(() {
        _model.allRequests = _model.requests!.toList().cast<RequestsRecord>();
      });
      setState(() {
        _model.requestsFiltered = functions
            .filterRequestsInHistory(_model.allRequests.toList(), _model.filter)
            .toList()
            .cast<RequestsRecord>();
      });
      setState(() {
        _model.loadRequests = false;
      });
    });

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
        backgroundColor: Color(0xFFA54EAF),
        drawer: Drawer(
          elevation: 16.0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/logo-qtm-correta.png',
                            width: 50.0,
                            height: 50.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'fqhptszg' /* QTM Healthtech */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: Color(0xFF121518),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ].divide(SizedBox(width: 10.0)),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Color(0x9FA0A0A0),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        ListTile(
                          leading: Icon(
                            Icons.person_2,
                            color: Color(0xC2000000),
                            size: 14.0,
                          ),
                          title: Text(
                            FFLocalizations.of(context).getText(
                              'd07z5957' /* Perfil */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Outfit',
                                  color: Color(0xFF121518),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          tileColor: Colors.white,
                          dense: false,
                        ),
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        ListTile(
                          leading: Icon(
                            Icons.switch_account,
                            color: Color(0xC2000000),
                            size: 14.0,
                          ),
                          title: Text(
                            FFLocalizations.of(context).getText(
                              'vun37n0a' /* Minha Conta */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Outfit',
                                  color: Color(0xFF121518),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          tileColor: Colors.white,
                          dense: false,
                        ),
                      Builder(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await Share.share(
                              'Baixe o nosso APP da QTM nas lojas APPLE STORE e PLAYSTORE',
                              sharePositionOrigin:
                                  getWidgetBoundingBox(context),
                            );
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.card_giftcard,
                              color: Color(0xC2000000),
                              size: 14.0,
                            ),
                            title: Text(
                              FFLocalizations.of(context).getText(
                                '1xp7k9g6' /* Convidar Amigos */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF121518),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            tileColor: Colors.white,
                            dense: false,
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('profile_patient');
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.location_history,
                            color: Color(0xC2000000),
                            size: 14.0,
                          ),
                          title: Text(
                            FFLocalizations.of(context).getText(
                              '1xltzcjg' /* Meu perfil */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Outfit',
                                  color: Color(0xFF121518),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          tileColor: Colors.white,
                          dense: false,
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () => _model.unfocusNode.canRequestFocus
                                    ? FocusScope.of(context)
                                        .requestFocus(_model.unfocusNode)
                                    : FocusScope.of(context).unfocus(),
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: ModalLangugeWidget(),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.language_rounded,
                            color: Color(0xC2000000),
                            size: 14.0,
                          ),
                          title: Text(
                            FFLocalizations.of(context).getText(
                              'k0w1njw3' /* Idioma */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Outfit',
                                  color: Color(0xFF121518),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          tileColor: Colors.white,
                          dense: false,
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await launchURL('https://qtmhealthtech.com.br/');
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.computer_sharp,
                            color: Color(0xC2000000),
                            size: 14.0,
                          ),
                          title: Text(
                            FFLocalizations.of(context).getText(
                              '1gsyzbny' /* Pagina QTM */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Outfit',
                                  color: Color(0xFF121518),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          tileColor: Colors.white,
                          dense: false,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Color(0x68B4B4B4),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('politics_drawer_page');
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.content_paste,
                            color: Color(0xC2000000),
                            size: 14.0,
                          ),
                          title: Text(
                            FFLocalizations.of(context).getText(
                              '7tgk92dt' /* Politicas */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Outfit',
                                  color: Color(0xFF121518),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          tileColor: Colors.white,
                          dense: false,
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('terms_drawer_page');
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.switch_account,
                            color: Color(0xC2000000),
                            size: 14.0,
                          ),
                          title: Text(
                            FFLocalizations.of(context).getText(
                              'ddier68c' /* Termos e Condições */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Outfit',
                                  color: Color(0xFF121518),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          tileColor: Colors.white,
                          dense: false,
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          GoRouter.of(context).prepareAuthEvent();
                          await authManager.signOut();
                          GoRouter.of(context).clearRedirectLocation();

                          context.pushNamedAuth('login_page', context.mounted);
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.output_outlined,
                            color: Color(0xC2000000),
                            size: 14.0,
                          ),
                          title: Text(
                            FFLocalizations.of(context).getText(
                              'dldl0mi1' /* Sair */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Outfit',
                                  color: Color(0xFF121518),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          tileColor: Colors.white,
                          dense: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFA54EAF),
                          borderRadius: BorderRadius.circular(0.0),
                          border: Border.all(
                            color: Color(0xFF1DA4D4),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 10.0, 20.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      scaffoldKey.currentState!.openDrawer();
                                    },
                                    child: Icon(
                                      Icons.menu,
                                      color: Colors.white,
                                      size: 35.0,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'lx8rkfh5' /* Histórico */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: Colors.white,
                                            fontSize: 22.0,
                                          ),
                                    ),
                                  ),
                                  Container(
                                    width: 45.0,
                                    height: 59.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFA54EAF),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ].divide(SizedBox(height: 2.0)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 100.0, 0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(50.0),
                            topRight: Radius.circular(50.0),
                          ),
                          child: Container(
                            height: double.infinity,
                            constraints: BoxConstraints(
                              maxHeight: 1080.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(50.0),
                                topRight: Radius.circular(50.0),
                              ),
                              shape: BoxShape.rectangle,
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 10.0, 20.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 30.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              setState(() {
                                                _model.filter = 'all';
                                              });
                                              setState(() {
                                                _model.requestsFiltered =
                                                    functions
                                                        .filterRequestsInHistory(
                                                            _model.allRequests
                                                                .toList(),
                                                            _model.filter)
                                                        .toList()
                                                        .cast<RequestsRecord>();
                                              });
                                            },
                                            child: Container(
                                              width: 100.0,
                                              decoration: BoxDecoration(
                                                color: _model.filter == 'all'
                                                    ? Color(0xFF771D8C)
                                                    : Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(14.0),
                                                  bottomRight:
                                                      Radius.circular(14.0),
                                                  topLeft:
                                                      Radius.circular(14.0),
                                                  topRight:
                                                      Radius.circular(14.0),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 10.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '0i1doz6c' /* Todos */,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color: _model.filter ==
                                                                'all'
                                                            ? Colors.white
                                                            : Color(0xFFB5B5B5),
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            setState(() {
                                              _model.filter = 'canceled';
                                            });
                                            setState(() {
                                              _model.requestsFiltered =
                                                  functions
                                                      .filterRequestsInHistory(
                                                          _model.allRequests
                                                              .toList(),
                                                          _model.filter)
                                                      .toList()
                                                      .cast<RequestsRecord>();
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: _model.filter == 'canceled'
                                                  ? Color(0xFFA92ACC)
                                                  : Colors.white,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(14.0),
                                                bottomRight:
                                                    Radius.circular(14.0),
                                                topLeft: Radius.circular(14.0),
                                                topRight: Radius.circular(14.0),
                                              ),
                                              border: Border.all(
                                                color: Color(0x0D000000),
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 10.0, 10.0, 10.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'tmfynl8s' /* Cancelados */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: _model.filter ==
                                                              'canceled'
                                                          ? Colors.white
                                                          : Color(0xFFB5B5B5),
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            setState(() {
                                              _model.filter = 'finished';
                                            });
                                            setState(() {
                                              _model.requestsFiltered =
                                                  functions
                                                      .filterRequestsInHistory(
                                                          _model.allRequests
                                                              .toList(),
                                                          'finished')
                                                      .toList()
                                                      .cast<RequestsRecord>();
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: _model.filter == 'finished'
                                                  ? Color(0xFF771D8C)
                                                  : Colors.white,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(14.0),
                                                bottomRight:
                                                    Radius.circular(14.0),
                                                topLeft: Radius.circular(14.0),
                                                topRight: Radius.circular(14.0),
                                              ),
                                              border: Border.all(
                                                color: Color(0x0D000000),
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 10.0, 10.0, 10.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'necm7cf8' /* Concluídos */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: _model.filter ==
                                                              'finished'
                                                          ? Colors.white
                                                          : Color(0xFFB5B5B5),
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 10.0)),
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      if (_model.loadRequests) {
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 20.0, 20.0, 0.0),
                                          child: ListView(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 120.0,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Color(0xFFE9E9E9),
                                                            Color(0xFFCBCBCB)
                                                          ],
                                                          stops: [0.0, 1.0],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          end:
                                                              AlignmentDirectional(
                                                                  0, 1.0),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'containerOnPageLoadAnimation1']!),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 120.0,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Color(0xFFE9E9E9),
                                                            Color(0xFFCBCBCB)
                                                          ],
                                                          stops: [0.0, 1.0],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          end:
                                                              AlignmentDirectional(
                                                                  0, 1.0),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'containerOnPageLoadAnimation2']!),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 120.0,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Color(0xFFE9E9E9),
                                                            Color(0xFFCBCBCB)
                                                          ],
                                                          stops: [0.0, 1.0],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          end:
                                                              AlignmentDirectional(
                                                                  0, 1.0),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'containerOnPageLoadAnimation3']!),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 120.0,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Color(0xFFE9E9E9),
                                                            Color(0xFFCBCBCB)
                                                          ],
                                                          stops: [0.0, 1.0],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          end:
                                                              AlignmentDirectional(
                                                                  0, 1.0),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'containerOnPageLoadAnimation4']!),
                                                  ),
                                                ],
                                              ),
                                            ].divide(SizedBox(height: 15.0)),
                                          ),
                                        );
                                      } else {
                                        return Builder(
                                          builder: (context) {
                                            if (_model.allRequests.length ==
                                                0) {
                                              return Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/history.png',
                                                        width: 300.0,
                                                        height: 474.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            } else {
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 30.0, 0.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final requestsFilter =
                                                        _model.requestsFiltered
                                                            .toList();
                                                    return SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            requestsFilter
                                                                .length,
                                                            (requestsFilterIndex) {
                                                          final requestsFilterItem =
                                                              requestsFilter[
                                                                  requestsFilterIndex];
                                                          return StreamBuilder<
                                                              PracticeRecord>(
                                                            stream: PracticeRecord
                                                                .getDocument(
                                                                    requestsFilterItem
                                                                        .fkPractice!),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              final containerPracticeRecord =
                                                                  snapshot
                                                                      .data!;
                                                              return Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            14.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            14.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            14.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            14.0),
                                                                  ),
                                                                  border: Border
                                                                      .all(
                                                                    color: Color(
                                                                        0x19000000),
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          10.0,
                                                                          20.0,
                                                                          15.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            10.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              containerPracticeRecord.name,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Raleway',
                                                                                    color: Color(0xB6434343),
                                                                                    fontSize: 16.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '061v7qlh' /* Segunda, 24 de Out. */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Raleway',
                                                                                    color: Color(0xFFB8B3B3),
                                                                                    fontSize: 8.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'tya6xo92' /* Status */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Raleway',
                                                                                      color: Color(0xFFB8B3B3),
                                                                                      fontSize: 12.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                () {
                                                                                  if (requestsFilterItem.status == 'refused') {
                                                                                    return 'Reembolsado';
                                                                                  } else if (requestsFilterItem.status == 'canceled') {
                                                                                    return 'Cancelado';
                                                                                  } else {
                                                                                    return 'Finalizado';
                                                                                  }
                                                                                }(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Raleway',
                                                                                      color: () {
                                                                                        if (requestsFilterItem.status == 'refund') {
                                                                                          return Color(0xFFF77777);
                                                                                        } else if (requestsFilterItem.status == 'canceled') {
                                                                                          return Color(0xFFF77777);
                                                                                        } else {
                                                                                          return Color(0xFFADA1F6);
                                                                                        }
                                                                                      }(),
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 5.0)),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                45.0,
                                                                            child:
                                                                                VerticalDivider(
                                                                              thickness: 1.0,
                                                                              color: Color(0x34000000),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Visibility(
                                                                              visible: responsiveVisibility(
                                                                                context: context,
                                                                                phone: false,
                                                                                tablet: false,
                                                                                tabletLandscape: false,
                                                                                desktop: false,
                                                                              ),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '8xfxosob' /* Ver mais */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Raleway',
                                                                                      color: Color(0xFF9F9F9F),
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            10.0)),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        }).divide(SizedBox(
                                                            height: 20.0)),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            }
                                          },
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.bottomNavigationBarTheraphistModel,
                  updateCallback: () => setState(() {}),
                  child: BottomNavigationBarTheraphistWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
