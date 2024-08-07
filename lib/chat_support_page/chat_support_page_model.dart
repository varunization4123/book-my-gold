import '/flutter_flow/flutter_flow_util.dart';
import 'chat_support_page_widget.dart' show ChatSupportPageWidget;
import 'package:flutter/material.dart';

class ChatSupportPageModel extends FlutterFlowModel<ChatSupportPageWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Please enter at least 3 characters';
    }

    return null;
  }

  // Stores action output result for [Gemini - Generate Text] action in Container widget.
  String? geminiOutput;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
