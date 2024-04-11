import '/auth/base_auth_user_provider.dart';
import '/backend/supabase/supabase.dart';
import '/components/emptywinner/emptywinner_widget.dart';
import '/components/footer_mobile/footer_mobile_widget.dart';
import '/components/footer_pc/footer_pc_widget.dart';
import '/components/header_pc/header_pc_widget.dart';
import '/components/winnermobile/winnermobile_widget.dart';
import '/components/winnerpc/winnerpc_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'winners_model.dart';
export 'winners_model.dart';

class WinnersWidget extends StatefulWidget {
  const WinnersWidget({super.key});

  @override
  State<WinnersWidget> createState() => _WinnersWidgetState();
}

class _WinnersWidgetState extends State<WinnersWidget> {
  late WinnersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WinnersModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Winners'});
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
        queryFn: (q) => q
            .eq(
              'competition_ended',
              true,
            )
            .order('competition_end', ascending: true),
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
        List<CompetitionsRow> winnersCompetitionsRowList = snapshot.data!;
        return Title(
            title: 'Winners',
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
                          color: FlutterFlowTheme.of(context).secondary,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
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
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 30.0, 0.0, 30.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'aasmkdpr' /* Winners */,
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
                                                      fontWeight:
                                                          FontWeight.w900,
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
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 15.0),
                            child: Builder(
                              builder: (context) {
                                final endcompetitions =
                                    winnersCompetitionsRowList
                                        .where(
                                            (e) => e.competitionEnded == true)
                                        .toList();
                                if (endcompetitions.isEmpty) {
                                  return const Center(
                                    child: EmptywinnerWidget(),
                                  );
                                }
                                return Wrap(
                                  spacing: 10.0,
                                  runSpacing: 10.0,
                                  alignment: WrapAlignment.spaceEvenly,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.spaceEvenly,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children:
                                      List.generate(endcompetitions.length,
                                          (endcompetitionsIndex) {
                                    final endcompetitionsItem =
                                        endcompetitions[endcompetitionsIndex];
                                    return Stack(
                                      children: [
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                          tablet: false,
                                        ))
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'WINNERS_PAGE_Container_bjlto0sx_ON_TAP');
                                              if (loggedIn == false) {
                                                logFirebaseEvent(
                                                    'Container_navigate_to');

                                                context.pushNamed('Login');
                                              } else {
                                                logFirebaseEvent(
                                                    'Container_navigate_to');

                                                context.pushNamed(
                                                  'TicketsListDetails',
                                                  queryParameters: {
                                                    'competitionId':
                                                        serializeParam(
                                                      endcompetitionsItem.id,
                                                      ParamType.int,
                                                    ),
                                                    'competitionname':
                                                        serializeParam(
                                                      valueOrDefault<String>(
                                                        endcompetitionsItem
                                                            .competionName,
                                                        'title',
                                                      ),
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              }
                                            },
                                            child: Container(
                                              width: 317.0,
                                              height: 289.0,
                                              decoration: const BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  WinnerpcWidget(
                                                    key: Key(
                                                        'Keyl3z_${endcompetitionsIndex}_of_${endcompetitions.length}'),
                                                    title:
                                                        valueOrDefault<String>(
                                                      endcompetitionsItem
                                                          .competionName,
                                                      'Name',
                                                    ),
                                                    titledescription:
                                                        endcompetitionsItem
                                                            .competitionShortname,
                                                    winnername:
                                                        valueOrDefault<String>(
                                                      endcompetitionsItem
                                                          .competitionWinner,
                                                      'Name',
                                                    ),
                                                    competitionid:
                                                        endcompetitionsItem.id,
                                                    imagepath:
                                                        endcompetitionsItem
                                                            .competitionPictures,
                                                    endTime: endcompetitionsItem
                                                        .competitionEnd!,
                                                  ),
                                                ],
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
                                            child: WinnermobileWidget(
                                              key: Key(
                                                  'Keyy27_${endcompetitionsIndex}_of_${endcompetitions.length}'),
                                              title: valueOrDefault<String>(
                                                endcompetitionsItem
                                                    .competionName,
                                                'Name',
                                              ),
                                              winner: endcompetitionsItem
                                                  .competitionWinner,
                                              competitionid:
                                                  endcompetitionsItem.id,
                                              imagepath: endcompetitionsItem
                                                  .competitionPictures,
                                              endTime: endcompetitionsItem
                                                  .competitionEnd!,
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
