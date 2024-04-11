import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/congrats/congrats_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'paymentintent_model.dart';
export 'paymentintent_model.dart';

class PaymentintentWidget extends StatefulWidget {
  const PaymentintentWidget({
    super.key,
    required this.competitionId,
    required this.paymentid,
    required this.paymentstatus,
    required this.qunatity,
    required this.stats,
  });

  final int? competitionId;
  final String? paymentid;
  final String? paymentstatus;
  final int? qunatity;
  final String? stats;

  @override
  State<PaymentintentWidget> createState() => _PaymentintentWidgetState();
}

class _PaymentintentWidgetState extends State<PaymentintentWidget> {
  late PaymentintentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentintentModel());

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
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 600.0,
        height: 600.0,
        constraints: const BoxConstraints(
          minWidth: 300.0,
          minHeight: 300.0,
          maxWidth: 800.0,
          maxHeight: 750.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 3.0,
              color: Color(0x8ABFAEAE),
              offset: Offset(
                0.0,
                1.0,
              ),
            )
          ],
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(50.0),
            topLeft: Radius.circular(50.0),
            topRight: Radius.circular(0.0),
          ),
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'afdv5sti' /* Checking Payment Status */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Roboto Slab',
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          50.0, 10.0, 50.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'vgd87ipj' /* Great news! A new window has o... */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Roboto Slab',
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Lottie.asset(
                                    'assets/lottie_animations/Aniki_Hamster.json',
                                    width: 120.0,
                                    height: 100.0,
                                    fit: BoxFit.cover,
                                    animate: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 30.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'PAYMENTINTENT_CANCEL_PAYMENT_BTN_ON_TAP');
                                    logFirebaseEvent('Button_bottom_sheet');
                                    Navigator.pop(context);
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '30tybhda' /* Cancel Payment */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 200.0,
                                    height: 45.0,
                                    padding: const EdgeInsets.all(0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).accent2,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Roboto Slab',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          letterSpacing: 0.0,
                                        ),
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(20.0),
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('PAYMENTINTENT_Container_6vp0xkeo_ON_TAP');
                  var shouldSetState = false;
                  logFirebaseEvent('Container_backend_call');
                  _model.apiResultspo = await GetStripepaymentstatusCall.call(
                    id: widget.paymentid,
                    skey: FFAppState().skey,
                  );
                  shouldSetState = true;
                  if (getJsonField(
                        (_model.apiResultspo?.jsonBody ?? ''),
                        r'''$.status''',
                      ) ==
                      getJsonField(
                        FFAppState().statusintern,
                        r'''$.status''',
                      )) {
                    logFirebaseEvent('Container_update_app_state');
                    setState(() {
                      FFAppState().localuserid = currentUserUid;
                      FFAppState().localticketsnumber =
                          widget.qunatity!.toString();
                      FFAppState().localusername = getJsonField(
                        (_model.apiResultspo?.jsonBody ?? ''),
                        r'''$.customer_details.name''',
                      ).toString();
                      FFAppState().localcompetionid = widget.competitionId!;
                    });
                  } else {
                    logFirebaseEvent('Container_alert_dialog');
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: const Text('Not yet there!'),
                          content: const Text(
                              'Please check the payment page and try agin!'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: const Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );
                    if (shouldSetState) setState(() {});
                    return;
                  }

                  logFirebaseEvent('Container_bottom_sheet');
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor:
                        FlutterFlowTheme.of(context).primaryBackground,
                    barrierColor: FlutterFlowTheme.of(context).tertiary,
                    isDismissible: false,
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: CongratsWidget(
                          paymentid: getJsonField(
                            (_model.apiResultspo?.jsonBody ?? ''),
                            r'''$.id''',
                          ).toString(),
                          competitionid: widget.competitionId!,
                          paymentstatus: getJsonField(
                            (_model.apiResultspo?.jsonBody ?? ''),
                            r'''$.payment_status''',
                          ).toString(),
                          status: getJsonField(
                            (_model.apiResultspo?.jsonBody ?? ''),
                            r'''$.status''',
                          ).toString(),
                          quantity: widget.qunatity!,
                          paymentemail: getJsonField(
                            (_model.apiResultspo?.jsonBody ?? ''),
                            r'''$.customer_details.email''',
                          ).toString(),
                          paymentadress: getJsonField(
                            (_model.apiResultspo?.jsonBody ?? ''),
                            r'''$.customer_details.adress''',
                          ).toString(),
                          paymentcountry: getJsonField(
                            (_model.apiResultspo?.jsonBody ?? ''),
                            r'''$.customer_details.adress.country''',
                          ).toString(),
                          paymentintent: getJsonField(
                            (_model.apiResultspo?.jsonBody ?? ''),
                            r'''$.payment_intent''',
                          ).toString(),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));

                  logFirebaseEvent('Container_bottom_sheet');
                  Navigator.pop(context);
                  if (shouldSetState) setState(() {});
                },
                child: Container(
                  width: double.infinity,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(50.0),
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(0.0),
                    ),
                  ),
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'ixipt8wo' /* Confirm Payment */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: 'Roboto Slab',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
