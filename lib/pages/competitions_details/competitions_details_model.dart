import '/components/footer_mobile/footer_mobile_widget.dart';
import '/components/footer_pc/footer_pc_widget.dart';
import '/components/header_pc/header_pc_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'competitions_details_widget.dart' show CompetitionsDetailsWidget;
import 'package:flutter/material.dart';

class CompetitionsDetailsModel
    extends FlutterFlowModel<CompetitionsDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for header_pc component.
  late HeaderPcModel headerPcModel;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // State field(s) for PageView widget.
  PageController? pageViewController1;

  int get pageViewCurrentIndex1 => pageViewController1 != null &&
          pageViewController1!.hasClients &&
          pageViewController1!.page != null
      ? pageViewController1!.page!.round()
      : 0;
  // State field(s) for PageView widget.
  PageController? pageViewController2;

  int get pageViewCurrentIndex2 => pageViewController2 != null &&
          pageViewController2!.hasClients &&
          pageViewController2!.page != null
      ? pageViewController2!.page!.round()
      : 0;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;
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
    footerPcModel.dispose();
    footerMobileModel.dispose();
  }
}
