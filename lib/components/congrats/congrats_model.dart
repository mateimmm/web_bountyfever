import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'congrats_widget.dart' show CongratsWidget;
import 'package:flutter/material.dart';

class CongratsModel extends FlutterFlowModel<CongratsWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (getStripepaymentstatus)] action in Container widget.
  ApiCallResponse? apiResultspo;
  // Stores action output result for [Backend Call - Insert Row] action in Container widget.
  PaidordersRow? insertrow;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
