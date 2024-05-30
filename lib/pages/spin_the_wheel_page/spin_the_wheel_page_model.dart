import '/components/game_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'spin_the_wheel_page_widget.dart' show SpinTheWheelPageWidget;
import 'package:flutter/material.dart';

class SpinTheWheelPageModel extends FlutterFlowModel<SpinTheWheelPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for GameButton component.
  late GameButtonModel gameButtonModel;

  @override
  void initState(BuildContext context) {
    gameButtonModel = createModel(context, () => GameButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    gameButtonModel.dispose();
  }
}
