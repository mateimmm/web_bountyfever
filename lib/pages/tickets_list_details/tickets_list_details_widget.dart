import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/footer_mobile/footer_mobile_widget.dart';
import '/components/footer_pc/footer_pc_widget.dart';
import '/components/header_pc/header_pc_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'tickets_list_details_model.dart';
export 'tickets_list_details_model.dart';

class TicketsListDetailsWidget extends StatefulWidget {
  const TicketsListDetailsWidget({
    super.key,
    required this.competitionId,
    required this.competitionname,
  });

  final int? competitionId;
  final String? competitionname;

  @override
  State<TicketsListDetailsWidget> createState() =>
      _TicketsListDetailsWidgetState();
}

class _TicketsListDetailsWidgetState extends State<TicketsListDetailsWidget> {
  late TicketsListDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TicketsListDetailsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'TicketsListDetails'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('TICKETS_LIST_DETAILS_TicketsListDetails_');
      logFirebaseEvent('TicketsListDetails_backend_call');
      _model.competitionsquery = await CompetitionsTable().queryRows(
        queryFn: (q) => q
            .eq(
              'id',
              widget.competitionId,
            )
            .order('id', ascending: true),
      );
    });

    _model.searchticketInputController ??= TextEditingController();
    _model.searchticketInputFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FilteredTicketsRow>>(
      future: FilteredTicketsTable().queryRows(
        queryFn: (q) => q
            .eq(
              'competition_id',
              widget.competitionId,
            )
            .eq(
              'search_user_id',
              currentUserUid,
            )
            .order('ticket_id', ascending: true),
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
        List<FilteredTicketsRow> ticketsListDetailsFilteredTicketsRowList =
            snapshot.data!;
        return Title(
            title: 'TicketsListDetails',
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
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 20.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          30.0, 0.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'TICKETS_LIST_DETAILS_Icon_yht95lw6_ON_TA');
                                          logFirebaseEvent('Icon_navigate_to');

                                          context.goNamed(
                                            'TicketsList',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  const TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .leftToRight,
                                                duration:
                                                    Duration(milliseconds: 600),
                                              ),
                                            },
                                          );
                                        },
                                        child: Icon(
                                          Icons.arrow_back_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 40.0,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                widget.competitionname,
                                                'Competition',
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
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'rv5s39wg' /* Tickets List */,
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
                                                  ),
                                            ),
                                            Text(
                                              ticketsListDetailsFilteredTicketsRowList
                                                  .length
                                                  .toString(),
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
                                                  ),
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ldt3773q' /* *Click on Search if results ar... */,
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
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
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
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 25.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 5.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: SizedBox(
                                            width: 250.0,
                                            child: TextFormField(
                                              controller: _model
                                                  .searchticketInputController,
                                              focusNode: _model
                                                  .searchticketInputFocusNode,
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'nblukhr0' /* Search name/ ticket number */,
                                                ),
                                                labelStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Roboto Slab',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                    ),
                                                hintStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Roboto Slab',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                    ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Roboto Slab',
                                                        letterSpacing: 0.0,
                                                      ),
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              validator: _model
                                                  .searchticketInputControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(1.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'TICKETS_LIST_DETAILS_ButtonSearch_ON_TAP');
                                              logFirebaseEvent(
                                                  'ButtonSearch_backend_call');
                                              await SearchTable().insert({
                                                'searchvalue': _model
                                                    .searchticketInputController
                                                    .text,
                                                'user_id': currentUserUid,
                                                'competitionid':
                                                    widget.competitionId,
                                              });
                                              logFirebaseEvent(
                                                  'ButtonSearch_update_app_state');
                                              setState(() {
                                                FFAppState().showresult = true;
                                              });
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'hbvixcz9' /* Search */,
                                            ),
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Roboto Slab',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    letterSpacing: 0.0,
                                                  ),
                                              elevation: 3.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(20.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(20.0),
                                              ),
                                              hoverColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              hoverBorderSide: const BorderSide(
                                                color: Color(0x004B39EF),
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 1.0,
                                indent: 50.0,
                                endIndent: 50.0,
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                            ],
                          ),
                        ),
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                        ))
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 20.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 800.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final ticketsfortable =
                                        ticketsListDetailsFilteredTicketsRowList
                                            .where((e) =>
                                                e.competitionId ==
                                                widget.competitionId)
                                            .toList();
                                    return FlutterFlowDataTable<
                                        FilteredTicketsRow>(
                                      controller: _model.dataTablpcController1,
                                      data: ticketsfortable,
                                      numRows: ticketsfortable.length,
                                      columnsBuilder: (onSortChanged) => [
                                        DataColumn2(
                                          label: DefaultTextStyle.merge(
                                            softWrap: true,
                                            child: AutoSizeText(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'zmclyaob' /* Order Number */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelLarge
                                                  .override(
                                                    fontFamily: 'Roboto Slab',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    letterSpacing: 0.0,
                                                  ),
                                              minFontSize: 12.0,
                                            ),
                                          ),
                                        ),
                                        DataColumn2(
                                          label: DefaultTextStyle.merge(
                                            softWrap: true,
                                            child: AutoSizeText(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'igpyurwm' /* Name */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelLarge
                                                  .override(
                                                    fontFamily: 'Roboto Slab',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    letterSpacing: 0.0,
                                                  ),
                                              minFontSize: 12.0,
                                            ),
                                          ),
                                        ),
                                        DataColumn2(
                                          label: DefaultTextStyle.merge(
                                            softWrap: true,
                                            child: AutoSizeText(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '366xka4y' /* Ticket Number */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelLarge
                                                  .override(
                                                    fontFamily: 'Roboto Slab',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    letterSpacing: 0.0,
                                                  ),
                                              minFontSize: 12.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                      dataRowBuilder: (ticketsfortableItem,
                                              ticketsfortableIndex,
                                              selected,
                                              onSelectChanged) =>
                                          DataRow(
                                        color: MaterialStateProperty.all(
                                          ticketsfortableIndex % 2 == 0
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryBackground
                                              : FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                        ),
                                        cells: [
                                          AutoSizeText(
                                            ticketsfortableItem.orderid!
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Roboto Slab',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                ),
                                            minFontSize: 11.0,
                                          ),
                                          AutoSizeText(
                                            valueOrDefault<String>(
                                              ticketsfortableItem.username,
                                              'Name',
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Roboto Slab',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                ),
                                            minFontSize: 11.0,
                                          ),
                                          AutoSizeText(
                                            valueOrDefault<String>(
                                              ticketsfortableItem
                                                  .ticketsRandomNumeric
                                                  ?.toString(),
                                              'Ticket',
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Roboto Slab',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                ),
                                            minFontSize: 11.0,
                                          ),
                                        ].map((c) => DataCell(c)).toList(),
                                      ),
                                      paginated: true,
                                      selectable: false,
                                      hidePaginator: false,
                                      showFirstLastButtons: true,
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      minWidth: 300.0,
                                      headingRowHeight: 50.0,
                                      dataRowHeight: 35.0,
                                      headingRowColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      borderRadius: BorderRadius.circular(24.0),
                                      addHorizontalDivider: true,
                                      addTopAndBottomDivider: true,
                                      hideDefaultHorizontalDivider: false,
                                      horizontalDividerColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      horizontalDividerThickness: 1.0,
                                      addVerticalDivider: false,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        if (responsiveVisibility(
                          context: context,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 20.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 800.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final ticketsfortable =
                                        ticketsListDetailsFilteredTicketsRowList
                                            .where((e) =>
                                                e.competitionId ==
                                                widget.competitionId)
                                            .toList();
                                    return FlutterFlowDataTable<
                                        FilteredTicketsRow>(
                                      controller: _model.dataTablpcController2,
                                      data: ticketsfortable,
                                      numRows: ticketsfortable.length,
                                      columnsBuilder: (onSortChanged) => [
                                        DataColumn2(
                                          label: DefaultTextStyle.merge(
                                            softWrap: true,
                                            child: AutoSizeText(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'utl9mmt2' /* Name */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelLarge
                                                  .override(
                                                    fontFamily: 'Roboto Slab',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    letterSpacing: 0.0,
                                                  ),
                                              minFontSize: 12.0,
                                            ),
                                          ),
                                        ),
                                        DataColumn2(
                                          label: DefaultTextStyle.merge(
                                            softWrap: true,
                                            child: AutoSizeText(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '4us173vk' /* Ticket
Number */
                                                ,
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelLarge
                                                  .override(
                                                    fontFamily: 'Roboto Slab',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    letterSpacing: 0.0,
                                                  ),
                                              minFontSize: 12.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                      dataRowBuilder: (ticketsfortableItem,
                                              ticketsfortableIndex,
                                              selected,
                                              onSelectChanged) =>
                                          DataRow(
                                        color: MaterialStateProperty.all(
                                          ticketsfortableIndex % 2 == 0
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryBackground
                                              : FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                        ),
                                        cells: [
                                          AutoSizeText(
                                            valueOrDefault<String>(
                                              ticketsfortableItem.username,
                                              'Name',
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Roboto Slab',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                ),
                                            minFontSize: 11.0,
                                          ),
                                          AutoSizeText(
                                            ticketsfortableItem
                                                .ticketsRandomNumeric!
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Roboto Slab',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                ),
                                            minFontSize: 11.0,
                                          ),
                                        ].map((c) => DataCell(c)).toList(),
                                      ),
                                      paginated: true,
                                      selectable: false,
                                      hidePaginator: false,
                                      showFirstLastButtons: true,
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      minWidth: 300.0,
                                      headingRowHeight: 50.0,
                                      dataRowHeight: 35.0,
                                      headingRowColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      borderRadius: BorderRadius.circular(24.0),
                                      addHorizontalDivider: true,
                                      addTopAndBottomDivider: true,
                                      hideDefaultHorizontalDivider: true,
                                      horizontalDividerColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      horizontalDividerThickness: 1.0,
                                      addVerticalDivider: false,
                                    );
                                  },
                                ),
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
