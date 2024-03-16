import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/registe_user/components/coworkig_create_regiter_modal/coworkig_create_regiter_modal_widget.dart';
import '/pages/registe_user/user_theraphist/introduction/turorial_theraphist_01_page/turorial_theraphist01_page_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'add_pratical_theraphist_page_model.dart';
export 'add_pratical_theraphist_page_model.dart';

class AddPraticalTheraphistPageWidget extends StatefulWidget {
  const AddPraticalTheraphistPageWidget({super.key});

  @override
  State<AddPraticalTheraphistPageWidget> createState() =>
      _AddPraticalTheraphistPageWidgetState();
}

class _AddPraticalTheraphistPageWidgetState
    extends State<AddPraticalTheraphistPageWidget> {
  late AddPraticalTheraphistPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddPraticalTheraphistPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
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
              child: TurorialTheraphist01PageWidget(),
            ),
          );
        },
      ).then((value) => safeSetState(() {}));
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

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
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: Color(0xFFA54EAF),
            automaticallyImplyLeading: false,
            title: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '45gf82gl' /* Adicionar prática integrativa */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Outfit',
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 20.0, 8.0, 0.0),
                            child: TextFormField(
                              controller: _model.textController1,
                              focusNode: _model.textFieldFocusNode1,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: FFLocalizations.of(context).getText(
                                  'jy63lqh8' /* Nome da prática */,
                                ),
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 12.0,
                                    ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 0.0,
                                  ),
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFA954B2),
                                    width: 0.0,
                                  ),
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 0.0,
                                  ),
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 0.0,
                                  ),
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Color(0xFF161A1D),
                                  ),
                              validator: _model.textController1Validator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
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
                              List<SpecialtyRecord>
                                  dropDownSpecialtyRecordList = snapshot.data!;
                              return FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController ??=
                                    FormFieldController<String>(null),
                                options: dropDownSpecialtyRecordList
                                    .map((e) => e.name)
                                    .toList(),
                                onChanged: (val) =>
                                    setState(() => _model.dropDownValue = val),
                                width: 176.0,
                                height: 50.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 12.0,
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  't682qenv' /* Especialidade */,
                                ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: Colors.white,
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderWidth: 1.0,
                                borderRadius: 100.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: FlutterFlowDropDown<String>(
                              multiSelectController:
                                  _model.dropdownSelectValueController ??=
                                      FormFieldController<List<String>>(null),
                              options: [
                                FFLocalizations.of(context).getText(
                                  'p952gb9d' /* Coworking */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'x0cafbz9' /* Domiciliar */,
                                )
                              ],
                              width: 176.0,
                              height: 50.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Color(0xFF161A1D),
                                    fontSize: 12.0,
                                  ),
                              hintText: FFLocalizations.of(context).getText(
                                'pck0ayju' /* Tipo de atendimento */,
                              ),
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: Colors.white,
                              elevation: 2.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderWidth: 0.0,
                              borderRadius: 100.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              isSearchable: false,
                              isMultiSelect: true,
                              onMultiSelectChanged: (val) => setState(
                                  () => _model.dropdownSelectValue = val),
                            ),
                          ),
                        ].divide(SizedBox(width: 5.0)),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                visualDensity: VisualDensity.compact,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              unselectedWidgetColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                            child: Checkbox(
                              value: _model.checkboxValue ??= false,
                              onChanged: (newValue) async {
                                setState(
                                    () => _model.checkboxValue = newValue!);
                              },
                              activeColor: Color(0xFFA92ACC),
                              checkColor: FlutterFlowTheme.of(context).info,
                            ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              '8bkn5azx' /* Eu tenho certificado desta prá... */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 14.0,
                                ),
                          ),
                        ],
                      ),
                    ),
                    if (_model.checkboxValue ?? true)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _model.textController2,
                                focusNode: _model.textFieldFocusNode2,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'vqpo9gzq' /* Certificado de especilidade */,
                                  ),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 12.0,
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 12.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 0.0,
                                    ),
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFA954B2),
                                      width: 0.0,
                                    ),
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 0.0,
                                    ),
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 0.0,
                                    ),
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Color(0xFF161A1D),
                                      fontSize: 12.0,
                                    ),
                                validator: _model.textController2Validator
                                    .asValidator(context),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _model.textController3,
                                focusNode: _model.textFieldFocusNode3,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'h740lkqh' /* Data de Conclusão */,
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
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 0.0,
                                    ),
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFA954B2),
                                      width: 0.0,
                                    ),
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 0.0,
                                    ),
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 0.0,
                                    ),
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Color(0xFF161A1D),
                                    ),
                                keyboardType: TextInputType.datetime,
                                validator: _model.textController3Validator
                                    .asValidator(context),
                                inputFormatters: [_model.textFieldMask3],
                              ),
                            ),
                          ].divide(SizedBox(width: 4.0)),
                        ),
                      ),
                    if (_model.checkboxValue ?? true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            17.0, 12.0, 17.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      final selectedFiles = await selectFiles(
                                        allowedExtensions: ['pdf'],
                                        multiFile: false,
                                      );
                                      if (selectedFiles != null) {
                                        setState(() =>
                                            _model.isDataUploading = true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        var downloadUrls = <String>[];
                                        try {
                                          showUploadMessage(
                                            context,
                                            FFLocalizations.of(context).getText(
                                              'z3yiv2i4' /* Enviando o seu arquivo */,
                                            ),
                                            showLoading: true,
                                          );
                                          selectedUploadedFiles = selectedFiles
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                  ))
                                              .toList();

                                          downloadUrls = (await Future.wait(
                                            selectedFiles.map(
                                              (f) async => await uploadData(
                                                  f.storagePath, f.bytes),
                                            ),
                                          ))
                                              .where((u) => u != null)
                                              .map((u) => u!)
                                              .toList();
                                        } finally {
                                          ScaffoldMessenger.of(context)
                                              .hideCurrentSnackBar();
                                          _model.isDataUploading = false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                                selectedFiles.length &&
                                            downloadUrls.length ==
                                                selectedFiles.length) {
                                          setState(() {
                                            _model.uploadedLocalFile =
                                                selectedUploadedFiles.first;
                                            _model.uploadedFileUrl =
                                                downloadUrls.first;
                                          });
                                          showUploadMessage(
                                            context,
                                            FFLocalizations.of(context).getText(
                                              'bevqzq9n' /* Arquivo carregado com sucesso */,
                                            ),
                                          );
                                        } else {
                                          setState(() {});
                                          showUploadMessage(
                                            context,
                                            FFLocalizations.of(context).getText(
                                              '2d0ifk5b' /* Falha no envio do arquivo */,
                                            ),
                                          );
                                          return;
                                        }
                                      }

                                      if (_model.uploadedFileUrl != '0') {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Alerta'),
                                              content:
                                                  Text('O arquivo foi enviado'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Aviso'),
                                              content: Text(
                                                  'Um arquivo já foi anexado'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }
                                    },
                                    child: Container(
                                      height: 80.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x1F0DA0D4),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: Color(0x710DA0D4),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'y9wus6qj' /* Anexar Certificado */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 12.0,
                                                ),
                                          ),
                                          Icon(
                                            Icons.attach_file,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 16.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  FlutterFlowPdfViewer(
                                    networkPath: _model.uploadedFileUrl,
                                    height: 165.0,
                                    horizontalScroll: false,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                  ].divide(SizedBox(height: 20.0)),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                    child: FFButtonWidget(
                      onPressed: ((_model.textController1.text == null ||
                                  _model.textController1.text == '') ||
                              (_model.dropDownValue == null ||
                                  _model.dropDownValue == ''))
                          ? null
                          : () async {
                              var _shouldSetState = false;
                              if ((_model.dropdownSelectValue?.first ==
                                      'Coworking') ||
                                  (_model.dropdownSelectValue?.last ==
                                      'Coworking')) {
                                var certificateRecordReference1 =
                                    CertificateRecord.collection.doc();
                                await certificateRecordReference1
                                    .set(createCertificateRecordData(
                                  nameCertificate: _model.textController2.text,
                                  yearConclusion: _model.textController3.text,
                                  attach: _model.uploadedFileUrl,
                                  fkUser: currentUserReference,
                                ));
                                _model.fkCertificateC =
                                    CertificateRecord.getDocumentFromData(
                                        createCertificateRecordData(
                                          nameCertificate:
                                              _model.textController2.text,
                                          yearConclusion:
                                              _model.textController3.text,
                                          attach: _model.uploadedFileUrl,
                                          fkUser: currentUserReference,
                                        ),
                                        certificateRecordReference1);
                                _shouldSetState = true;

                                var practiceRecordReference1 =
                                    PracticeRecord.collection.doc();
                                await practiceRecordReference1.set({
                                  ...createPracticeRecordData(
                                    name: _model.textController1.text,
                                    speciliaty: _model.dropDownValue,
                                    fkUser: currentUserReference,
                                    fkCoworking: FFAppState().refCoworking,
                                    check: _model.checkboxValue,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'type_of_service':
                                          _model.dropdownSelectValue,
                                    },
                                  ),
                                });
                                _model.fkPracticeC =
                                    PracticeRecord.getDocumentFromData({
                                  ...createPracticeRecordData(
                                    name: _model.textController1.text,
                                    speciliaty: _model.dropDownValue,
                                    fkUser: currentUserReference,
                                    fkCoworking: FFAppState().refCoworking,
                                    check: _model.checkboxValue,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'type_of_service':
                                          _model.dropdownSelectValue,
                                    },
                                  ),
                                }, practiceRecordReference1);
                                _shouldSetState = true;
                                _model.singleTheraphistc =
                                    await queryTheraphistRecordOnce(
                                  queryBuilder: (theraphistRecord) =>
                                      theraphistRecord.where(
                                    'fk_user',
                                    isEqualTo: currentUserReference,
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                _shouldSetState = true;

                                await _model.singleTheraphistc!.reference
                                    .update({
                                  ...createTheraphistRecordData(
                                    fkCertificate:
                                        _model.fkCertificateC?.reference,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'fk_practice': FieldValue.arrayUnion(
                                          [_model.fkPracticeC?.reference]),
                                    },
                                  ),
                                });
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
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child:
                                            CoworkigCreateRegiterModalWidget(),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));

                                if (_shouldSetState) setState(() {});
                                return;
                              } else {
                                var certificateRecordReference2 =
                                    CertificateRecord.collection.doc();
                                await certificateRecordReference2
                                    .set(createCertificateRecordData(
                                  nameCertificate: _model.textController2.text,
                                  yearConclusion: _model.textController3.text,
                                  attach: _model.uploadedFileUrl,
                                  fkUser: currentUserReference,
                                ));
                                _model.fkCertificate =
                                    CertificateRecord.getDocumentFromData(
                                        createCertificateRecordData(
                                          nameCertificate:
                                              _model.textController2.text,
                                          yearConclusion:
                                              _model.textController3.text,
                                          attach: _model.uploadedFileUrl,
                                          fkUser: currentUserReference,
                                        ),
                                        certificateRecordReference2);
                                _shouldSetState = true;

                                var practiceRecordReference2 =
                                    PracticeRecord.collection.doc();
                                await practiceRecordReference2.set({
                                  ...createPracticeRecordData(
                                    name: _model.textController1.text,
                                    speciliaty: _model.dropDownValue,
                                    fkUser: currentUserReference,
                                    fkCoworking: FFAppState().refCoworking,
                                    check: _model.checkboxValue,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'type_of_service':
                                          _model.dropdownSelectValue,
                                    },
                                  ),
                                });
                                _model.fkPractice =
                                    PracticeRecord.getDocumentFromData({
                                  ...createPracticeRecordData(
                                    name: _model.textController1.text,
                                    speciliaty: _model.dropDownValue,
                                    fkUser: currentUserReference,
                                    fkCoworking: FFAppState().refCoworking,
                                    check: _model.checkboxValue,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'type_of_service':
                                          _model.dropdownSelectValue,
                                    },
                                  ),
                                }, practiceRecordReference2);
                                _shouldSetState = true;
                                _model.singleTheraphist =
                                    await queryTheraphistRecordOnce(
                                  queryBuilder: (theraphistRecord) =>
                                      theraphistRecord.where(
                                    'fk_user',
                                    isEqualTo: currentUserReference,
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                _shouldSetState = true;

                                await _model.singleTheraphist!.reference
                                    .update({
                                  ...createTheraphistRecordData(
                                    fkCertificate:
                                        _model.fkCertificate?.reference,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'fk_practice': FieldValue.arrayUnion(
                                          [_model.fkPractice?.reference]),
                                    },
                                  ),
                                });

                                context.pushNamed('add_timer_theraphist_page');

                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              if (_shouldSetState) setState(() {});
                            },
                      text: FFLocalizations.of(context).getText(
                        'fborw7wr' /* Continuar */,
                      ),
                      options: FFButtonOptions(
                        width: 352.0,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFFA954B2),
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
                        disabledTextColor: Color(0xE0FFFFFF),
                      ),
                    ),
                  ),
                ],
              ),
            ].divide(SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}
