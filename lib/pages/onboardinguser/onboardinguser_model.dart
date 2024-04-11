import '/flutter_flow/flutter_flow_util.dart';
import 'onboardinguser_widget.dart' show OnboardinguserWidget;
import 'package:flutter/material.dart';

class OnboardinguserModel extends FlutterFlowModel<OnboardinguserWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  String? _nameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0yzjimoq' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for adress widget.
  FocusNode? adressFocusNode;
  TextEditingController? adressController;
  String? Function(BuildContext, String?)? adressControllerValidator;
  String? _adressControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '4wqos8yg' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for city widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityController;
  String? Function(BuildContext, String?)? cityControllerValidator;
  String? _cityControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'e6v3rqte' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for country widget.
  FocusNode? countryFocusNode;
  TextEditingController? countryController;
  String? Function(BuildContext, String?)? countryControllerValidator;
  String? _countryControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1w5735pb' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneController;
  String? Function(BuildContext, String?)? phoneControllerValidator;
  String? _phoneControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'v3cimfuh' /* Field is required */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    nameControllerValidator = _nameControllerValidator;
    adressControllerValidator = _adressControllerValidator;
    cityControllerValidator = _cityControllerValidator;
    countryControllerValidator = _countryControllerValidator;
    phoneControllerValidator = _phoneControllerValidator;
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameController?.dispose();

    adressFocusNode?.dispose();
    adressController?.dispose();

    cityFocusNode?.dispose();
    cityController?.dispose();

    countryFocusNode?.dispose();
    countryController?.dispose();

    phoneFocusNode?.dispose();
    phoneController?.dispose();
  }
}
