import '/auth/base_auth_user_provider.dart';
import '/backend/supabase/supabase.dart';
import '/components/component/component_widget.dart';
import '/components/containermobile/containermobile_widget.dart';
import '/components/emptywinner/emptywinner_widget.dart';
import '/components/endcompmobile/endcompmobile_widget.dart';
import '/components/endedcomp_p_c/endedcomp_p_c_widget.dart';
import '/components/footer_mobile/footer_mobile_widget.dart';
import '/components/footer_pc/footer_pc_widget.dart';
import '/components/header_pc/header_pc_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'tickets_list_model.dart';
export 'tickets_list_model.dart';

class TicketsListWidget extends StatefulWidget {
  const TicketsListWidget({super.key});

  @override
  State<TicketsListWidget> createState() => _TicketsListWidgetState();
}

class _TicketsListWidgetState extends State<TicketsListWidget> {
  late TicketsListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TicketsListModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'TicketsList'});
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
        queryFn: (q) => q.order('created_at'),
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
        List<CompetitionsRow> ticketsListCompetitionsRowList = snapshot.data!;
        return Title(
            title: 'TicketsList',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                body: SafeArea(
                  top: true,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
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
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            50.0, 0.0, 50.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 30.0, 0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'gia0nfln' /* Tickets List */,
                                                ),
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleLarge
                                                    .override(
                                                      fontFamily: 'Roboto Slab',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 20.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 30.0, 0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'ja9xicbn' /* Active competitions */,
                                                ),
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleLarge
                                                    .override(
                                                      fontFamily: 'Roboto Slab',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 18.0,
                                                      letterSpacing: 0.0,
                                                      decoration: TextDecoration
                                                          .underline,
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 25.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: Builder(
                                    builder: (context) {
                                      final activecompetitions =
                                          ticketsListCompetitionsRowList
                                              .where((e) =>
                                                  e.competitionEnded == false)
                                              .toList();
                                      return Wrap(
                                        spacing: 10.0,
                                        runSpacing: 10.0,
                                        alignment: WrapAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.spaceEvenly,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: List.generate(
                                            activecompetitions.length,
                                            (activecompetitionsIndex) {
                                          final activecompetitionsItem =
                                              activecompetitions[
                                                  activecompetitionsIndex];
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
                                                  child: Visibility(
                                                    visible:
                                                        responsiveVisibility(
                                                      context: context,
                                                      phone: false,
                                                      tablet: false,
                                                    ),
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
                                                            'TICKETS_LIST_Container_9mddjb4n_ON_TAP');
                                                        if (loggedIn == false) {
                                                          logFirebaseEvent(
                                                              'component_navigate_to');

                                                          context.pushNamed(
                                                              'Login');
                                                        } else {
                                                          logFirebaseEvent(
                                                              'component_navigate_to');

                                                          context.pushNamed(
                                                            'TicketsListDetails',
                                                            queryParameters: {
                                                              'competitionId':
                                                                  serializeParam(
                                                                activecompetitionsItem
                                                                    .id,
                                                                ParamType.int,
                                                              ),
                                                              'competitionname':
                                                                  serializeParam(
                                                                valueOrDefault<
                                                                    String>(
                                                                  activecompetitionsItem
                                                                      .competionName,
                                                                  'Title',
                                                                ),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        }
                                                      },
                                                      child: ComponentWidget(
                                                        key: Key(
                                                            'Key9md_${activecompetitionsIndex}_of_${activecompetitions.length}'),
                                                        title: valueOrDefault<
                                                            String>(
                                                          activecompetitionsItem
                                                              .competionName,
                                                          'Name',
                                                        ),
                                                        titledescription:
                                                            valueOrDefault<
                                                                String>(
                                                          activecompetitionsItem
                                                              .competitionShortname,
                                                          'title',
                                                        ),
                                                        price: formatNumber(
                                                          activecompetitionsItem
                                                              .competitionPrice,
                                                          formatType: FormatType
                                                              .decimal,
                                                          decimalType:
                                                              DecimalType
                                                                  .automatic,
                                                          currency: '£',
                                                        ),
                                                        competitionid:
                                                            activecompetitionsItem
                                                                .id,
                                                        imagepath:
                                                            activecompetitionsItem
                                                                .competitionPictures,
                                                        endTime:
                                                            activecompetitionsItem
                                                                .competitionEnd!,
                                                      ),
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
                                                  child: Visibility(
                                                    visible:
                                                        responsiveVisibility(
                                                      context: context,
                                                      tabletLandscape: false,
                                                      desktop: false,
                                                    ),
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
                                                            'TICKETS_LIST_Container_2pidqfmk_ON_TAP');
                                                        if (loggedIn == false) {
                                                          logFirebaseEvent(
                                                              'containermobile_navigate_to');

                                                          context.pushNamed(
                                                              'Login');
                                                        } else {
                                                          logFirebaseEvent(
                                                              'containermobile_navigate_to');

                                                          context.pushNamed(
                                                            'TicketsListDetails',
                                                            queryParameters: {
                                                              'competitionId':
                                                                  serializeParam(
                                                                activecompetitionsItem
                                                                    .id,
                                                                ParamType.int,
                                                              ),
                                                              'competitionname':
                                                                  serializeParam(
                                                                valueOrDefault<
                                                                    String>(
                                                                  activecompetitionsItem
                                                                      .competionName,
                                                                  'Title',
                                                                ),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        }
                                                      },
                                                      child:
                                                          ContainermobileWidget(
                                                        key: Key(
                                                            'Key2pi_${activecompetitionsIndex}_of_${activecompetitions.length}'),
                                                        title:
                                                            activecompetitionsItem
                                                                .competionName,
                                                        titledescription:
                                                            activecompetitionsItem
                                                                .competitionShortname,
                                                        price: formatNumber(
                                                          activecompetitionsItem
                                                              .competitionPrice,
                                                          formatType: FormatType
                                                              .decimal,
                                                          decimalType:
                                                              DecimalType
                                                                  .automatic,
                                                          currency: '£',
                                                        ),
                                                        competitionid:
                                                            activecompetitionsItem
                                                                .id,
                                                        imagepath:
                                                            activecompetitionsItem
                                                                .competitionPictures,
                                                        endTime:
                                                            activecompetitionsItem
                                                                .competitionEnd!,
                                                      ),
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
                              Divider(
                                thickness: 1.0,
                                indent: 80.0,
                                endIndent: 80.0,
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        50.0, 30.0, 0.0, 30.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'c2htmo8e' /* Ended competitions */,
                                      ),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Roboto Slab',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontStyle: FontStyle.italic,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: Builder(
                                    builder: (context) {
                                      final endcompetitions =
                                          ticketsListCompetitionsRowList
                                              .where((e) =>
                                                  e.competitionEnded == true)
                                              .toList();
                                      if (endcompetitions.isEmpty) {
                                        return const EmptywinnerWidget();
                                      }
                                      return Wrap(
                                        spacing: 30.0,
                                        runSpacing: 20.0,
                                        alignment: WrapAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.spaceEvenly,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: List.generate(
                                            endcompetitions.length,
                                            (endcompetitionsIndex) {
                                          final endcompetitionsItem =
                                              endcompetitions[
                                                  endcompetitionsIndex];
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
                                                          'TICKETS_LIST_Container_0o95ulyu_ON_TAP');
                                                      if (loggedIn == false) {
                                                        logFirebaseEvent(
                                                            'endedcompPC_navigate_to');

                                                        context
                                                            .pushNamed('Login');
                                                      } else {
                                                        logFirebaseEvent(
                                                            'endedcompPC_navigate_to');

                                                        context.pushNamed(
                                                          'TicketsListDetails',
                                                          queryParameters: {
                                                            'competitionId':
                                                                serializeParam(
                                                              endcompetitionsItem
                                                                  .id,
                                                              ParamType.int,
                                                            ),
                                                            'competitionname':
                                                                serializeParam(
                                                              endcompetitionsItem
                                                                  .competionName,
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      }
                                                    },
                                                    child: EndedcompPCWidget(
                                                      key: Key(
                                                          'Key0o9_${endcompetitionsIndex}_of_${endcompetitions.length}'),
                                                      title: valueOrDefault<
                                                          String>(
                                                        endcompetitionsItem
                                                            .competionName,
                                                        'title',
                                                      ),
                                                      titledescription:
                                                          valueOrDefault<
                                                              String>(
                                                        endcompetitionsItem
                                                            .competitionShortname,
                                                        'title',
                                                      ),
                                                      price: formatNumber(
                                                        endcompetitionsItem
                                                            .competitionPrice,
                                                        formatType:
                                                            FormatType.decimal,
                                                        decimalType: DecimalType
                                                            .automatic,
                                                        currency: '£',
                                                      ),
                                                      competitionid:
                                                          endcompetitionsItem
                                                              .id,
                                                      imagepath:
                                                          endcompetitionsItem
                                                              .competitionPictures,
                                                      endTime:
                                                          endcompetitionsItem
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
                                                          'TICKETS_LIST_Container_02im5trh_ON_TAP');
                                                      if (loggedIn == false) {
                                                        logFirebaseEvent(
                                                            'endcompmobile_navigate_to');

                                                        context
                                                            .pushNamed('Login');
                                                      } else {
                                                        logFirebaseEvent(
                                                            'endcompmobile_navigate_to');

                                                        context.pushNamed(
                                                          'TicketsListDetails',
                                                          queryParameters: {
                                                            'competitionId':
                                                                serializeParam(
                                                              endcompetitionsItem
                                                                  .id,
                                                              ParamType.int,
                                                            ),
                                                            'competitionname':
                                                                serializeParam(
                                                              endcompetitionsItem
                                                                  .competionName,
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      }
                                                    },
                                                    child: EndcompmobileWidget(
                                                      key: Key(
                                                          'Key02i_${endcompetitionsIndex}_of_${endcompetitions.length}'),
                                                      title: valueOrDefault<
                                                          String>(
                                                        endcompetitionsItem
                                                            .competionName,
                                                        'title',
                                                      ),
                                                      winner: valueOrDefault<
                                                          String>(
                                                        endcompetitionsItem
                                                            .competitionWinner,
                                                        'Winner',
                                                      ),
                                                      competitionid:
                                                          endcompetitionsItem
                                                              .id,
                                                      imagepath:
                                                          endcompetitionsItem
                                                              .competitionPictures,
                                                      endTime:
                                                          endcompetitionsItem
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
                          wrapWithModel(
                            model: _model.footerPcModel,
                            updateCallback: () => setState(() {}),
                            child: const FooterPcWidget(),
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
              ),
            ));
      },
    );
  }
}
