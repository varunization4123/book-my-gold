import '/components/gold_coin_widget_small_widget.dart';
import '/components/gold_coin_widget_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'withdraw_successful_page_widget.dart' show WithdrawSuccessfulPageWidget;
import 'package:flutter/material.dart';

class WithdrawSuccessfulPageModel
    extends FlutterFlowModel<WithdrawSuccessfulPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for GoldCoinWidget component.
  late GoldCoinWidgetModel goldCoinWidgetModel;
  // Model for GoldCoinWidgetSmall component.
  late GoldCoinWidgetSmallModel goldCoinWidgetSmallModel1;
  // Model for GoldCoinWidgetSmall component.
  late GoldCoinWidgetSmallModel goldCoinWidgetSmallModel2;

  @override
  void initState(BuildContext context) {
    goldCoinWidgetModel = createModel(context, () => GoldCoinWidgetModel());
    goldCoinWidgetSmallModel1 =
        createModel(context, () => GoldCoinWidgetSmallModel());
    goldCoinWidgetSmallModel2 =
        createModel(context, () => GoldCoinWidgetSmallModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    goldCoinWidgetModel.dispose();
    goldCoinWidgetSmallModel1.dispose();
    goldCoinWidgetSmallModel2.dispose();
  }
}
