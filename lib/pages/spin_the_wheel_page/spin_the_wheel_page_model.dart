import '/flutter_flow/flutter_flow_util.dart';
import 'spin_the_wheel_page_widget.dart' show SpinTheWheelPageWidget;
import 'package:flutter/material.dart';

class SpinTheWheelPageModel extends FlutterFlowModel<SpinTheWheelPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
