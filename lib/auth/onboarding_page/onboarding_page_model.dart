import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'onboarding_page_widget.dart' show OnboardingPageWidget;
import 'package:flutter/material.dart';

class OnboardingPageModel extends FlutterFlowModel<OnboardingPageWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for emailID widget.
  FocusNode? emailIDFocusNode;
  TextEditingController? emailIDTextController;
  String? Function(BuildContext, String?)? emailIDTextControllerValidator;
  String? _emailIDTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Enter a valid email ID';
    }
    return null;
  }

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Backend Call - API (Registration API)] action in ContinueBtn widget.
  ApiCallResponse? registerUserApi;
  // Stores action output result for [Custom Action - decryptApiResponse] action in ContinueBtn widget.
  String? decryptedRegistrationApi;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    emailIDTextControllerValidator = _emailIDTextControllerValidator;
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    emailIDFocusNode?.dispose();
    emailIDTextController?.dispose();
  }
}
