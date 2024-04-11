import '/flutter_flow/flutter_flow_util.dart';
import 'feedback_widget.dart' show FeedbackWidget;
import 'package:flutter/material.dart';

class FeedbackModel extends FlutterFlowModel<FeedbackWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for message widget.
  FocusNode? messageFocusNode;
  TextEditingController? messageController;
  String? Function(BuildContext, String?)? messageControllerValidator;
  String? _messageControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ym2ogdcd' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for competiton widget.
  FocusNode? competitonFocusNode;
  TextEditingController? competitonController;
  String? Function(BuildContext, String?)? competitonControllerValidator;
  String? _competitonControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'rrt09tsa' /* Field is required */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    messageControllerValidator = _messageControllerValidator;
    competitonControllerValidator = _competitonControllerValidator;
  }

  @override
  void dispose() {
    messageFocusNode?.dispose();
    messageController?.dispose();

    competitonFocusNode?.dispose();
    competitonController?.dispose();
  }
}
