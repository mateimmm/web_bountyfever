import '/components/celebrate/celebrate_widget.dart';
import '/components/footer_mobile/footer_mobile_widget.dart';
import '/components/footer_pc/footer_pc_widget.dart';
import '/components/freeshipping/freeshipping_widget.dart';
import '/components/guaranteed/guaranteed_widget.dart';
import '/components/header_pc/header_pc_widget.dart';
import '/components/live/live_widget.dart';
import '/components/newproducts/newproducts_widget.dart';
import '/components/odds/odds_widget.dart';
import '/components/prize/prize_widget.dart';
import '/components/question/question_widget.dart';
import '/components/transparency/transparency_widget.dart';
import '/components/winner/winner_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for header_pc component.
  late HeaderPcModel headerPcModel;
  // Model for odds component.
  late OddsModel oddsModel;
  // Model for transparency component.
  late TransparencyModel transparencyModel;
  // Model for guaranteed component.
  late GuaranteedModel guaranteedModel;
  // Model for Live component.
  late LiveModel liveModel;
  // Model for freeshipping component.
  late FreeshippingModel freeshippingModel;
  // Model for newproducts component.
  late NewproductsModel newproductsModel;
  // Model for prize component.
  late PrizeModel prizeModel;
  // Model for question component.
  late QuestionModel questionModel;
  // Model for winner component.
  late WinnerModel winnerModel;
  // Model for celebrate component.
  late CelebrateModel celebrateModel;
  // Model for footer_pc component.
  late FooterPcModel footerPcModel;
  // Model for footer_mobile component.
  late FooterMobileModel footerMobileModel;

  @override
  void initState(BuildContext context) {
    headerPcModel = createModel(context, () => HeaderPcModel());
    oddsModel = createModel(context, () => OddsModel());
    transparencyModel = createModel(context, () => TransparencyModel());
    guaranteedModel = createModel(context, () => GuaranteedModel());
    liveModel = createModel(context, () => LiveModel());
    freeshippingModel = createModel(context, () => FreeshippingModel());
    newproductsModel = createModel(context, () => NewproductsModel());
    prizeModel = createModel(context, () => PrizeModel());
    questionModel = createModel(context, () => QuestionModel());
    winnerModel = createModel(context, () => WinnerModel());
    celebrateModel = createModel(context, () => CelebrateModel());
    footerPcModel = createModel(context, () => FooterPcModel());
    footerMobileModel = createModel(context, () => FooterMobileModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    headerPcModel.dispose();
    oddsModel.dispose();
    transparencyModel.dispose();
    guaranteedModel.dispose();
    liveModel.dispose();
    freeshippingModel.dispose();
    newproductsModel.dispose();
    prizeModel.dispose();
    questionModel.dispose();
    winnerModel.dispose();
    celebrateModel.dispose();
    footerPcModel.dispose();
    footerMobileModel.dispose();
  }
}
