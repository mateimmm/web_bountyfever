import '/components/footer_mobile/footer_mobile_widget.dart';
import '/components/footer_pc/footer_pc_widget.dart';
import '/components/header_pc/header_pc_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'competitions_widget.dart' show CompetitionsWidget;
import 'package:flutter/material.dart';

class CompetitionsModel extends FlutterFlowModel<CompetitionsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for header_pc component.
  late HeaderPcModel headerPcModel;
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
    headerPcModel.dispose();
    footerPcModel.dispose();
    footerMobileModel.dispose();
  }
}