import '/flutter_flow/flutter_flow_util.dart';
import 'chat_support_page_widget.dart' show ChatSupportPageWidget;
import 'package:flutter/material.dart';

class ChatSupportPageModel extends FlutterFlowModel<ChatSupportPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Gemini - Generate Text] action in Container widget.
  String? geminiOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
