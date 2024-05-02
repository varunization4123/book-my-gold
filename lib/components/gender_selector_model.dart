import '/flutter_flow/flutter_flow_util.dart';
import 'gender_selector_widget.dart' show GenderSelectorWidget;
import 'package:flutter/material.dart';

class GenderSelectorModel extends FlutterFlowModel<GenderSelectorWidget> {
  ///  Local state fields for this component.

  String selectedGender = 'Prefer Not to Say';

  bool maleSelected = false;

  bool femaleSelected = false;

  bool pnsSelected = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
