import '/flutter_flow/flutter_flow_util.dart';
import 'mobile_sign_in_page_widget.dart' show MobileSignInPageWidget;
import 'package:flutter/material.dart';

class MobileSignInPageModel extends FlutterFlowModel<MobileSignInPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for mobileNumber widget.
  FocusNode? mobileNumberFocusNode;
  TextEditingController? mobileNumberTextController;
  String? Function(BuildContext, String?)? mobileNumberTextControllerValidator;
  String? _mobileNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 10) {
      return 'Requires at least 10 characters.';
    }
    if (val.length > 10) {
      return 'Maximum 10 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    mobileNumberTextControllerValidator = _mobileNumberTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    mobileNumberFocusNode?.dispose();
    mobileNumberTextController?.dispose();
  }
}
