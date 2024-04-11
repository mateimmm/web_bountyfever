import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'c_enter_now_widget.dart' show CEnterNowWidget;
import 'package:flutter/material.dart';

class CEnterNowModel extends FlutterFlowModel<CEnterNowWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for CountControllertickets widget.
  int? countControllerticketsValue;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - API (Stripepaymentlink)] action in Container widget.
  ApiCallResponse? stripelink;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
