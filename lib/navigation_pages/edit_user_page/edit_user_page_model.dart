import '/flutter_flow/flutter_flow_util.dart';
import 'edit_user_page_widget.dart' show EditUserPageWidget;
import 'package:flutter/material.dart';

class EditUserPageModel extends FlutterFlowModel<EditUserPageWidget> {
  ///  Local state fields for this page.

  bool isShowFullList = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
