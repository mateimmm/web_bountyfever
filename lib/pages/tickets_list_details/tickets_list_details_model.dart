import '/backend/supabase/supabase.dart';
import '/components/footer_mobile/footer_mobile_widget.dart';
import '/components/footer_pc/footer_pc_widget.dart';
import '/components/header_pc/header_pc_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tickets_list_details_widget.dart' show TicketsListDetailsWidget;
import 'package:flutter/material.dart';

class TicketsListDetailsModel
    extends FlutterFlowModel<TicketsListDetailsWidget> {
  ///  Local state fields for this page.

  List<CompetitionsRow> competitionslist = [];
  void addToCompetitionslist(CompetitionsRow item) =>
      competitionslist.add(item);
  void removeFromCompetitionslist(CompetitionsRow item) =>
      competitionslist.remove(item);
  void removeAtIndexFromCompetitionslist(int index) =>
      competitionslist.removeAt(index);
  void insertAtIndexInCompetitionslist(int index, CompetitionsRow item) =>
      competitionslist.insert(index, item);
  void updateCompetitionslistAtIndex(
          int index, Function(CompetitionsRow) updateFn) =>
      competitionslist[index] = updateFn(competitionslist[index]);

  List<TicketsRow> pagesearch = [];
  void addToPagesearch(TicketsRow item) => pagesearch.add(item);
  void removeFromPagesearch(TicketsRow item) => pagesearch.remove(item);
  void removeAtIndexFromPagesearch(int index) => pagesearch.removeAt(index);
  void insertAtIndexInPagesearch(int index, TicketsRow item) =>
      pagesearch.insert(index, item);
  void updatePagesearchAtIndex(int index, Function(TicketsRow) updateFn) =>
      pagesearch[index] = updateFn(pagesearch[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in TicketsListDetails widget.
  List<CompetitionsRow>? competitionsquery;
  // Model for header_pc component.
  late HeaderPcModel headerPcModel;
  // State field(s) for searchticket_input widget.
  FocusNode? searchticketInputFocusNode;
  TextEditingController? searchticketInputController;
  String? Function(BuildContext, String?)? searchticketInputControllerValidator;
  // State field(s) for DataTablpc widget.
  final dataTablpcController1 =
      FlutterFlowDataTableController<FilteredTicketsRow>();
  // State field(s) for DataTablpc widget.
  final dataTablpcController2 =
      FlutterFlowDataTableController<FilteredTicketsRow>();
  // Model for footer_pc component.
  late FooterPcModel footerPcModel;
  // Model for footer_mobile component.
  late FooterMobileModel footerMobileModel;

  @override
  void initState(BuildContext context) {
    headerPcModel = createModel(context, () => HeaderPcModel());
    footerPcModel = createModel(context, () => FooterPcModel());
    footerMobileModel = createModel(context, () => FooterMobileModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headerPcModel.dispose();
    searchticketInputFocusNode?.dispose();
    searchticketInputController?.dispose();

    footerPcModel.dispose();
    footerMobileModel.dispose();
  }
}
