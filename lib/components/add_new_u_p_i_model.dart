import '/flutter_flow/flutter_flow_util.dart';
import 'add_new_u_p_i_widget.dart' show AddNewUPIWidget;
import 'package:flutter/material.dart';

class AddNewUPIModel extends FlutterFlowModel<AddNewUPIWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('^[\\w\\.\\-_]{3,}@[a-zA-Z]{3,}').hasMatch(val)) {
      return 'Please enter a valid UPI ID';
    }
    return null;
  }

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
