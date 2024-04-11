import '/backend/supabase/supabase.dart';
import '/components/component/component_widget.dart';
import '/components/containermobile/containermobile_widget.dart';
import '/components/footer_mobile/footer_mobile_widget.dart';
import '/components/footer_pc/footer_pc_widget.dart';
import '/components/header_pc/header_pc_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'competitions_model.dart';
export 'competitions_model.dart';

class CompetitionsWidget extends StatefulWidget {
  const CompetitionsWidget({super.key});

  @override
  State<CompetitionsWidget> createState() => _CompetitionsWidgetState();
}

class _CompetitionsWidgetState extends State<CompetitionsWidget> {
  late CompetitionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompetitionsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Competitions'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CompetitionsRow>>(
      future: CompetitionsTable().queryRows(
        queryFn: (q) => q.order('competition_end'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<CompetitionsRow> competitionsCompetitionsRowList = snapshot.data!;
        return Title(
            title: 'Competitions',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: SafeArea(
                top: true,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      wrapWithModel(
                        model: _model.headerPcModel,
                        updateCallback: () => setState(() {}),
                        child: const HeaderPcWidget(),
                      ),
                      Divider(
                        thickness: 1.0,
                        indent: 50.0,
                        endIndent: 50.0,
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          30.0, 0.0, 30.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 30.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'hhtjxm38' /* Competitions in progress */,
                                              ),
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleLarge
                                                  .override(
                                                    fontFamily: 'Roboto Slab',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 18.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w900,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 10.0, 0.0, 0.0),
                                              child: AutoSizeText(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'n1z3rooj' /* Choose a competition, grab you... */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelLarge
                                                    .override(
                                                      fontFamily: 'Roboto Slab',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                                minFontSize: 9.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 15.0),
                                child: Builder(
                                  builder: (context) {
                                    final wrapPC =
                                        competitionsCompetitionsRowList
                                            .map((e) => e)
                                            .toList();
                                    return Wrap(
                                      spacing: 10.0,
                                      runSpacing: 10.0,
                                      alignment: WrapAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.spaceEvenly,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: List.generate(wrapPC.length,
                                          (wrapPCIndex) {
                                        final wrapPCItem = wrapPC[wrapPCIndex];
                                        return Stack(
                                          children: [
                                            if (responsiveVisibility(
                                              context: context,
                                              phone: false,
                                              tablet: false,
                                            ))
                                              Container(
                                                width: 317.0,
                                                height: 289.0,
                                                decoration: const BoxDecoration(),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'COMPETITIONS_Container_3vz9o7on_ON_TAP');
                                                    logFirebaseEvent(
                                                        'component_navigate_to');

                                                    context.pushNamed(
                                                      'CompetitionsDetails',
                                                      queryParameters: {
                                                        'competitionid':
                                                            serializeParam(
                                                          wrapPCItem.id,
                                                          ParamType.int,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: ComponentWidget(
                                                    key: Key(
                                                        'Key3vz_${wrapPCIndex}_of_${wrapPC.length}'),
                                                    title: wrapPCItem
                                                        .competionName,
                                                    titledescription: wrapPCItem
                                                        .competitionShortname,
                                                    price: formatNumber(
                                                      wrapPCItem
                                                          .competitionPrice,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType:
                                                          DecimalType.automatic,
                                                      currency: '£',
                                                    ),
                                                    competitionid:
                                                        wrapPCItem.id,
                                                    imagepath: wrapPCItem
                                                        .competitionPictures,
                                                    endTime: wrapPCItem
                                                        .competitionEnd!,
                                                  ),
                                                ),
                                              ),
                                            if (responsiveVisibility(
                                              context: context,
                                              tabletLandscape: false,
                                              desktop: false,
                                            ))
                                              Container(
                                                width: 180.0,
                                                height: 240.0,
                                                decoration: const BoxDecoration(),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'COMPETITIONS_Container_waapgnqp_ON_TAP');
                                                    logFirebaseEvent(
                                                        'containermobile_navigate_to');

                                                    context.pushNamed(
                                                      'CompetitionsDetails',
                                                      queryParameters: {
                                                        'competitionid':
                                                            serializeParam(
                                                          wrapPCItem.id,
                                                          ParamType.int,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: ContainermobileWidget(
                                                    key: Key(
                                                        'Keywaa_${wrapPCIndex}_of_${wrapPC.length}'),
                                                    title: wrapPCItem
                                                        .competionName,
                                                    titledescription: wrapPCItem
                                                        .competitionShortname,
                                                    price: formatNumber(
                                                      wrapPCItem
                                                          .competitionPrice,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType:
                                                          DecimalType.automatic,
                                                      currency: '£',
                                                    ),
                                                    competitionid:
                                                        wrapPCItem.id,
                                                    imagepath: wrapPCItem
                                                        .competitionPictures,
                                                    endTime: wrapPCItem
                                                        .competitionEnd!,
                                                  ),
                                                ),
                                              ),
                                          ],
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                      ))
                        Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: wrapWithModel(
                            model: _model.footerPcModel,
                            updateCallback: () => setState(() {}),
                            child: const FooterPcWidget(),
                          ),
                        ),
                      if (responsiveVisibility(
                        context: context,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        wrapWithModel(
                          model: _model.footerMobileModel,
                          updateCallback: () => setState(() {}),
                          child: const FooterMobileWidget(),
                        ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
